# Sauron - The eye that sees everything

It's a funny way to say it's a super simple app that uses Twitter API to search terms

## What could be improved with more time?

Global

* Create a Dockerfile as an easyway to run the project

On the Front-end

* Move the http client logic to a service
* Write tests for the component
* Write e2e tests for the application

On the Back-end

* Remove url endpoints hardcoded
* Improve the backend application against bad input and then handle the exceptions

## Running the app localy

### Running the Front-end app

```
cd project_folder/sauron-frontend && npm install && ng start
```

**You might need to bind the server to 0.0.0.0**

### Running the Back-end app

```
cd project_folder/sauron-backend && gem install bundler && bundle install && ruby app.rb
```

### Running the tests for the Back-end

```
cd project_folder/sauron-backend && gem install bundler && bundle install && rspec
```
