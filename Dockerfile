# Use the official Node.js runtime as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application files
COPY . .

# Create n8n data directory
RUN mkdir -p /app/.n8n

# Set environment variables
ENV N8N_USER_FOLDER=/app/.n8n
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000

# Expose port
EXPOSE 10000

# Create non-root user
RUN addgroup -g 1001 -S n8n && \
    adduser -S n8n -u 1001 -G n8n

# Change ownership of the app directory
RUN chown -R n8n:n8n /app

# Switch to non-root user
USER n8n

# Start n8n
CMD ["npm", "start"]
