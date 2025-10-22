FROM mysql:8.0

# Set environment variables
ENV MYSQL_ROOT_PASSWORD=vscproject
ENV MYSQL_DATABASE=productdb
ENV MYSQL_USER=root2
ENV MYSQL_PASSWORD=vscproject

# Expose MySQL default port
EXPOSE 3306

# Use a volume for data persistence
VOLUME ["/var/lib/mysql"]

# Health check (helps Render detect readiness)
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD mysqladmin ping -h 127.0.0.1 -p${MYSQL_ROOT_PASSWORD} || exit 1
