# AluraflixBackend

[![Elixir CI](https://github.com/jpbrab0/aluraflix-backend/actions/workflows/elixir.yml/badge.svg)](https://github.com/jpbrab0/aluraflix-backend/actions/workflows/elixir.yml)

## About the project ๐

This is a challenge from [Alura Backend Challenges](https://github.com/alura-challenges/challenge-back-end) where all the participants builed the backend of [AluraFlix](https://github.com/imersao-alura/aluraflix).

And is builded with:
  * Elixir
  * Phoenix
  * Ecto 
  * Docker-Compose

## Installing the project ๐ฆ

Requirements:
  * [Elixir](https://elixir-lang.org/install.html)
  * Erlang
  * [Docker](https://www.docker.com/get-started)
  * [Docker-compose](https://docs.docker.com/compose/install/)

Clone the github repo to your local machine

With HTTPS:
```bash
https://github.com/jpbrab0/aluraflix-backend.git
```

With SSH:
```bash
git clone git@github.com:jpbrab0/aluraflix-backend.git
```

With Github CLI:
```bash
gh repo clone jpbrab0/aluraflix-backend
```

## Running the project ๐
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Initialize the postgres with `docker-compose -f docker-compose.database.yml up -d`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `HOSTNAME=localhost mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Running the project with Docker! ๐ณ
### Build image
```bash
docker-compose build
```

### Create and migrate database
```bash
docker-compose run app mix ecto.setup
```

### Run project(if you dont want do see logs add -d)
```bash
docker-compose up
```

Now you can acess the project in  [`localhost:8000`](http://localhost:8000) :)

# Testing ๐งช

To run all the test, execute in terminal:

the tests are under construction

```bash
mix test
```

## Endpoints

Base Url: `https://localhost:4000/api`

### View all registered videos

```http
GET /videos
```

### Search videos

```http
GET /videos?search=
```

### View a video by id

```http
GET /videos/:id
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |

### Create a video

```http
POST /videos
```

| Parameter | Type   |
| :-------- | :----- |
| `title`      | `string` |
| `category_id`      | `integer` |
| `description`      | `string` |
| `url`      | `string` |

### Update a video

```http
PUT /videos/:id
``` 

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |
| `title`      | `string` |
| `category_id`      | `integer` |
| `description`      | `string` |
| `url`      | `string` |

### Delete a video

```http
DELETE /videos/:id
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |

### View all the videos of a specific category

```http
GET /categories/:id/videos
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |

### View all registered categories

```http
GET /categories
```

### View a category by id

```http
GET /categories/:id
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |

### Create a category

```http
POST /categories
```

| Parameter | Type   |
| :-------- | :----- |
| `title`      | `string` |
| `color`      | `string` |

### Edit a category

```http
PUT /categories/:id
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |
| `title`      | `string` |
| `color`      | `string` |

### Delete a category

```http
DELETE /categories/:id
```

| Parameter | Type   |
| :-------- | :----- |
| `id`      | `integer` |

---
## Learn more about Phoenix!

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

The project has made by [Joรฃo Pedro Resende](https://jpres.dev)