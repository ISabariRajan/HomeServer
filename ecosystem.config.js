module.exports = {
    apps: [
      // Define the FastAPI app
      {
        name: 'fastapi',
        script: './Core/app.py',
        port: 8000,
        exec_mode: 'fork',
        instances: 'max:2',
        env: {
          NODE_ENV: 'development'
        },
      },
      // Define the React app
      {
        name: 'react',
        script: './dist/index.js',
        port: 3000,
        exec_mode: 'cluster',
        instances: 'max:2',
        env: {
          NODE_ENV: 'development'
        },
      },
    ],
  };
  