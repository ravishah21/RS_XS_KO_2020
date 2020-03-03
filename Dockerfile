FROM ubuntu
LABEL maintainer="Ravi Shah <ravishah21@gmail.com>"
RUN apt-get update
RUN apt-get install -y python3
RUN pip install flask
COPY . /app
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["helloworld.py"]
