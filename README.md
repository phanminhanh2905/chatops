# Telegram ChatOps Automation

A lightweight **Bash-based ChatOps bot** that integrates Telegram with my DevOps lab environment, allowing CI/CD, Kubernetes, Harbor, and server operations to be monitored and managed remotely from a mobile device.

> This is a personal DevOps lab project designed to explore ChatOps, operational automation, and remote infrastructure management.


# Demo

### Telegram Command List (/help)

![help](docs/images/help.jpg)

---

### Trigger GitLab Pipeline

![build](docs/images/build.jpg)

---

### Check GitLab Pipeline Status

![status](docs/images/status.jpg)

---------------------------------------------- 

# Overview

The bot runs on a dedicated **Admin Server** and uses Telegram as the operational interface.

Instead of connecting directly to servers for common checks, operational commands can be executed through Telegram.

```text
Telegram
    |
    v
Telegram Bot API
    |
    v
Admin Server
    |
    +--- Bash ChatOps Bot
    |
    +--- GitLab CI/CD
    |
    +--- Kubernetes
    |
    +--- Harbor Registry
    |
    +--- Dev Server

```

# Future

Execute common operational tasks directly from Telegram without SSH access for routine monitoring and administration.

| Module     | Commands                                    |
| ---------- | ------------------------------------------- |
| CI/CD      | /build /status /retry /cancel               |
| Kubernetes | /pods /logs /restart /rollback /events /top |
| Server     | /cpu /ram /disk /uptime                     |
| Harbor     | /image /images                              |
