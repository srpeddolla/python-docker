FROM docker.io/python:3.10

# Create app directory
WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install  --no-cache-dir -r requirements.txt

ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0:8080 --chdir=./gunicorn_app/"

# Bundle app source
COPY . .

EXPOSE 8080
CMD ["gunicorn", "--config", "./conf/gunicorn_config.py", "gunicorn_app.server:app"]
