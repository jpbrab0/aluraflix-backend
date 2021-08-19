
FROM bitwalker/alpine-elixir:latest
WORKDIR /aluraflix-backend
COPY . .
RUN mix deps.get
CMD ["mix", "phx.server"]