FROM fabric8/jenkins-jnlp-client

LABEL maintainer "gyorgy.novak@loxxly.com"

RUN yum makecache fast
RUN yum -y update
RUN yum install -y curl openssl sudo which
RUN yum -y clean all;

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Helm
RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
