# Monitoring Stack with Docker and Caddy

This project deploys a secure monitoring stack using **Cacti**, **Nagios**, **Uptime-Kuma** and **Caddy** for automatic HTTPS reverse proxy.

## 🌐 Subdomains
- `https://cacti.monitor.example.net`
- `https://nagios.monitor.example.net`
- `https://uptime.monitor.example.net`

## 🧱 Stack Overview
- **Caddy**: Reverse proxy with automatic SSL (Let's Encrypt)
- **Cacti**: SNMP-based performance monitoring
- **Nagios**: Infrastructure and service monitoring
- **Uptime-Kuma**: Infrastructure and service monitoring
- **MariaDB**: Database backend for Cacti

## 🚀 Deployment Instructions

### 1. DNS Setup
Ensure the following DNS A records point to your server:

| Subdomain                         | IP Address         |
|----------------------------------|--------------------|
| cacti.monitor.example.net | YOUR_PUBLIC_IP     |
| nagios.monitor.example.net | YOUR_PUBLIC_IP     |
| uptime.monitor.example.net | YOUR_PUBLIC_IP     |

### 2. Launch with Docker
```bash
docker compose up -d
```

### 3. Access Dashboards
- Cacti: https://cacti.monitor.example.net
- Nagios: https://nagios.monitor.example.net
- Uptime-Kuma: https://uptime.monitor.example.net

## 📁 Folder Structure
```
monitoring-stack/
├── docker-compose.yml
├── .env
├── Caddyfile
├── cacti/
│   ├── db/
│   ├── data/
│   ├── spine/
│   └── backups/
├── nagios/
│   └── etc/
├── uptime-kuma/
│   
└── caddy/
    ├── data/
    └── config/
```

## 🔒 Security Notes
- Caddy automatically handles SSL certificates.
- You can enable basic auth inside the Caddyfile for protected routes.

---
Maintained by [MD SHORIFUL ISLAM](mailto:badshashorif@gmail.com)
