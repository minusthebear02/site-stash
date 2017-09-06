# SiteStash

Welcome to SiteStash. A Ruby on Rails web application for creating and organizing website bookmarks into specified topics. Users can save bookmarks either on the webpage or by emailing their bookmark to SiteStash. The user also has the ability to "like" other users' bookmarks and have them display on their profile page.

[Live Demo](https://site-stash.herokuapp.com/ "SiteStash")

### Project Objectives

* Users can sign up for free accounts by providing a username, password and email
* Users can sign in and out of SiteStash
* Users can email a URL to Blocmarks and have it saved in the Blocmarks database
* Users can see all topics and their bookmarks
* Users can create, read, update and delete bookmarks
* Users are the only ones allowed to delete or update the bookmarks they create
* Users can "like" and "unlike" bookmarks created by others
* Users can see a list of bookmarks on their personal profile that they've added or liked

### Built Using

##### Languages and Frameworks:

* Ruby 2.3.3
* Rails 4.2.5

##### Databases:

* SQLite (Development)
* PostgreSQL (Production)

##### Tools and Gems

* SendGrid for email confirmation
* Devise for user authentication
* Pundit for user authorization
* Figaro for secure configuration
* Faker for seeding fake db data
* Bootstrap for responsive layout configuration
