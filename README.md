# Telegram ChatOps Automation

A Bash-based ChatOps platform for remotely operating GitLab CI/CD, Kubernetes, Harbor, and Linux infrastructure through Telegram.

> This is a personal DevOps lab project designed to explore ChatOps, operational automation, and remote infrastructure management.


# Demo

| Available Commands | Build Pipeline | Pipeline Status |
|:--------:|:----------------:|:------------------:|
| <img src="docs/images/help.jpg" width="280"> | <img src="docs/images/build.jpg" width="420"> | <img src="docs/images/status.jpg" width="420"> |

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
