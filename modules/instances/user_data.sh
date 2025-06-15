#!/bin/bash

# Update system
apt-get update -y
apt-get upgrade -y

# Install Docker
apt-get install -y docker.io
systemctl enable --now docker
usermod -aG docker ubuntu

# Create a directory for FocalBoard data
mkdir -p /opt/focalboard/data

# Run FocalBoard as a Docker container
docker run -d --name focalboard -p 8000:8000 -v /opt/focalboard/data:/opt/focalboard/data --restart unless-stopped mattermost/focalboard:latest