[![Build Status](https://circleci.com/gh/AleBL/ZSSN-API.svg?style=svg)](https://app.circleci.com/pipelines/github/AleBL/ZSSN-API)

# Zombie Survival Social Network API

Welcome to the Zombie Survival Social Network (ZSSN) API, an application designed to manage resources and survivor interactions in a post-apocalyptic world.

## Ruby and Rails Versions
- **Ruby**: 3.0.0
- **Rails**: 7.1.3

## Features

### Survivor Management
- **Register Survivor**: Add new survivors to the network.
- **Update Survivor Location**: Keep track of survivors' locations.
- **Flag Survivor as Infected**: Mark survivors who have been infected.

### Trading and Resources
- **Trade Items**: Allow survivors to trade items with each other.
- **Reports**:
  - **Infected Survivors**: Percentage of infected survivors.
  - **Non-Infected Survivors**: Percentage of non-infected survivors.
  - **Average Resources**: Average amount of each resource per survivor (e.g., 5 waters per survivor).
  - **Points Lost**: Points lost due to infected survivors.

## Getting Started

### Database Setup
To set up the database, run:
```sh
rails db:setup
```
Or manually create and migrate the database:
```sh
rails db:create
rails db:migrate
```

### Test Environment Setup
To set up the database for testing, run:
```sh
rails db:setup RAILS_ENV=test
```
Or manually create and migrate the test database:
```sh
rails db:create RAILS_ENV=test
rails db:migrate RAILS_ENV=test
```

### Running Tests
To run the test suite, execute:
```sh
bundle exec rspec
```

## Documentation
For detailed API documentation, please refer to our [Postman Documentation](https://documenter.getpostman.com/view/8243464/SWLfcnnt?version=latest).

## Test Coverage
![Test Coverage](https://raw.githubusercontent.com/AleBL/ZSSN-API/master/img.png)
