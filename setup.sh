#!/bin/bash

# Create the basic Jenkins environment:
# -- ensure that the volume is installed in a sane place
# -- grab all plugins and place them in the volume dir so they will persist between container starts

if [[ -z "$1" ]]; then
  echo "Usage: must supply base directory path for container volume mounts"
  echo "Example: './setup.sh /usr/local/var/docker'"
  exit 1
fi

# The base dir on the Docker host where all mounted volume directories live
DOCKER_DATA_ROOT=$1

# A dir you could mount in the container as the Jenkins home dir
JENKINS_MOUNT_VOLUME=$DOCKER_DATA_ROOT/jenkins

# The place for plugin files
JENKINS_PLUGIN_DIRECTORY=$JENKINS_MOUNT_VOLUME/plugins

# The base URL for all Jenkins plugins
JENKINS_PLUGINS_REMOTE_URL_BASE="https://updates.jenkins-ci.org/latest"

mkdir -p $JENKINS_PLUGIN_DIRECTORY

echo "[-] Downloading all plugins"
cd $JENKINS_PLUGIN_DIRECTORY

#
# --- Install Plugins ---
#
declare -a plugins=("github.hpi" "jobConfigHistory.hpi" "parameterized-trigger.hpi" "build-pipeline-plugin.hpi" "scm-sync-configuration.hpi")

for plugin in "${plugins[@]}"
do
  echo "[-] Installing $plugin"
  echo "[-] Source: $JENKINS_PLUGINS_REMOTE_URL_BASE/$plugin"
  curl -L -O $JENKINS_PLUGINS_REMOTE_URL_BASE/$plugin
done

