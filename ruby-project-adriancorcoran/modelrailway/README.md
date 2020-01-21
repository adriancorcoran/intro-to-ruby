# Model Railway
Welcome to the Model Railway catalogue! The catalogues tracks the cost, number of items and various other records for the different types of models used on our model railway. The items include engines, trucks, buildings and track, and we are recording the number of each type, as well as the cost in order to both stay within our model railway budget and also keep track of what we have!

## Download and install
1. Clone the repo to your machine
2. Run `$ bundle install` to install dependencies

## Command Line Interface
The entry point for the CLI is in the modelrailway folder - follow these instructions to test it out:
1. `cd` to `modelrailway`
2. run `$ exe/modelrailwaycli help` to see a list of commands and hints for using them
3. when using the command you can leave out the arguments on those commands with arguments to see the exceptions at work :)

## Available Commands

## `$ modelrailwaycli create_catalogue`
Creates and displays the catalogue

## `$ modelrailwaycli display_catalogue`
Displays the catalogue

## `$ modelrailwaycli calculate_total_cost`
Shows the total cost of the current catalogue

## `$ modelrailwaycli grab_type_quantity`
Print the total quantity of this type of class in the catalogue.
Usage: `modelrailwaycli grab_type_quantity classname` (e.g. 'SteamEngine')

## `$ modelrailwaycli grab_type_costs`
Prints the cost of each different instance of this class in the catalogue.
Usage: `modelrailwaycli grab_type_costs classname` (e.g. 'OilTruck')

## `$ modelrailwaycli find_type`
Prints out the instances of this type of class in the catalogue.
Usage: `modelrailwaycli find_type classname` (e.g. 'Station')

## `$ modelrailwaycli grab_expensive_items`
Selects and prints all items from the catalogue which are >= to the amount you enter.
Usage: `modelrailwaycli grab_expensive_items amount` (e.g. '50')
