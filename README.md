# n8n on Render Deployment

This repository contains the configuration files needed to deploy n8n (workflow automation tool) on Render with PostgreSQL database.

## Features

- ✅ PostgreSQL database support
- ✅ Basic authentication enabled
- ✅ HTTPS protocol
- ✅ Environment-based configuration
- ✅ Auto-generated secure passwords and encryption keys

## Quick Deploy

### Option 1: Using render.yaml (Recommended)

1. Fork this repository to your GitHub account
2. Connect your GitHub account to Render
3. Create a new "Blueprint" in Render and select this repository
4. Render will automatically create both the web service and PostgreSQL database
5. Set your desired username in the `N8N_BASIC_AUTH_USER` environment variable

### Option 2: Manual Setup

1. Create a new PostgreSQL database in Render
2. Create a new Web Service in Render
3. Connect it to this repository
4. Configure the environment variables manually (see below)

## Environment Variables

The following environment variables will be automatically configured when using `render.yaml`:

| Variable | Description | Auto-Generated |
|----------|-------------|----------------|
| `N8N_BASIC_AUTH_USER` | Basic auth username | ❌ (set manually) |
| `N8N_BASIC_AUTH_PASSWORD` | Basic auth password | ✅ |
| `N8N_ENCRYPTION_KEY` | Encryption key for n8n data | ✅ |
| `WEBHOOK_URL` | Webhook URL for n8n | ✅ |
| `DB_POSTGRESDB_*` | Database connection details | ✅ (from database) |

## After Deployment

1. Your n8n instance will be available at your Render service URL
2. Login using the credentials:
   - Username: The value you set for `N8N_BASIC_AUTH_USER`
   - Password: Check the `N8N_BASIC_AUTH_PASSWORD` in your service environment variables
3. Start creating your workflows!

## Customization

### Changing Authentication

To disable basic auth and use n8n's built-in user management:

1. Set `N8N_BASIC_AUTH_ACTIVE` to `false`
2. Remove or comment out the basic auth environment variables
3. Redeploy your service

### Scaling

- Start with the "Starter" plan for both web service and database
- Upgrade as needed based on your workflow complexity and usage

## Support

For n8n-specific issues, visit the [n8n documentation](https://docs.n8n.io/)
For Render deployment issues, check the [Render documentation](https://render.com/docs)
