FROM nvidia/cuda:10.0-cudnn7-devel

WORKDIR /src

RUN apt-get update && \
		apt-get install -y \
        python3 \
        python3-pip \
        python3-setuptools

RUN pip3 install setuptools wheel virtualenv awscli --upgrade 
RUN pip3 install -U scikit-image

COPY . .

ENV LD_LIBRARY_PATH=/usr/local/cuda-10.0/compat/

RUN pip3 install -r requirements.txt
RUN chmod +x run.sh

WORKDIR /src

EXPOSE 8080

CMD ["./run.sh"]


