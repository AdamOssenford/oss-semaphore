# start redis
docker run -d --name=redisio redis

# start mongodb
docker run -d --name=mongodb -p 127.0.0.1:27017:27017 mongo

docker run -d --name=semaphore  --restart=always --link redisio:redis --link mongodb:mongo -e MONGODB_URL="mongodb://mongo/semaphore" -e REDIS_HOST="redis" -p 80:80  castawaylabs/semaphore
