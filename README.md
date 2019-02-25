# Views Counter Ruby
A simple program that parses data from a log file, counts the views per page and shows them in the console.

### User Stories:
```
As a user,
So that I can see how many total views per page i received in my website,
I want to be able to see them printed out to the console.

As a user,
So that I can see how many unique views per page i received in my website,
I want to be able to see them printed out to the console.
```

## How to use

 ### To set up the project:

 Clone this repository and then run:

 ```
 bundle install
 ```
 ### To run tests and coverage(rspec/simplecov):
 
 ```
 rspec
 ```
 
 ### To run linter(rubocop):
 
 ```
 rubocop
 ```
 
 ### To run the app in IRB:
 Open irb and run:
 ```
 require './lib/views_counter.rb'
 ```
 Follow the instructions below:
 ```
 counter = ViewsCounter.new
 => creates a new ViewsCounter instance

 counter.show_total_views('./webserver.log')
 => prints out the total views in the console

 counter.show_unique_views('./webserver.log')
 => prints out the unique views in the console

```
