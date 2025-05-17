#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🛠️ Starting Docker & Portainer Installation..."

# Update package list
apt update -y

# Install curl
echo "📦 Installing curl..."
apt install curl -y

# Install Docker using the official script
echo "🐳 Installing Docker..."
curl -sSL https://get.docker.com/ | sh

# Enable and start Docker service
echo "🔧 Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

# Check Docker status (non-interactive)
if systemctl is-active --quiet docker; then
  echo "✅ Docker service is running."
else
  echo "❌ Docker service failed to start."
  exit 1
fi

# Install docker-compose
echo "📦 Installing docker-compose..."
apt install docker-compose -y

# Create data directory
echo "📁 Creating /data directory..."
mkdir -p /data
cd /data

# Create Docker volume for Portainer
echo "📦 Creating Docker volume for Portainer..."
docker volume create portainer_data

# Run Portainer container
echo "🚀 Launching Portainer container..."
docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

# Install Git
echo "📦 Installing Git..."
apt install git -y

echo "✅ Installation and setup completed successfully!"
