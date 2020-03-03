FROM ubuntu:18.10
LABEL maintainer="Ravi Shah <ravishah21@gmail.com>"
RUN apt-get update -y
RUN apt-get install -y python3 python3-dev python3-pip nginx
RUN pip3 install uwsgi
RUN pip install flask==1.0.2
COPY . /app
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["helloworld.py"]
