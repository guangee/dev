# 使用docker迅速搭建基础开发环境用到的组建

### 兼容mysql的关系数据库，可以当mysql使用
* mariadb
```dockerfile
version: '3.1'
services:
  mariadb:
    restart: always
    image: "mariadb:10.5.3"
    container_name: mariadb
    ports:
      - "3306:3306"
    volumes:
      - ./mariadb/data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: "12345678Aa"
```

### redis，高速缓存，分布式锁，布隆过滤器

* redis
```dockerfile
version: '3.1'
services:
  redis:
    image: redis:6.0.8
    restart: always
    container_name: redis
    ports:
      - 6379:6379
    volumes:
      - ./conf/redis.conf:/etc/redis/redis.conf:rw
      - ./data:/data:rw
    command:
      redis-server /etc/redis/redis.conf --appendonly yes
```
```bash
# redis.conf
requirepass 12345678Aa
bind 0.0.0.0
appendonly yes
```

### postgresql 同样很牛逼的一个开源关系数据库

* postgresql
```dockerfile
version: '3.1'
services:
  postgresql:
    restart: always
    image: postgres:13.1
    container_name: postgresql
    ports:
      - 5432:5432
    volumes:
      - ./posgresql:/var/lib/postgresql/data:Z
    environment:
      - POSTGRES_USER=roma
      - POSTGRES_PASSWORD=12345678Aa
      - PGDATA=/var/lib/postgresql/data/pgdata
```

### 兼容AWS S3协议的存储中间件，很好用
* minio 
```dockerfile
version: '3.1'
services:
  minio:
    restart: always
    image: minio/minio
    container_name: minio
    ports:
      - 9000:9000
    environment:
      - MINIO_ACCESS_KEY=admin
      - MINIO_SECRET_KEY=12345678Aa
    command: server /data
    volumes:
      - /mnt/data:/data
```

### rabbitmq消息队列，好用

* rabbitmq
```dockerfile
version: '3.1'
services:
  rabbitmq:
    restart: always
    image: rabbitmq:3.8.12-management
    container_name: rabbitmq
    hostname: rabbitmq
    ports:
      - 15672:15672
      - 5672:5672
    volumes:
      - ./rabbitmq:/var/lib/rabbitmq
    environment:
      - RABBITMQ_DEFAULT_USER=admin
      - RABBITMQ_DEFAULT_PASS=12345678Aa
```
