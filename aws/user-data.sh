#!/bin/bash
dnf install -y docker
systemctl enable --now docker
docker run -d --name app --restart always -p 80:80 danivegi/modulo08-cloud-aws:latest