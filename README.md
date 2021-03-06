[![Build Status](https://circleci.com/gh/AleBL/ZSSN-API.svg?style=svg)](https://app.circleci.com/pipelines/github/AleBL/ZSSN-API)

## ZOMBIE SURVIVAL SOCIAL NETWORK API

# Ruby Version
- `Ruby 2.6.3`

# Rails Version
- `Rails 6.0.2`

# Features
- Register survivor
- Update survivor location
- Flag survivor as infected
- Trade items
- Reports {
    - Percentage of infected survivors.
    - Percentage of non-infected survivors.
    - Average amount of each kind of resource by survivor (e.g. 5 waters per survivor)
    - Points lost because of infected survivor.
}

# Database Setup
`rails db:setup`
or
`rails db:create`, 
`rails db:migrate`
\
\
For The Tests
\
\
`rails db:setup RAILS_ENV=test`
or
`rails db:create`, 
`rails db:migrate RAILS_ENV=test`
# How to run the test suite
`bundle exec rspec`

# Documentation
[Postman Documentation](https://documenter.getpostman.com/view/8243464/SWLfcnnt?version=latest)

# Test Coverage
![alt text](https://raw.githubusercontent.com/AleBL/ZSSN-API/master/img.png)
