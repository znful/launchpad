# Launchpad

Launchpad is a job-board platform built with Ruby on Rails. Companies can post and manage job offers, candidates can browse, bookmark, and apply, and admins get a dashboard with search, pagination, and engagement statistics for every offer.

## Features

- **Job offers** — create, publish, pause, expire, or archive offers, each with a contract type (full-time, part-time, contract, internship, freelance) and job type (on-site, remote, hybrid)
- **Geocoded addresses** — offer locations are geocoded automatically from the address field
- **Rich text descriptions** — offer descriptions support rich formatting via Action Text
- **Offer verification** — offers move through an unverified → pending → verified/rejected workflow
- **Bookmarks** — authenticated users can save offers to revisit later
- **Engagement statistics** — views, interactions, and applications are tracked per offer and surfaced on an admin dashboard
- **Admin dashboard** — searchable (Ransack) and paginated (Pagy) view of all offers and their stats
- **Authentication** — secure password-based authentication with session and password-reset flows

## Tech Stack

- **Ruby** 3.4.5 / **Rails** 8.1
- **PostgreSQL** with UUID primary keys
- **Hotwire** (Turbo + Stimulus) for interactive UI without a separate frontend framework
- **Solid Queue / Solid Cache / Solid Cable** for background jobs, caching, and Action Cable, all backed by the database
- **Action Text** for rich text content, **Active Storage** for file attachments
- **Geocoder** for address geocoding
- **Ransack** + **Pagy** for admin search and pagination
- **Propshaft** for asset management
- Deployed via **Docker** / **Kamal**

## Getting Started

### Prerequisites

- Ruby 3.4.5 (see `.ruby-version`)
- PostgreSQL
- Node/Yarn (for JavaScript dependencies)

### Setup

```bash
# Install dependencies
bundle install
yarn install

# Set up the database
bin/rails db:create db:migrate db:seed

# Start the app
bin/dev
```

The app will be available at `http://localhost:3000`.

### Running tests

```bash
bin/rails test
```

## Project Structure

- `app/models` — `User`, `Offer`, `Bookmark`, `Statistic`, `Session`
- `app/controllers` — public-facing offer/bookmark/session controllers plus an `admin` namespace for the dashboard
- `db/schema.rb` — UUID-keyed schema for offers, users, bookmarks, and statistics

## License

This project currently has no license specified.
