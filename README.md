# Saul Dickson's Dotfiles

<div align="center">
<h4>
<a href="#Install">Install</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#Programs">Programs</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</h4>
</div>

## Install
Copy and paste this into your terminal:

```
git clone https://github.com/Saul-Dickson/dotfiles \
    $HOME/.local/src/github.com/Saul-Dickson/dotfiles \
    && chmod +x $HOME/.local/src/github.com/Saul-Dickson/dotfiles/install.sh
```

This will clone the install script into it's hardcoded, required directory.
After that's done, you can install everything with the following command:

`$HOME/.local/src/github.com/Saul-Dickson/dotfiles/install.sh --install`

For more options on the install script, simply replace `--install` with `-h`.

## Programs

<div align="center">
<h4>
<a href="#editor-neovim">Editor</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#pager-bat">Pager</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#shell-zsh">Shell</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#file-manager-nnn">File Manager</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#browser-zen">Browser</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#email-client-mailspring">Email Client</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="#ebook-reader-epy">Ebook Reader</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</h4>
</div>
<hr/>

#### Editor: [neovim](https://github.com/neovim/neovim)

It's got a bunch of plugins, but I don't mind personally.

#### Shell: [zsh](http://zsh.sourceforge.net)

Same thing here, bunch of plugins. I like how my shell is set up :).

#### Browser: [zen-browser](https://zen-browser.app/)

Still in alpha, this one. I like the UI so far, might change back to brave or
firefox at some point though.

#### Email Client: [mailspring](https://www.getmailspring.com/)

I'm not quite used to this atm, I like it so far, but it's still early days.

#### File Manager: [nnn](https://github.com/jarun/nnn)

Don't use it all that often, so my config is a bit barebones.

#### Pager: [bat](https://github.com/sharkdp/bat)

Really like this one. Can be a bit of a pain in the arse at times though.

#### Ebook Reader: [epy](https://github.com/wustho/epy)

#### `find` Alternative: [fd](https://github.com/sharkdp/fd)

`fd` but written in rust. Don't particularly care about that last bit.

#### `ls` Alternative: [exa](https://github.com/ogham/exa)

`ls` but pretty.

#### `grep` Alternative: [ripgrep](https://github.com/BurntSushi/ripgrep)

`grep` but fast, what more does it need to be?

#### `rm` Alternative: [trash-cli](https://github.com/sindresorhus/trash-cli)

`rm` but unnecessary. Might get rid of this at some point, but it's kinda
useful.
