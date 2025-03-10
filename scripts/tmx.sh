#!/bin/bash

SESSION_NAME="$1"

if [ -z "$SESSION_NAME" ]; then
  echo "Usage: $0 session_name"
  exit 1
fi

# Check if the session already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
  # Create the session and first window (named 'shell')
  tmux new-session -d -s "$SESSION_NAME" -n "shell"

  # Create second window named 'vim' and start Vim
  tmux new-window -t "$SESSION_NAME:2" -n "vim"
  tmux send-keys -t "$SESSION_NAME:2" "vim" C-m
fi

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
