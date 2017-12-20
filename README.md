## HOME IMPROVEMENT TEST

### System dependencies
* Ruby version 2.4.2
* Bundler
* Postgres 9.4.5
* Yarn 1.3.2

### Configuration

#### Configure env variables
        cp ~/Desktop/application.yml config/

Or setup your own app with http://localhost:3000/users/auth/facebook as the Oauth callback in your FB app settings

config/application.yml

        development:
          FACEBOOK_APP_ID: 'app_id'
          FACEBOOK_APP_SECRET: 'secret'
          FACEBOOK_APP_SCOPE: 'email,public_profile'

#### Install Packages
        yarn install
#### Setup the database
        rake db:setup
#### Start the Puma server
        rails s                
### How to run the test suite
        bundle exec rspec

### How to login as admin
An admin user was generated by the seed data:

        email: admin@example.com
        pass: admin