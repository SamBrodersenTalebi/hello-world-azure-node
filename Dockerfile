# Use the specified Node.js version
FROM node:latest

# Create a directory to hold the application code inside the image
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code into the image
COPY . .

# Expose the port the app runs on (this should match what's in your Node.js app)
EXPOSE 3000

# Command to run the application
CMD ["node", "app.js"]