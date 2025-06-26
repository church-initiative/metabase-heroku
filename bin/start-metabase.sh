#!/usr/bin/env bash

# Set Metabase version
MB_VERSION="v0.52.9"
MB_URL="https://downloads.metabase.com/${MB_VERSION}/metabase.jar"

# Install Java at runtime (Amazon Corretto 11)
echo "-----> Installing Java..."
curl -L -o java.tar.gz https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz
mkdir -p java && tar -xzf java.tar.gz -C java --strip-components=1
export JAVA_HOME=$(pwd)/java
export PATH="$JAVA_HOME/bin:$PATH"

# Download Metabase JAR if not present
if [ ! -f metabase.jar ]; then
  echo "-----> Downloading Metabase..."
  curl -L -o metabase.jar "$MB_URL"
fi

# Start Metabase on the Heroku-assigned port
echo "-----> Starting Metabase on port $PORT..."
exec java -DMB_JETTY_PORT=$PORT -jar metabase.jar
