#!/bin/bash
#
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh >24-bit-color.sh
bash 24-bit-color.sh

set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

TESS="sixthpillar_tmux_session"

tmux has-session -t $TESS 2>/dev/null

tmux attach-session -t $TESS

if [ $? != 0 ]; then
    tmux new-session -d -s $TESS -n "sixthpillar"

    tmux new-window -n nvim 
    tmux send-keys -t $TESS:nvim "cd ~/sixthpillar"
    tmux send-keys -t $TESS:nvim "source venv/bin/activate" C-m
    tmux send-keys -t $TESS:nvim "cd backend" C-m
    tmux send-keys -t $TESS:nvim "vim app.py models.py" C-m

    tmux new-window -n app_run
    tmux send-keys -t $TESS:app_run "cd ~/sixthpillar"
    tmux send-keys -t $TESS:app_run "source venv/bin/activate" C-m
    tmux send-keys -t $TESS:app_run "cd backend" C-m

    tmux new-window -n sql_server
    tmux send-keys -t $TESS:sql_server "cd ~/sixthpillar/backend && sqlite3 database.db" C-m

    tmux select-window -t $TESS:nvim

    tmux set -g mouse on
fi
