# ���������� ������� �����= postgres
FROM postgres:15.4-alpine3.18

# �������� ����
COPY yoga_db_dump_file_3.sql /docker-entrypoint-initdb.d/

# ����� ��� �����, ��� ���� ����
EXPOSE 5432