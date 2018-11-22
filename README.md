# API query - Tech Test

[![Build Status](https://travis-ci.org/ChocolatineMathou/api_query.svg?branch=master)](https://travis-ci.org/ChocolatineMathou/api_query)

## Intro

This project was made for an application.  
It was built with Ruby and its testing framework RSpec, using OOD and TDD.  
Rubocop and SimpleCov were used from the beginning to improve the syntax and get the test coverage.

## User stories

```
As a marketer,
So that I know what's my best seller,
I'd like an app to retrive the most sold item.

As a marketer,
So that I can see how much a given customer has spent,
I'd like an app to retrieve the total spend of this customer.

As a marketer,
So that I can reward my most loyal customer,
I'd like an app to retrieve their name.
```

## Download and run project

```
$ git clone git@github.com/ChocolatineMathou/api_query.git
$ cd api-query
$ bundle install
```

Tests can be run using RSpec from the root of the project directory.  
Test coverage is 98.14%. I didn't test the HTTP request in the API object, this is why I couldn't reach 100% coverage. However, there is no styling offense.

```
$ rspec / # To run the tests (include test coverage)
$ rubocop / # To inspect the syntax
```

You can interact with this project in your favourite REPL as follows:   

```
$ ruby app.rb most_sold
"Heavy Duty Concrete Watch"
$ ruby app.rb total_spend schimmel_quincy@ernser.io
245.01
$ ruby app.rb most_loyal
"jack_lakin@rodriguezschuppe.io"
$ ruby app.rb total_spend mathilde@email.com                                                                                                               (master)
#<RuntimeError: User does not exist>
$ ruby app.rb total_spend
"Email not provided"
$ ruby app.rb hello_world
"I did not understand your question."
```

## Approach

I started to explore the given API and draw a diagram to get an idea of the domain model and the interactions the user will have.  
I finally used three different classes - API, Purchases and Users - as they don't have the same responsabilities. API is in charge of retrieving information from the API, Purchases has all the purchases-related logic while Users has the users-related logic.   
Moreover, I choose to integrate Travis CI to make sure the codebase could be used without breaking in a clean environment.   
During my pairing session with the company, I've been able to refactor the codebase using a helper (frequency_map method) and memoization, and create unit tests for the App class.

## Specification

Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.   
`ruby app.rb COMMAND PARAMETERS`
