#!/bin/bash

# List of directories to compress
directories=(
  "ansible_cfg_output_formatting"
  "app"
  "awx"
  "collection"
  "deployments-balancer"
  "docker"
  "files"
  "githubCI"
  "groupvars_demo"
  "handlers"
  "hostvars_demo"
  "inventory"
  "jenkins"
  "linting"
  "molecule"
  "molecule_podman"
  "roles_manually"
  "roles_using_galaxy"
  "sssd_playbook"
  "tasks"
  "vars"
  "vault"
  "venv"
)

# Loop over the directories and compress each one individually
for dir in "${directories[@]}"; do
  if [ -d "$dir" ]; then  # Check if directory exists
    echo "Compressing $dir..."
    tar -czvf "$dir.tar.gz" "$dir"
  else
    echo "Directory $dir does not exist, skipping..."
  fi
done

echo "Compression completed!"

