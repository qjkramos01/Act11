# Use Ubuntu base image
FROM ubuntu:20.04

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and MySQL
RUN apt update && apt install -y apache2 mysql-server && apt clean

# Copy dummy website to web directory
COPY index.html /var/www/html/index.html

# Expose necessary ports
EXPOSE 80 3306

# Start both services
CMD service mysql start && apachectl -D FOREGROUND
