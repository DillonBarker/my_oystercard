# Oyster card challenge

Here are the user stories you will be working on for this project:
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```
The steps I followed to complete this project are as follows:
1. Set up the project:

  -  Create a Gemfile
  -  Create RSpec conventional files
  -  Review debugging basics

2. Create a basic Oyster card:

  -  Add the balance
  -  Enable top up functionality
  -  Enforce maximum balance
  -  Deduct the money

3. Add touch in/out functionality:

  -  Add touch in/out support
  -  Checking mininum balance on touch in
  -  Charging for the journey

4. Record the journeys

  -  Saving the entry station
  -  Adding journey history
  -  Creating the station class

5. Refactor to extract Journey class

  -  Handling a journey without a touch out

6. Refactoring: get the code into shape

  -  Extracting the journey log out of the Oystercard

7. Make fares depends on zones

  -  Calculating the fare between zones
