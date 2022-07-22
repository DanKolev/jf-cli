FROM fedora:latest

RUN yum install wget -y && yum update -y && yum install python3-pip -y && pip3 install requests && RUN mkdir -p home/jfrog

EXPOSE 8082

EXPOSE 8081

COPY . /home/jfrog

WORKDIR /home/jfrog

RUN wget -O artifactory-pro.rpm "https://releases.jfrog.io/artifactory/artifactory-pro-rpms/jfrog-artifactory-pro/jfrog-artifactory-pro-[RELEASE].rpm"

RUN yum install ./artifactory-pro.rpm -y && systemctl start artifactory.service

RUN pip3 install .

CMD ["jf"]

