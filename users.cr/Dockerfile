# Use the official Crystal image
FROM crystallang/crystal:latest

# Install required dependencies, including librdkafka
RUN apt-get update && apt-get install -y \
  librdkafka-dev \
  && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy application source code and dependencies
COPY . .

# Install Crystal dependencies
RUN shards install

# Build the application
RUN crystal build --release ./app.cr -o app

# Expose the application port (update as needed)
EXPOSE 3000

# Run the Crystal application
CMD ["./app"]
