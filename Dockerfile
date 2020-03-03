FROM ubuntu:18.10
LABEL maintainer="Ravi Shah <ravishah21@gmail.com>"
RUN pip install flask==1.0.2
COPY . /app
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["helloworld.py"]
