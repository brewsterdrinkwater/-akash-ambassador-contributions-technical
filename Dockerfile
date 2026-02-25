FROM nginx:alpine

# Copy HTML file into the nginx web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

# nginx runs in the foreground
CMD ["nginx", "-g", "daemon off;"]
