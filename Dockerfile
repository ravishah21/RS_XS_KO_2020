FROM python:3.6
COPY . /app
WORKDIR /app
RUN pip install -r flask==1.0.2
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]
