FROM postgres:9.5.3

COPY schema.sql /docker-entrypoint-initdb.d
