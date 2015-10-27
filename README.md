## Readme

**Bagstr** is a small app designed to manage locker reservations at a hotel concierge desk.

#### Gems

+ **Ruby version:** 2.2.3

+ [Forego](https://github.com/ddollar/forego) and [Puma](http://puma.io) for running app locally.

+ RSpec and FactoryGirl for testing.

+ [Haml](http://haml.info) for views.

+ [Postgresapp](http://postgresapp.com) for local database.

+ [Prawn](https://github.com/prawnpdf/prawn) for PDF generation.


## Models

####  Locker
+ Has many reservations.
+ Assigned to a reservation based on availalbilty and size.
+ Return error if no locker is available.

#### Reservation
+ Belongs to locker.
+ Generates a confirmation number upon saving.
+ Allows concierge to create printable PDF to act as ticket.


### Assumptions

**Reservations** come and go while a single locker can have many reservations in it's lifetime.

+ A PDF view of a reservation suffices as a ticket, therefore I did not need to use a `has_many :through` association.

+ If this was a real app, would add authentication, authorization, and require https. Would offer email confirmations of reservations.

+ Each reservation is for one bag. Each locker holds one bag.

+ Collected guest name as backup in case ticket is lost.
