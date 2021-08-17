# README

All the functionalities and validations have been implemented i.e
POST /order endpoint
Test cases for all validation 
Order Storage (sqlite)
Crypto Order retrieval 
Auth guard (Token: "secret")
Documentation (README.md)


* Installation
  git clone "repository"
  bundle install

* To run server
  rails s

* To access end points
  First Authorize with token "secret"
  post http://localhost:3000/order
  get http://localhost:3000/order/<orderId>

* To run the test suite
  rspec