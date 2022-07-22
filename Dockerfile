FROM fedora:latest

RUN yum install wget -y && yum update -y && yum install python3-pip -y && pip3 install requests

RUN mkdir -p home/jfrog

ADD . /

EXPOSE 8082

EXPOSE 8081

RUN wget -O artifactory-pro.rpm "https://releases.jfrog.io/artifactory/artifactory-pro-rpms/jfrog-artifactory-pro/jfrog-artifactory-pro-[RELEASE].rpm" \
    && yum install ./artifactory-pro.rpm -y

RUN pip3 install .

CMD ["jf"]

