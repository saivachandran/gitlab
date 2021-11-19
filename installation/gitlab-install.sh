## cat gitlab_install.sh 

#!/bin/bash
sudo docker run --detach \
  --hostname gitlab.example.com \
  --publish 10.128.0.5:443:443 \
  --publish 10.128.0.5:80:80 \
  --publish 10.128.0.5:2222:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  gitlab/gitlab-ee:latest


# run shell script to install gitlab

$ sh gitlab_install.sh

## reset git root password in docker container

# inside container shell

sudo gitlab-rake "gitlab:password:reset[root"


