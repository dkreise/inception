#!/bin/bash
if [ ! -f /etc/ssl/localhost.crt ]; then
	openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/ssl/localhost.crt -keyout /etc/ssl/localhost.key -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 Barcelona/CN=localhost";
fi
exec "$@"
