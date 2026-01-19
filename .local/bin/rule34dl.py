#!/usr/bin/env python3

import sys
from http.cookiejar import MozillaCookieJar
from playwright.sync_api import sync_playwright, TimeoutError as PlaywrightTimeout

def load_netscape_cookies(path):
    jar = MozillaCookieJar(path)
    jar.load(ignore_discard=True, ignore_expires=True)

    cookies = []
    for c in jar:
        cookies.append({
            "name": c.name,
            "value": c.value,
            "domain": c.domain.lstrip("."),
            "path": c.path,
            "secure": c.secure,
            "httpOnly": c.has_nonstandard_attr("HttpOnly"),
            "expires": c.expires if c.expires else -1,
            "sameSite": "Lax",
        })
    return cookies

def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <playlist_url> <cookies.txt>")
        sys.exit(1)

    playlist_url = sys.argv[1]
    cookies_path = sys.argv[2]

    cookies = load_netscape_cookies(cookies_path)

    with sync_playwright() as p:
        browser = p.firefox.launch(headless=False)  # headful is more stable here
        context = browser.new_context()
        context.add_cookies(cookies)

        page = context.new_page()
        page.goto(playlist_url)

        seen = set()

        while True:
            # --- collect current page ---
            thumbs = page.locator(".th.js-open-popup")
            count = thumbs.count()

            for i in range(count):
                href = thumbs.nth(i).get_attribute("href")
                if href and href not in seen:
                    seen.add(href)
                    print(href)

            # --- find next button fresh each time ---
            next_btn = page.locator(
                'a[data-action="ajax"] svg.custom-right'
            ).locator("..")

            if next_btn.count() == 0:
                break

            # --- force click (overlay-safe) ---
            next_btn.scroll_into_view_if_needed()
            next_btn.click(force=True)

            # --- wait for BlockUI overlay cycle ---
            try:
                page.wait_for_selector(".blockUI.blockOverlay", state="attached", timeout=5000)
                page.wait_for_selector(".blockUI.blockOverlay", state="detached", timeout=15000)
            except PlaywrightTimeout:
                # If overlay timing is weird, continue anyway
                pass

            # --- wait for new content (DOM change, not network) ---
            page.wait_for_timeout(300)  # small debounce

        browser.close()

if __name__ == "__main__":
    main()

