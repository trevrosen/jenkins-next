**(work in progress)**

This repo contains code for maintaining a Jenkins CI setup on a Docker
host. The goal of the project is for the Jenkins CI server itself to be maintained as a Docker image

### Setup
1. Build the latest version of the image: `docker build -t vox/jenkins .`

2. Run the container: `docker run -p 8080:8080 vox/jenkins`


### Why?
Jenkins should be able to be brought back to life effortlessly if something happens to it. It should also be easy to keep all of the plugins and configuration under version control, as well as create new environments on-demand with Docker. This repo accomplishes all of those goals.

### What will this do eventually?

- Build every PR against `master` on any projects we want
- Visualize all builds as [pipelines](https://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin)
- Allow early fail of quick build steps
- Power awesome, potentially whimsical [information radiators](https://www.atlassian.com/wallboahttps://wiki.jenkins-ci.org/display/JENKINS/Build+Pipeline+Plugin
- Keep all configuration sync'd to GitHub in a special repo
- Help us add new steps easily, such as coverage/documenation enforcement