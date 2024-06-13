FROM debian:bookworm

WORKDIR /app

# Install gnupg, and Node.js, and update npm to the latest version
RUN apt-get update && \
    apt-get install -y gulp npm nodejs curl && \
    npm install -g npm@latest

# Copy package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js application
RUN gulp clean
RUN gulp build

# Set environment variables
ENV PORT=9000

# Expose the port the app runs on
EXPOSE 9000

# Start the application
CMD ["gulp", "serve:dist"]
