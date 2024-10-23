# Patient Portal

This is a skeleton app for Orderly Meds interview process for
the asynchronous offline coding exercise.


## Environment setup

- [Recent version of Ruby installed](https://github.com/asdf-vm/asdf-ruby)
- [Recent version of yarn installed](https://github.com/twuni/asdf-yarn)
- [Docker Community Edition installed](https://www.docker.com/get-started/)

## Getting started

- `git clone git@github.com:orderlymeds/fullstack-ux`
- `cd fullstack-ux`
- `docker-compose up`
- `./bin/setup`
- `rails db:create`
- `./bin/dev`

## Running the specs

`./bin/rspec`

## Exercise: Implementing a Patient Portal using Ruby on Rails with Turbo

### Objective

Design and implement a functional patient portal application using Ruby on Rails.
The portal will allow patients to:

- see their profile and next appointment,
- adjust their next appointment schedule, and
- view their medical records.

The exercise will focus on using Turbo to create a smooth, single-page application experience.

### Requirements:

1. Patient Dashboard:

Create a dashboard that displays an overview of the patient’s information:

- Personal details (name, age, contact information)
- Next appointment data -- read and update
- Recent medical records (e.g., last visit summary)

Implement this dashboard using Turbo
to ensure a seamless, real-time update experience without full-page reloads.
