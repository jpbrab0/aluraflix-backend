
FROM bitwalker/alpine-elixir-phoenix:latest
WORKDIR /aluraflix-backend
COPY . .
RUN mix deps.get
EXPOSE 4000
ENV HOSTNAME=postgres
CMD ["mix", "phx.server"]