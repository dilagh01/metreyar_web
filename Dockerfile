# Use Flutter's official Docker image
FROM cirrusci/flutter:stable

# Set working directory inside container
WORKDIR /app

# Copy all files into the container
COPY . .

# Get dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Install a simple web server (dhttpd)
RUN dart pub global activate dhttpd

# Expose port 8080
EXPOSE 8080

# Serve the web build
CMD ["dhttpd", "--path", "/app/build/web", "--port", "8080"]
