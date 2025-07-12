# 🐳 Self-Hosted Docker Swarm Stacks

This repository contains a collection of self-hosted custom **Docker Swarm stacks** used in my environment, for deploying and managing various services in a scalable, high-availability fashion across a number of nodes. Each stack includes:


## 📋 Repository Structure

The repository is organized into subdirectories, each representing a service. Each service directory contains:
- A Docker Compose file (Swarm-compatible) `docker-stack-compose.yml` file or equivalent.
- Environment variable files (`.env`).
- Bash scripts for building, deploying, and removing the service.
- Additional configuration files as needed (e.g., `config.yml`, `Dockerfile`, etc.).
- Optional build scripts for custom Docker images


## 📦 🛠️ Available Stacks

| **Category**             | **Service Name**                  | **Description**                                                                                       |
|--------------------------|-----------------------------------|-------------------------------------------------------------------------------------------------------|
| **Reverse Proxy**        | Traefik + Cloudflared + OAuth     | Advanced Traefik reverse-proxy setup with Cloudflare tunnel, OAuth, and advanced routing rules        |
| **VPN & Networking**     | Tailscale                         | Zero-trust VPN and subnet router for remote access                                                    |
|                          | Pi-hole DNS + Nebula Synching     | Ad-blocking dual-DNS stack with Nebula config synchronization                                         |
| **Dev Tools**            | VSCode Server                     | seld hosted browser-based Visual Studio Code                                                          |
|                          | IT Tools & Utilities              | A suite of web based utilities for development, math, unit convertion, and more                       |
| **Media**                | Jellyfin                          | Media server for movies, TV, and more                                                                 |
| **Home Automation**      | Homebridge HomeKit                | HomeKit bridge for smart home devices without native apple HomeKit support                            |
| **Orchestration**        | Docker Garbage Collect            | Automated cleanup of Docker resources, containers, and garbage                                        |
|                          | Docker Swarm Dashboard            | Comprehensive visual dashboard for monitoring Swarm clusters                                          |
|                          | Docker Swarm Keepalive            | Ensures high availability of Swarm manager nodes with floating vIPs                                   |
|                          | Dozzle Swarm Logging              | Centralized visual real-time logging solution for Docker containers                                   |
|                          | Gantry Docker Image Management    | Cron-based docker image management with automated update policies                                     |
|                          | Swarmpit                          | Swarm manager and metrics dashboard                                                                   |
|                          | Portainer                         | Docker Swarm management UI                                                                            |
|                          | Glances Swarm Host BTop           | Detailed real-time BTOP  host level monitoring of Swarm nodes - web based                             |
|                          | Uptime Kuma Swarm Monitoring      | Enhanced monitoring with notification capabilities                                                    |
|                          | Docker Registry                   | Private docker image registry with Redis caching                                                      |




## 🚀 Getting Started  

### 1. Clone the Repository

```bash
git clone https://github.com/JackieTreeh0rn/Docker-Swarm-Stacks.git
cd Docker-Swarm-Stacks
```


### 2. Deploy | Remove | Build (optional) using the provided scripts for each stack
```bash
   ./deploy.sh
   ./remove.sh
   ./build.sh  # (optional, for custom images)
   ```


## 📋 Notes

- All stacks are designed for Docker Swarm mode.
- Some services (like Jellyfin, Homebridge) run in host network mode and use external Traefik rules.
- Networks are created per stack (<stack>_backend) for isolation.
- Labels and constraints are used to control placement on Swarm nodes.
- Most stacks use shared storage (glusterfs) for persistent data - switch to your preferred storage solution as needed
- Environment variables are used for configuration and secrets management.    


## 📄 License
This project is licensed under the MIT License. See the LICENSE file for details.