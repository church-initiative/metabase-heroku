#!/bin/bash

# Specify the Metabase version
METABASE_VERSION=v0.55.4

# Download Metabase JAR if it doesn't exist
if [ ! -f metabase.jar ]; then
  echo "Downloading Metabase $METABASE_VERSION..."
  curl -L -o metabase.jar https://downloads.metabase.com/$METABASE_VERSION/metabase.jar
fi

# Run Metabase
echo "Starting Metabase..."
java -jar metabase.jar
