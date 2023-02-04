# The first instruction is what image we want to base our container on
# We use an official Python runtime as a parent image
FROM python:3.9-alpine

# Copy source file and python requirements and set the working directory to /app
#COPY . /app
WORKDIR /app


#RUN apk add --no-cache git

# Fetch the code from Git
#RUN git clone https://github.com/UltiRequiem/flask-calculator.git

RUN python3 -m venv env;source env/bin/activate
RUN pip install flask

# Change the working directory to the cloned repository


# Install any needed packages specified in requirements.txt
RUN pip freeze > requirements.txt
RUN pip install -r requirements.txt
COPY . /app
ENV FLASK_APP=app.py

# Expose port 5000 for Flask to listen on
EXPOSE 5000

# Define the command to run the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]

# Set image's main command and run the command within the container
#ENTRYPOINT ["python"]
#CMD ["app.py"]
