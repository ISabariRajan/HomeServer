# Use a base image with Node.js
FROM node:18 AS build-stage

# Set the working directory for the backend
WORKDIR /app

# Copy backend package files and install dependencies
COPY Backend/package*.json ./
RUN npm install

# Copy backend source code
COPY Backend/ .

# Build the backend
RUN npm run build

# Set up the frontend build stage
FROM node:18 AS frontend-stage

# Set the working directory for the frontend
WORKDIR /app/client

# Copy frontend package files and install dependencies
COPY client/package*.json ./
RUN npm install

# Copy frontend source code
COPY client/ .

# Build the frontend
RUN npm run build

# Use a production environment for the final stage
FROM node:18 AS production-stage

# Set the working directory for the final app
WORKDIR /app

# Copy the backend build and node_modules
COPY --from=build-stage /app .

# Copy the frontend build into the backend public folder
COPY --from=frontend-stage /app/client/build ./client/build

# Expose the port the app runs on
EXPOSE 5000

# Command to run the backend server
CMD ["npm", "start"]
