[![CircleCI](https://circleci.com/gh/caioeps/message_box.svg?style=svg)](https://circleci.com/gh/caioeps/message_box)
[![Maintainability](https://api.codeclimate.com/v1/badges/bfd80fafbb69faa99db6/maintainability)](https://codeclimate.com/github/caioeps/message_box/maintainability)

# README

This is a messaging app, similar to a mailbox.
It uses Rails, Webpacker, React.js, and SASS.

## Docker

This project is dockerized. Please, for better setup, [install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#prerequisites) and
[docker-compose](https://docs.docker.com/compose/install/#install-compose).


## Setup

#### Create .env file
```
cp .env.sample .env
```

#### Build images
```
docker-compose build
```

#### Create schema from `db/schema.rb`
```
docker-composer run --rm web rails db:setup
```

Although you don't need to, you may run seed the project with
`docker-compose run --rm web rails db:seed`.

## Server
To run the server and all related services, just run

```
docker-compose up
# or
docker-compose --rm web
```

## Testing

This project uses RSpec as its testing suite.

To run all tests

```
docker-compose run --rm web rspec
```

## The API

The following endpoints are available:

* `GET   /api/messages`
* `GET   /api/messages/:id`
* `POST  /api/messages`
* `GET   /api/messages/archives`
* `PATCH /api/messages/archives/toggle/:id`

This app has, at least, the following emails registered:

* `renan@email.com` with password `123123`, and token `renan`
* `rodrigo@email.com` with password `123123`, and token `rodrigo`

The request url is going to have the following format

`/path/to/resource?user_email=renan@email.com&user_token=renan`

You may pass your authentication informations in the headers, as well, like so:

```
X-User-Email renan@email.com
X-User-Token renan
```

