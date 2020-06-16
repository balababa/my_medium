# My_medium
A project designed based on [Medium](https://medium.com/) for practicing RoR.
The project is originally created by [Eddie Kao](https://github.com/kaochenlong/my_medium)

首頁Logo 版權屬 Bulma 所有
## Prerequisites
The setups steps expect following tools installed on the system.

- Git
- Ruby 2.6.3
- Rails 5.2.4
- Yarn
- Node
- Postgresql

## Packages / Toos
* [devise](https://github.com/heartcombo/devise): Framework for authentication
* [Bulma](https://github.com/jgthms/bulma): CSS framework
* [AASM](https://github.com/aasm/aasm): State machine, make model fat and controller skinny by defining state and event in models.
* [friendly_id](https://github.com/norman/friendly_id): Beautify url by changing slug to human-friendly string(e.g. story title)
* [babosa](https://github.com/norman/babosa): Library of `friendly_id` for string manipulation
* [webpacker](https://github.com/rails/webpacker): Asssets bundler
* [stimulusJS](https://chloerei.com/2018/02/24/stimulus/): JS framework for UJS working well with turbolinks
* [foreman](https://github.com/theforeman/foreman): Quickly deploy  application by defining processes and jobs in `Procfile`
* [paranoia](https://github.com/rubysherpas/paranoia): Implementation of soft delete by add new column `deleted_at` to model and overide `delete` and `destroy` 
* [yarn](https://github.com/yarnpkg/yarn): Package manager for JS
* [Froala](https://github.com/froala/wysiwyg-editor): Embedded WYSIWYG text editor
* [figaro](https://github.com/laserlemon/figaro): Git-ignored application configuration defined in `config/application.yml`
* [axios](https://github.com/axios/axios) : Javascript library for making HTTP requests or XHR based on Promise
* [Braintree](https://www.braintreepayments.com/): Third party payment service
## Installation

### 1. Check out the repository

```bash
git clone git@github.com:balababa/my_medium.git
```
### 2. Create application.yml file

```bash
cp config/application.yml.sample config/application.yml
```
> set the environment variables needed in application.yml.
### 3. Install gems

```bash
bundle install
```
### 4. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bin/rails db:create
bin/rails db:migrate
```
> You may need to set up database configuration in `config/database.yml`

### 5. Start the Rails server

```ruby
bin/rails s
```
You also need to start webpack-dev-server in a separate terminal to watch for changes in `app/javascript/packs/*.js` and compile it immediately.
```ruby
bin/webpack-dev-server
```


---

Or you can start all processes and jobs needed to run by
```ruby
foreman start 
```
> The processes are defined in `~/Procfile`
