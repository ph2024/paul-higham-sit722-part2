# Dockerfile for book_catalog microservice
FROM python:3.11-alpine
# this defines the base image for docker to use to make the image.

WORKDIR /app/
# this defines the work directory for the docker image. All other paths become relative to this.  

COPY book_catalog/requirements.txt .
# this copies the packages required for the image from the source directory to installti image work directory

RUN pip install --no-cache-dir -r requirements.txt
# this installs the dependencies listed in the packages copied to the work directory

COPY /book_catalog .
# this copies all the code within the source folder 

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] 
# this starts the microservice applicable for python