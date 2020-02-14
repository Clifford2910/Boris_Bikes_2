# Boris Bikes (Ruby)

## Index
* [Installation](#Install)
* [Rspec Tests](#Rspec)
* [Usage](#Usage)

## Challenege

Let's go back several years, to the days when there were no Boris Bikes. Imagine that you're a junior developer (that was easy). Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

### Acceptance criteria

By the end of the week (Boris Bikes Challenge) I should be able too:
* Test-drive a simple program using objects and methods
* Pair using the driver-navigator style
* Follow an effective debugging process
* Describe some basic OO principles like encapsulation, SRP

### My Code Goals:
* I can TDD anything:
By the end of this week you should be able to write a meaningful test, based on the user requirements. You'll then be able to write code using TDD, to make the test pass.
* I can program fluently:
You'll learn how to setup and structure a new Ruby project, and turn user requirements into working code.
* I can debug anything:
You'll be introduced to a technique for uncovering the root-cause of bugs in your code. When your code doesn't work, you'll be able to apply a consistent process to resolve the issue.

## <a name="Install">Installation</a>
* To clone the repo
```shell
$ git clone https://github.com/Clifford2910/boris_bikes.rb.git
$ cd boris_bikes.rb
$ bundle install
```

## <a name="Rspec">Rspec Tests</a>
```shell
$ cd boris_bikes.rb
$ rspec
```

## <a name="Usage">Usage</a>
* How to use and irb output:
```
Makerss-MacBook-Pro-8:boris_bikes.rb student$ irb
2.6.3 :001 > require './lib/garage.rb'
 => true
2.6.3 :002 > bike = Bike.new
 => #<Bike:0x00007fa22a159ba8 @working=true>
2.6.3 :003 > station = DockingStation.new
 => #<DockingStation:0x00007fa22a152330 @capacity=20, @working_bikes=[], @broken_bikes=[]>
2.6.3 :004 > van = Van.new
 => #<Van:0x00007fa22a1410d0 @capacity=10, @loaded_working_bikes=[], @loaded_broken_bikes=[]>
2.6.3 :005 > garage = Garage.new
 => #<Garage:0x00007fa22a132328 @capacity=100, @fixed_bikes=[], @bikes_to_be_fixed=[]>
2.6.3 :006 > bike.report_broken
 => false
2.6.3 :007 > bike
 => #<Bike:0x00007fa22a159ba8 @working=false>
2.6.3 :008 > station.dock(bike)
 => [#<Bike:0x00007fa22a159ba8 @working=false>]
2.6.3 :009 > station
 => #<DockingStation:0x00007fa22a152330 @capacity=20, @working_bikes=[], @broken_bikes=[#<Bike:0x00007fa22a159ba8 @working=false>]>
2.6.3 :010 > van.collect(station, bike)
 => #<Bike:0x00007fa22a159ba8 @working=false>
2.6.3 :011 > van
 => #<Van:0x00007fa22a1410d0 @capacity=10, @loaded_working_bikes=[], @loaded_broken_bikes=[#<Bike:0x00007fa22a159ba8 @working=false>]>
2.6.3 :012 > garage.take(van, bike)
 => #<Bike:0x00007fa22a159ba8 @working=false>
2.6.3 :013 > garage
 => #<Garage:0x00007fa22a132328 @capacity=100, @fixed_bikes=[], @bikes_to_be_fixed=[#<Bike:0x00007fa22a159ba8 @working=false>]>
2.6.3 :014 > garage.fix(bike)
 => #<Bike:0x00007fa22a159ba8 @working=true>
2.6.3 :015 > garage
 => #<Garage:0x00007fa22a132328 @capacity=100, @fixed_bikes=[#<Bike:0x00007fa22a159ba8 @working=true>], @bikes_to_be_fixed=[]>
2.6.3 :016 > garage.give(van, bike)
 => #<Bike:0x00007fa22a159ba8 @working=true>
2.6.3 :017 > van
 => #<Van:0x00007fa22a1410d0 @capacity=10, @loaded_working_bikes=[#<Bike:0x00007fa22a159ba8 @working=true>], @loaded_broken_bikes=[]>
2.6.3 :018 > van.distribute(station, bike)
 => #<Bike:0x00007fa22a159ba8 @working=true>
2.6.3 :019 > station
 => #<DockingStation:0x00007fa22a152330 @capacity=20, @working_bikes=[#<Bike:0x00007fa22a159ba8 @working=true>], @broken_bikes=[]>
2.6.3 :020 > station.release_bike
 => #<Bike:0x00007fa22a159ba8 @working=true>
2.6.3 :021 > bike
 => #<Bike:0x00007fa22a159ba8 @working=true>
 ```
