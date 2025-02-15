# Use the official Node.js image from the Docker Hub
FROM node:23-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN yarn build

# Expose the port that the application will run on
EXPOSE 3000

# Command to run the application
CMD ["yarn", "start"]