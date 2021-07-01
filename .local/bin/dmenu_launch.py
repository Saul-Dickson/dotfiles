#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""\
Simple dmenu launcher for passwords, docs, notes and application shortcuts.

Requirements
---------------
  - dmenu, gpg, pass, xclip, exo-open, pkill

Usage
---------------
  $ dmenu_launch.py [-h] [--pass | --apps | --notes]

Arguments
---------------
  -h, --help  show this help message and exit
  --pass      Chooses a password from password store.
  --apps      Quick launches a desktop application with exo-open.
  --notes     Opens a text/markdown note from a given directory with exo-open.
  --search    Quick search and launch from a given directory with exo-open.


Contact / Links
---------------
author : Felipe Silveira <felipe.alexandre@gmail.com>
link   : https://github.com/fsilveir/dmenu-launch

"""
import os
import sys
import argparse
import subprocess

from collections import namedtuple
from distutils.spawn import find_executable

def main():
    check_req_utils()

    args   = get_args()
    scheme = dmenu_setup(args)
    choice = dmenu_input(scheme)
    take_action(scheme, choice)

def check_req_utils():
    """Checks if dmenu and other mandatory utilities can be found on target machine."""
    utils = (['dmenu', 'gpg', 'pass', 'xclip', 'exo-open', 'pkill'])
    for util in utils:
        if find_executable(util) is None:
            print("ERROR: Util '{}' is missing, install it before proceeding! Exiting!".format(util))
            sys.exit(1)

def check_dir_exist(scheme):
    """Checks required directories are present."""
    if os.path.exists(scheme.prefix) is False:
        print("ERROR: Required directory '{}' is missing! Exiting!").format(scheme.prefix)
        sys.exit(1)

def get_args():
    """Return arguments from stdin or print usage instructions."""
    parser = argparse.ArgumentParser(description='Simple dmenu launcher for passwords, notes and application shortcuts.')
    group = parser.add_mutually_exclusive_group()

    group.add_argument('--pass', dest='passw', action='store_true',
                        help='Copy password from password store.')
    group.add_argument('--apps', action='store_true',
                        help='Quick launches a desktop application with exo-open.')
    group.add_argument('--notes', action='store_true',
                        help='Opens a text/markdown note from a given directory with exo-open.')
    group.add_argument('--search', action='store_true',
                        help='Quick search and launch from a given directory with exo-open.')

    if not len(sys.argv) > 1:
        parser.print_help()
        sys.exit(1)

    return parser.parse_args()

def dmenu_setup(args):
    """Setup dmenu font, color and size based on user's input."""
    scheme = namedtuple(
                        'dmenu',
                         [
                          'target',             # pass / apps/ notes / search
                          'prefix',             # location prefix (base dir)
                          'suffix',             # file extension to look for
                          'font',               # dmenu font name and size
                          'nb','nf','sb','sf',  # dmenu color:
                                                #   n=normal / s=selected,
                                                #   b=background, f=foreground
                         ])

    dmenu = ""
    if args.passw:
        dmenu = scheme(
                    target='pass',
                    prefix = os.getenv\
                        ('PASSWORD_STORE_DIR',os.path.normpath
                            (os.path.expanduser\
                                ('~/.password-store')\
                            )\
                        ),
                    suffix=".gpg",
                    font='Dejavu Sans Mono:medium:size=18',
                    nb='#191919', nf='#ff0000', sb='#ff9318', sf='#191919',
                  )
    if args.apps:
        dmenu = scheme(
                    target='apps',
                    prefix="/usr/share/applications",
                    suffix=".desktop",
                    font='Dejavu Sans Mono:medium:size=18',
                    nb='#191919', nf='#2e9ef4', sb='#2e9ef4', sf='#191919',
                  )
    if args.notes:
        dmenu = scheme(
                    target='notes',
                    prefix=os.path.expanduser('~/git/notes'),
                    suffix=".md",
                    font='Dejavu Sans Mono:medium:size=18',
                    nb='#191919', nf='#2aa198', sb='#2aa198', sf='#191919',
                   )
    if args.search:
        dmenu = scheme(
                    target='search',
                    prefix=os.path.expanduser('~/work'),
                    suffix="",
                    font='Dejavu Sans Mono:medium:size=18',
                    nb='#191919', nf='#2aa198', sb='#11D91E', sf='#191919',
                   )
    
    check_dir_exist(dmenu)
    return dmenu

def dmenu_input(scheme):
    """Builds dmenu list of options and returns the value selected by user."""
    choices = []
    for basedir, dirs , files in os.walk(scheme.prefix, followlinks=True):
        dirs.sort()
        files.sort()

        dirsubpath = basedir[len(scheme.prefix):].lstrip('/')
        for f in files:
            if f.endswith(scheme.suffix):
                full_path = os.path.join(dirsubpath, f.replace(scheme.suffix, '', -1))
                choices += [full_path]

    args = ["-c", "-l", "15",
            "-i" ]
    dmenu = subprocess.Popen(['dmenu'] + args,
                             stdin=subprocess.PIPE,
                             stderr=subprocess.PIPE,
                             stdout=subprocess.PIPE)

    choice_lines = '\n'.join(map(str, choices))
    choice, errors = dmenu.communicate(choice_lines.encode('utf-8'))

    if dmenu.returncode not in [0, 1] \
       or (dmenu.returncode == 1 and len(errors) != 0):
        print("'{} {}' returned {} and error:\n{}"
              .format(['dmenu'], ' '.join(args), dmenu.returncode,
                      errors.decode('utf-8')))
        sys.exit(1)

    choice = choice.decode('utf-8').rstrip()

    return (scheme.prefix + "/" + choice + scheme.suffix) if choice in choices else sys.exit(1)

def take_action(scheme, choice):
    """Copies password to clipboard, launch app / notes depending on input."""
    
    xclip_cleanup()
    
    if (scheme.target == "pass"):
        _target = (str(choice).replace(scheme.prefix,'',-1))
        target = (_target[1:].replace(scheme.suffix,'',-1))

        # Copies the username to middle button clipboard
        username = target.rsplit('/',1)[1].strip('\n')
        run_subprocess('echo "{}" | xclip'.format(username))

        # Copy password to clipboard for 45 seconds
        run_subprocess('pass show -c "{}"'.format(target))

    if (scheme.target == "notes"):
        run_subprocess('exo-open "{}"'.format(choice))

    if (scheme.target == "apps") or (scheme.target == "search"):
        run_subprocess('exo-open "{}"'.format(choice))

def run_subprocess(cmd):
    """Handler for shortening subprocess execution."""
    subprocess.Popen(cmd, stdin =subprocess.PIPE,
                          stderr=subprocess.PIPE,
                          stdout=subprocess.PIPE,
                          shell=True,)

def xclip_cleanup():
    """Clean-up xclip processes that might be hung."""
    run_subprocess('pkill xclip')

# ------------------------------------------------------------------------------
# Main
# ------------------------------------------------------------------------------
if __name__ == "__main__":
    main()
# ------------------------------------------------------------------------------
# EOF
# ------------------------------------------------------------------------------
