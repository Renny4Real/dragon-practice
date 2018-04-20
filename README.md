# Chirper

A simple Twitter application which has some problematic tests.

## What you need to do

Install

```shell
bundle
```

Run the tests

```shell
bundle exec rspec
``` 

Start the server running at http://localhost:3000

```shell
bundle exec rails s
```

## Exam

* Don't use the existing tests as a guide. They have many flaws.
* Please read through, explain and critique the existing tests.
* Please implement the following feature using TDD.
* As you implement the feature, don't be afraid to improve the existing code.
* You have 30 minutes.
* You will be tested against the [mark scheme][mark-scheme] (you should have read this.)

[mark-scheme]: https://docs.google.com/document/d/13AuqWeEx5FRWAFOpZrRFLL3OanDXLwjTW8yKZ9fXVN4/edit#

## Feature

As a keen follower of Seb's tweets I've got software which archives the best.

Please implement a feature which lets me see the previously saved tweets.

And also see if a tweet has been deleted since you saved it.

```ruby
[2] pry(main)> twitter_client.status(1234123123123123)
Twitter::Error::NotFound: No status found with that ID.
```

Remember you are being challenged to use your ability to TDD,
NOT your ability to write Rails or implement features.
