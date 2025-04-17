#!/bin/bash
while IFS=: read -r remote app; do
  if [[ $remote != \#* ]]; then
    flatpak install -y "$remote" "$app"
  fi
done <flatpak-list.txt
