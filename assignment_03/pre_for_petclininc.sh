#!/bin/bash

set -e

echo "Updating package list"
sudo apt update

echo "Installing required dependencies"
sudo apt install -y software-properties-common curl gnupg

echo "Adding OpenJDK PPA repository"
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt update

echo "Installing OpenJDK 17"
sudo apt install -y openjdk-17-jdk

echo "Java installation complete"
java -version

echo "Installing Maven"
sudo apt install -y maven

echo "Maven installation complete"
mvn -v

git --version
echo "-----------------------------------------------------------"
echo "Now We are ready to run spring pet clinic"

echo "Cloning Spring PetClinic project"
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic

echo "Building project using Maven Wrapper (./mvnw)..."
./mvnw package -DskipTests

echo "Running Spring PetClinic on port 8081..."
java -jar target/*.jar --server.port=8081

# torun in background use this command
# nohup java -jar target/*.jar --server.port=8081 > output.log 2>&1 &

