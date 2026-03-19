# Cinema

A simple movie management web app built with Ruby on Rails. Allows browsing, creating, editing, and deleting movies. Originally built as a learning/demo project.

## Tech Stack

- Ruby on Rails 7.2
- SQLite3
- HAML templates
- Sprockets (asset pipeline)

## Setup

```bash
bundle install
bin/rails db:setup
bin/rails server
```

Then open http://localhost:3000.

## Features

- CRUD operations for movies (title, rating, release date, description)
- Ratings: G, PG, PG-13, R, NC-17
- JSON and XML API responses (`/movies.json`, `/movies.xml`)
- Movie search via TMDb API (`/search`)

## Database

Uses SQLite with three tables: `movies`, `directors`, and `genres`. Only `movies` is actively used by the app.

## Tests

```bash
bin/rails test
```
