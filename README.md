# Test Application

## Prerequisites

- Ruby 2.3.1
- Postgres >9.5
- Redis

## Setup

    git clone git@github.com:Wendigooor/abmcloud_test.git
    cd abmcloud_test
    bin/setup

## Background Jobs

To use background jobs run sidekiq in another window:

    bundle exec sidekiq

## Testing

To run the test suite regularly:

    bin/rspec spec


