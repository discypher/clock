# Clock coding challenge

This class will take a time in the HH:MM format and calculate the degrees
for the smallest angle between the hour and minute hands.


To run:

in irb:

```
$ irb -r ./clock.rb
2.4.1 :001 > Clock.new("08:15 PM").to_degrees
 => 157
```

tests:

```
gem install rspec
rspec clock_spec.rb
```
