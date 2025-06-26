#!/usr/bin/env bash

# Set the Metabase version
MB_VERSION="v0.55.4"
MB_URL="https://downloads.metabase.com/${MB_VERSION}/metabase.jar"

# Install minimal Java runtime (Amazon Corretto 17)
echo "-----> Downloading Java 17..."
curl -L -o java.tar.gz https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.tar.gz
mkdir -p java && tar -xzf java.tar.gz -C java --strip-components=1
export JAVA_HOME=$(pwd)/java
export PATH="$JAVA_HOME/bin:$PATH"

# Download Metabase if needed
if [ ! -f metabase.jar ]; then
  echo "-----> Downloading Metabase..."
  curl -L -o metabase.jar "$MB_URL"
fi

# Run Metabase with dynamic port
echo "-----> Starting Metabase..."
exec java -DMB_JETTY_PORT=$PORT -jar metabase.jar
