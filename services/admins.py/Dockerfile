# Use official Python image as base
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose the Flask port
EXPOSE 5001

# Set environment variables for Flask
ENV FLASK_APP=app.py \
    FLASK_RUN_HOST=0.0.0.0 \
    FLASK_ENV=production

# Run the Flask app
CMD ["flask", "run"]
