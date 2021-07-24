# gitlab

> 话不多说，直接上docker-compose.yml配置文件
> 完整的参考这里 https://github.com/sameersbn/docker-gitlab

```bash
# 先执行一下这个，有助于加速后面拉镜像
docker pull registry.cn-beijing.aliyuncs.com/guanweiming/gitlab:13.9.3
```

```yaml
version: '2.3'

services:
  redis:
    restart: always
    image: redis:5.0.9
    container_name: redis
    command:
    - --loglevel warning
    volumes:
    - ./redis:/var/lib/redis:Z

  postgresql:
    restart: always
    image: sameersbn/postgresql:12-20200524
    container_name: postgresql
    volumes:
    - ./posgresql:/var/lib/postgresql:Z
    environment:
    - DB_USER=gitlab
    - DB_PASS=password
    - DB_NAME=gitlabhq_production
    - DB_EXTENSION=pg_trgm,btree_gist

  gitlab:
    restart: always
    image: sameersbn/gitlab:13.9.3
    container_name: gitlab
    depends_on:
    - redis
    - postgresql
    ports:
    - "88:80"
    - "822:22"
    volumes:
    - ./gitlab/data:/home/git/data:Z
    healthcheck:
      test: ["CMD", "/usr/local/sbin/healthcheck"]
      interval: 5m
      timeout: 10s
      retries: 3
      start_period: 5m
    environment:
    - DEBUG=false

    - DB_ADAPTER=postgresql
    - DB_HOST=postgresql
    - DB_PORT=5432
    - DB_USER=gitlab
    - DB_PASS=password
    - DB_NAME=gitlabhq_production

    - REDIS_HOST=redis
    - REDIS_PORT=6379

    - TZ=Asia/Kolkata
    - GITLAB_TIMEZONE=Kolkata

    - GITLAB_HTTPS=false
    - SSL_SELF_SIGNED=false

    - GITLAB_HOST=xxx
    - GITLAB_PORT=443
    - GITLAB_SSH_PORT=22
    - GITLAB_RELATIVE_URL_ROOT=
    - GITLAB_SECRETS_DB_KEY_BASE=long-and-random-alphanumeric-string
    - GITLAB_SECRETS_SECRET_KEY_BASE=long-and-random-alphanumeric-string
    - GITLAB_SECRETS_OTP_KEY_BASE=long-and-random-alphanumeric-string

    - GITLAB_PAGES_ENABLED=false
    - GITLAB_PAGES_DOMAIN=xxx
    - GITLAB_PAGES_PORT=443
    - GITLAB_PAGES_HTTPS=true
    - GITLAB_PAGES_EXTERNAL_HTTP=:80
    - GITLAB_PAGES_EXTERNAL_HTTPS=:443


    - GITLAB_ROOT_PASSWORD=
    - GITLAB_ROOT_EMAIL=

    - GITLAB_NOTIFY_ON_BROKEN_BUILDS=true
    - GITLAB_NOTIFY_PUSHER=false

    - GITLAB_EMAIL=admin@xxx.cn
    - GITLAB_EMAIL_REPLY_TO=admin@xxx.cn
    - GITLAB_INCOMING_EMAIL_ADDRESS=admin@xxx.cn

    - GITLAB_BACKUP_SCHEDULE=daily
    - GITLAB_BACKUP_TIME=01:00
    - GITLAB_BACKUP_EXPIRY=259200
    - AWS_BACKUPS=false
    - AWS_BACKUP_REGION=xxx
    - AWS_BACKUP_ENDPOINT=http://xxx:45678
    - AWS_BACKUP_ACCESS_KEY_ID=xxx
    - AWS_BACKUP_SECRET_ACCESS_KEY=xxx
    - AWS_BACKUP_BUCKET=xxx


    - SMTP_ENABLED=false
    - SMTP_DOMAIN=xxx
    - SMTP_HOST=xxx
    - SMTP_PORT=465
    - SMTP_USER=xxx
    - SMTP_PASS=xxx
    - SMTP_STARTTLS=true
    - SMTP_AUTHENTICATION=login
    - SMTP_TLS=true

    - IMAP_ENABLED=false
    - IMAP_HOST=xxx
    - IMAP_PORT=993
    - IMAP_USER=xxx
    - IMAP_PASS=xxx
    - IMAP_SSL=true
    - IMAP_STARTTLS=true

    - PUMA_WORKERS=2

```
