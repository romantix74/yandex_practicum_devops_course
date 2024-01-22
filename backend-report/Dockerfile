FROM python:latest
RUN mkdir /app
# ADD app /app
ADD app.py /app/app.py
ADD requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080