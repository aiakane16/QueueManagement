FROM gitpod/workspace-full:latest

USER root
# Install custom tools, runtime, etc.
RUN apt-get update && apt-get install -y \
        beanstalkd \
        php7.2-bcmath \
        mysql-server \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

USER gitpod
# Apply user-specific settings

# Give back control
USER root

RUN systemctl start mysql
RUN sudo systemctl enable mysql
