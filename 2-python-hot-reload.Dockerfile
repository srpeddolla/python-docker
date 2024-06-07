# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY gunicorn_app/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire gunicorn_app directory into the container at /app
COPY gunicorn_app /app

# Debug: List the contents of the directory
RUN ls -R /app

# Set PYTHONPATH to /app to ensure Python can find the module
ENV PYTHONPATH=/app

# Make port 8081 available to the world outside this container
EXPOSE 8081

# Define environment variable
ENV NAME World

# Run gunicorn when the container launches
CMD ["gunicorn", "--config", "./conf/gunicorn_config.py", "gunicorn_app:app"]
