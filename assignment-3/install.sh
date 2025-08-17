#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "✅ Updating instance..."
sudo yum update -y

echo "☕ Installing Java 21..."
sudo dnf install java-21-amazon-corretto -y

echo "📦 Installing Maven..."
sudo yum install -y maven

echo "🔧 Installing Git..."
sudo yum install -y git

echo "📥 Cloning GitHub repo..."
cd /home/ec2-user
git clone https://github.com/Trainings-TechEazy/test-repo-for-devops.git

cd test-repo-for-devops || {
  echo "❌ Failed to enter project directory"
  exit 1
}

echo "🏗️  Building the project with Maven..."
mvn clean package

echo "🚀 Running the app in background..."
nohup java -jar target/hellomvc-0.0.1-SNAPSHOT.jar > app.log 2>&1 &

echo "⏳ Waiting for the app to start..."
sleep 10

echo "🌐 Fetching public IP..."
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

echo "🔎 Testing the app at http://$PUBLIC_IP:8080/hello ..."
curl --retry 3 --connect-timeout 5 http://$PUBLIC_IP:8080/hello || echo "⚠️ App did not respond as expected."

echo "✅ Setup complete!"

