# Use the base Nginx image
FROM nginx:latest

# Copy the contents of the website folder to the Nginx document root
COPY website/ /usr/share/nginx/html/

# Expose port 80 to allow incoming HTTP traffic
EXPOSE 80

# Start the Nginx server when the container starts
CMD ["nginx", "-g", "daemon off;"]
