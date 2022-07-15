FROM python:3.10.5

RUN apt-get update \
    && apt-get install -y git

ADD . / 

RUN pip3 install .

CMD ["jf"]