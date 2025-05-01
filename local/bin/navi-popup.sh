#!/bin/bash
target=$(tmux display-message -p '#{pane_id}')
$SHELL --login -i -c "navi --print | head -n 1 | tmux load-buffer -b tmp - ; tmux paste-buffer -p -t $target -b tmp -d"

