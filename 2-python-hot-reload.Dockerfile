FROM docker.io/python:3.10

WORKDIR /app

# Install app dependencies
COPY . .

COPY gunicorn_app/requirements.txt ./

RUN pip install  --no-cache-dir --upgrade -r requirements.txt

# Bundle app source

EXPOSE 8080

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:create_app()"]