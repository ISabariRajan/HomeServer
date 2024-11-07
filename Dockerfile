# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install common dependencies needed for building and running both FastAPI and React applications
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements files to the container
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container's workspace
COPY Core /usr/src/app/Core
COPY client /usr/src/app/client

# Build the React app and store it in a separate directory
WORKDIR /usr/src/app/client
RUN npm ci --quiet && \
    npx build:react

# Move the output of the build to the parent workspace
COPY build /usr/src/app/dist

# Build the FastAPI application and store it in a separate directory
WORKDIR /usr/src/app/Core
RUN pip install fastapi uvicorn gunicorn
RUN python -m fastapi.main:app --title "My API" > /dev/null

# Create a script to start both services with pm2
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
