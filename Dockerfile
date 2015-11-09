FROM jenkins

MAINTAINER Trevor Rosen <trevor.rosen@voxmedia.com>

ENV JENKINS_HOME="/var/jenkins_home"
ENV JENKINS_PLUGINS_DIR="$JENKINS_HOME/plugins"



#
# -- Plugins --
#


ENV JENKINS_PLUGINS_REMOTE_URL_BASE="https://updates.jenkins-ci.org/latest"
RUN "mkdir -p $JENKINS_PLUGINS_DIR"
#WORKDIR "$JENKINS_PLUGINS_DIR"

#
# Download all plugins
#

# -- github --
# https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin
#RUN /usr/bin/curl -O $JENKINS_PLUGINS_REMOTE_URL_BASE/github.hpi
#RUN "/usr/bin/curl -O https://updates.jenkins-ci.org/latest/github.hpi"

## -- job configuration history --
## https://wiki.jenkins-ci.org/display/JENKINS/JobConfigHistory+Plugin
#RUN /usr/bin/curl -O $JENKINS_PLUGINS_REMOTE_URL_BASE/jobConfigHistory.hpi

## -- paramterized trigger --
## https://wiki.jenkins-ci.org/display/JENKINS/Parameterized+Trigger+Plugin
#RUN "curl -O $JENKINS_PLUGINS_REMOTE_URL_BASE/paramterized-trigger.hpi"

## -- pipeline --
## https://wiki.jenkins-ci.org/display/JENKINS/Delivery+Pipeline+Plugin
#RUN "curl -O $JENKINS_PLUGINS_REMOTE_URL_BASE/build-pipeline-plugin.hpi"

## -- scm config sync --
## https://wiki.jenkins-ci.org/display/JENKINS/SCM+Sync+configuration+plugin
#RUN "curl -O $JENKINS_PLUGINS_REMOTE_URL_BASE/scm-sync-configuration"


## Perform a 'safe-restart' to make all plugins available
#RUN "java -jar jenkins-cli.jar -s http://127.0.0.1:8080/ safe-restart"


#
# -- configuration
#

# Restore configuration from backup repo
