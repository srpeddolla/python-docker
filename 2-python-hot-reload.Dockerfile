FROM docker.io/python:3.10

WORKDIR /app

# Install app dependencies
COPY requirements.txt ./

RUN pip install  --no-cache-dir -r requirements.txt

# Bundle app source
COPY . .

EXPOSE 8080

CMD ["gunicorn", "app:app"]