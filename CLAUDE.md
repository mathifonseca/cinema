# Cinema - Project Context

## Overview
Simple Rails CRUD app for managing movies. Originally created as a university/learning project, not used in production. Kept alive mostly for reference and experimentation.

## Stack
- Rails 7.2 with SQLite3 (all environments)
- HAML for views, Sprockets for assets (CSS only, no JS framework)
- No test coverage — the test directory exists but has no meaningful tests

## Key Files
- `app/controllers/movies_controller.rb` — all app logic lives here (CRUD + TMDb search)
- `app/models/movie.rb` — validations for title, rating, release_date
- `app/views/movies/` — HAML templates for index, show, new, edit
- `config/secrets.yml` — contains dev/test secret keys (not sensitive, this is a demo app)

## Things to Know
- The `search` action has a hardcoded TMDb API key and uses `VERIFY_NONE` for SSL — this is intentional for the demo, not a bug to fix unless asked
- `directors` and `genres` tables exist in the schema but have no models, controllers, or views — they're unused
- No JS framework is used; delete uses `button_to` (generates a form, works without JS)
- The app was upgraded from Rails 5.2 to 7.2 in March 2026

## Commands
```bash
bin/rails server       # start dev server on port 3000
bin/rails test         # run tests (none currently)
bin/rails db:setup     # create and migrate DB
bin/rails console      # interactive console
```
