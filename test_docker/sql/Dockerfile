# Используем базовый образ= postgres
FROM postgres:15.4-alpine3.18

# Копируем файл
COPY yoga_db_dump_file_3.sql /docker-entrypoint-initdb.d/

# чтобы все знали, что этот порт
EXPOSE 5432