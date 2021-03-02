FROM ubuntu:18.04

LABEL maintainer="Anyama Richard "

# Update and intall tools
RUN apt-get update && apt-get install -y curl unzip apt-transport-https gnupg2

# Download and install aws cli
RUN  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install

# Download and install kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y gettext kubectl