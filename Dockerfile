FROM nvidia/cuda:10.0-cudnn7-devel

WORKDIR /src

RUN apt-get update && \
		apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools

RUN pip3 install setuptools wheel virtualenv awscli --upgrade 

RUN apt install python-pip

RUN pip install -U scikit-image && \
        make

RUN make

WORKDIR /src

COPY . .

EXPOSE 5000

CMD ["./train.sh"]


