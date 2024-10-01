# Use the official Crystal base image
FROM crystallang/crystal:1.2.1

# Set the working directory in the container
WORKDIR /app

# Copy the necessary files into the container
COPY . .

# Install dependencies
RUN shards install

# Compile the Crystal code
RUN crystal build --release app.cr

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["./app"]
