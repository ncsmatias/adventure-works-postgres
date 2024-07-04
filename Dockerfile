FROM postgres:latest

ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=Adventureworks

EXPOSE 5432

WORKDIR /db

COPY . .

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["postgres"]