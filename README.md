[![CircleCI](https://circleci.com/gh/caioeps/message_box.svg?style=svg)](https://circleci.com/gh/caioeps/message_box)
[![Maintainability](https://api.codeclimate.com/v1/badges/bfd80fafbb69faa99db6/maintainability)](https://codeclimate.com/github/caioeps/message_box/maintainability)

# README

This is a messaging app, similar to a mailbox.
It uses Rails, Webpacker, React.js, and SASS.

## Setup

```
bin/setup
```

Although you don't need to, you may run seed the project with `rake db:seed`.

## Server
Since we are using Webpacker, in order to the project run the server properly
we must also run webpack-dev-server alongside Puma. Foreman will allow us to run
many processes as Heroku does, using Procfiles.

```
foreman start -f Procfile.dev
```

## Testing

This project uses RSpec as its testing suite.

To run all tests

```
rspec
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

