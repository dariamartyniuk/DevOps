# Stage 1: Build stage
FROM python:3.9-slim as build

# Set the working directory in the build image
WORKDIR /app

# Copy the requirements file to the build stage
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the build stage
COPY app.py .

# Stage 2: Runtime stage
FROM python:3.9-alpine as runtime

# Set the working directory in the runtime image
WORKDIR /app

# Copy the dependencies and application from the build stage
COPY --from=build /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=build /app .

# Expose the application port
EXPOSE 5000

# Run the Python application
CMD ["python", "app.py"]
