# Simple Logger (Server)

A server to receive log events from [Simple Logger](https://github.com/thelowlypeon/simple_logger).

## Installation

```bash
git clone ... .
rake db:setup
rackup
```

## DB Setup

Setup your production database using environment variables:

```
DB_NAME=simple_logger-production
DB_HOST=host
DB_USERNAME=postgres
DB_PASSWORD=password
DB_PORT=5432
```
