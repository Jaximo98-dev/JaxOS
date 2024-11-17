#!/usr/bin/env bash

watch_dirs=(
  "/home/jaximo/personal/vaults/vault1"
  "/home/jaximo/personal/vaults/vault2"
  "/home/jaximo/university/university-repo"
)

for dir in "${watch_dirs[@]}"; do
  (
    cd "$dir" || exit
    echo "Watching for changes in $dir..."
    while inotifywait -r -e modify,create,delete,move .; do
      echo "Change detected in $dir"
      git add .
      git commit -m "Auto-sync: changes detected $(date)"
      git push || echo "Error while pushing changes $dir. Verify connection."
    done
  ) &
done

wait
