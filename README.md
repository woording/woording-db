# woording-db
Woording database

How to run:
```bash
docker build -t woording-db .
docker run --name woorddb -e POSTGRES_PASSWORD=mysecretpassword -d woording-db
```
after that:
```bash
docker exec -i -t woorddb /bin/bash
psql -U postgres postgres < /tmp/schema.sql
```
