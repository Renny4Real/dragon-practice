# Chirper

A simple Twitter application which archives Seb tweets as "Chirps".

The code behind this application has some questionable tests.

## Getting set up

The tests should all pass before beginning the course work below.  To install
and run tests use the following make command:

```shell
make setup test
```

To run just the tests use the following:

```shell
make test
```

Start the server running at [http://localhost:3000](http://localhost:3000):

```shell
make serve
```

## Guidance

Remember you are being challenged to use your ability to TDD,
NOT your ability to write Rails or implement features.

* Don't use the existing tests as a guide. They have many flaws.
* As you implement the feature, don't be afraid to improve the existing code.
* You will be tested against the [mark scheme][mark-scheme] (you should have read this.)
* You will not be tested against usability or visual pleasantries.

The three courses below build upon each other.  You need to back up your
progress between each course by pushing your progress to a branch, e.g.
`adrian-giraffe` to Github.

[mark-scheme]: https://docs.google.com/document/d/13AuqWeEx5FRWAFOpZrRFLL3OanDXLwjTW8yKZ9fXVN4/edit#

## Giraffe course

As a keen follower of Seb's tweets I've got software which archives the best as a Chirp.

Please implement a feature using TDD which lets me see the previously saved
Chirps.  See `service/get_chrips.rb` for a suggested entry point.

Once you have showcased this slice, the customer would like to see pagination.

## Wolf course

As a data hoarder I want to know when a Chirp has been removed from Twitter.

Please extend your feature above, again with TDD, to display whether a Chirp is
still on Twitter or not.

```ruby
[2] pry(main)> twitter_client.status(1234123123123123)
Twitter::Error::NotFound: No status found with that ID.
```

## Dragon course

Please read through, explain and critique the applications tests and production
code.  Discuss the current design, alternative designs and what direction you
would refactor the project, being as specific as possible.

Please improve the performance of the existing test suite.
