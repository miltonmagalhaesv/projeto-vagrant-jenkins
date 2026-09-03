#!/usr/bin/env bash
set -e

sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install -y fontconfig openjdk-21-jre git curl

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key \
  | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install -y jenkins

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo systemctl enable jenkins
sudo systemctl start jenkins
