# API query - Tech Test

[![Build Status](https://travis-ci.org/ChocolatineMathou/api_query.svg?branch=master)](https://travis-ci.org/ChocolatineMathou/api_query)

## Intro

This project was made for an application.  
It was built with Ruby and its testing framework RSpec, using OOD and TDD.  
Rubocop and SimpleCov were used from the beginning to improve the syntax and get the test coverage.

## User stories

```
As a user...
```

## Download and run project

```
$ git clone git@github.com:ChocolatineMathou/api_query.git
$ cd api-query
$ bundle install
```

Tests can be run using RSpec from the root of the project directory.  
Test coverage is [PERCENTAGE TO BE ADDED], with [NUMBER TO BE ADDED] styling offense.

```
$ rspec / # To run the tests (include test coverage)
$ rubocop / # To inspect the syntax
```

You can interact with this project in your favourite REPL, like Pry, as follows:   

```
INTERACTION
```

## Approach

I started to explore the given API and draw a diagram to get an idea of the domain model and the interactions the user will have.  
I finally used three different classes - API, Purchases and Users - as they don't have the same responsabilities. API is in charge of retrieving information from the API, Purchases has all the purchases-related logic while Users has the users-related logic.   
Moreover, I choose to integrate Travis CI to make sure the codebase could be used without breaking in a clean environment.

## Specification

Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.   
`ruby app.rb COMMAND PARAMETERS`
