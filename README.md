# Monitoring Stack with Docker and Caddy

This project deploys a secure monitoring stack using **Cacti**, **Nagios**, and **Caddy** for automatic HTTPS reverse proxy.

## 🌐 Subdomains
- `https://cacti.monitor.grameencybernet.net`
- `https://nagios.monitor.grameencybernet.net`

## 🧱 Stack Overview
- **Caddy**: Reverse proxy with automatic SSL (Let's Encrypt)
- **Cacti**: SNMP-based performance monitoring
- **Nagios**: Infrastructure and service monitoring
- **MariaDB**: Database backend for Cacti

## 🚀 Deployment Instructions

### 1. DNS Setup
Ensure the following DNS A records point to your server:

| Subdomain                         | IP Address         |
|----------------------------------|--------------------|
| cacti.monitor.grameencybernet.net | YOUR_PUBLIC_IP     |
| nagios.monitor.grameencybernet.net | YOUR_PUBLIC_IP     |

### 2. Launch with Docker
```bash
docker compose up -d
```

### 3. Access Dashboards
- Cacti: https://cacti.monitor.grameencybernet.net
- Nagios: https://nagios.monitor.grameencybernet.net

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
└── caddy/
    ├── data/
    └── config/
```

## 🔒 Security Notes
- Caddy automatically handles SSL certificates.
- You can enable basic auth inside the Caddyfile for protected routes.

---
Maintained by [MD SHORIFUL ISLAM](mailto:you@example.com)
