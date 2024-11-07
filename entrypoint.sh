#!/bin/sh

# Start the FastAPI application using pm2
pm2 start ecosystem.config.js --name "fastapi" -- run app.py

# Execute the following command if the container is stopped or restarted
if [ -f /usr/src/app/dist/index.html ]; then
  # Start the React application using pm2
  pm2 start ecosystem.config.js --name "react" -- run -t start -- start
fi
