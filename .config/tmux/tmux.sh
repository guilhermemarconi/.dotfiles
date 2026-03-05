#!/bin/bash

SESSION="config-tmux"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESSION -n "config"

	tmux send-keys -t $SESSION:config "cd tmux" C-m
	tmux send-keys -t $SESSION:config "nvim" C-m
fi

tmux attach-session -t $SESSION:config

