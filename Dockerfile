FROM jenkins

MAINTAINER Trevor Rosen <trevor.rosen@voxmedia.com>

#
# -- Plugins --
#  use scripts that come with the Jenkins image to setup plugins
#
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


#
# -- configuration
#

# Restore configuration from backup repo
