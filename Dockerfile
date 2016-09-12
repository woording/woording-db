FROM postgres:9.5.3

ADD schema.sql /docker-entrypoint-initdb.d/
