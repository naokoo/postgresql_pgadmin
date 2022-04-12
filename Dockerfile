version: '3'
 
services:
  postgres:
    image: postgres:latest
    restart: always
    environment:
      POSTGRES_USER: puser
      POSTGRES_PASSWORD: password
      PGPASSWORD: puser
      POSTGRES_DB: pdb
      TZ: "Asia/Tokyo"
    ports:
      - 5432:5432
    volumes:
      - postgres:/var/lib/postgresql/data
 
  pgadmin:
    image: dpage/pgadmin4
    restart: always
    ports:
      - 81:80
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@mail
      PGADMIN_DEFAULT_PASSWORD: password
    volumes:
      - pgadmin:/var/lib/pgadmin
    depends_on:
      - postgres
 
volumes:
  postgres:
  pgadmin:
