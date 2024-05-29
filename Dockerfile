# Use the official Python image as the base image
FROM python:3.12
# Set the working directory in the container
WORKDIR /app

# Copy the application files into the working directory
COPY . /app

RUN pip install --upgrade pip setuptools

# Install the application dependencies
RUN pip install -r requirements.txt

ENV FLASK_APP=index.py

EXPOSE 5000
# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]