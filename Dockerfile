# Use the official Python image as the base image
FROM python:3.11
# Set the working directory in the container
WORKDIR /app

# Copy the application files into the working directory
COPY . /app
RUN pip install contourpy==1.2.1
# Copy the keras-ocr wheel file into the container
COPY keras-ocr-0.8.4-py3-none-any.whl /app/

# Install keras-ocr from the wheel file
RUN pip install /app/keras-ocr-0.8.4-py3-none-any.whl
# Install the application dependencies
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip install -r requirements.txt

ENV FLASK_APP=index.py

EXPOSE 5000
# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]