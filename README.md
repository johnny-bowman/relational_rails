# A Crag/Climb Manager | Solo Project - Turing BE

This is a basic Ruby-on-Rails web app that manages climbs located in various crags.

##### Ruby Version: 2.7.4
##### Rails Version: 5.2.7
##### Database: PostgreSQL

## Getting Set Up on a Mac
1. Install Rbenv ([Installation Guide](https://github.com/rbenv/rbenv))
2. Install Homebrew ([Installation Guide](https://brew.sh/))
3. Install Ruby 2.7.4: Run `rbenv install 2.7.4` in your terminal
4. Install Rails 5.2.7: Run `gem install rails 5.2.7` in your terminal
5. Install PSQL: Run `brew install postgresql` in your terminal
6. Start PSQL: Run `brew services start postgresql` in your terminal
7. Set project directory's local Ruby version to 2.7.4: Navigate to the directory that will store your project and run `rbenv local 2.7.4`

## Database and Rails Server Initialization
1. Clone this repo into your local directory
2. `cd` into the cloned project directory
3. Create project databases: run `rails db:migrate` in your terminal
4. run `rails s` to intialize the rails server

## Interacting with `localhost:3000/`
With your terminal open and `rails s` having been run and listening, type `localhost:3000/crags` to view all Crags in the database, and `localhost:3000/climbs` to view all climbs in the database.
