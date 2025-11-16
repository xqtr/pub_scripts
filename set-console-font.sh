#!/bin/bash

ls -1 /usr/share/consolefonts/ | fzf --bind 'enter:execute(setfont /usr/share/consolefonts/{})'
