# Variables
- Strings
 - `name = "Gavin"`
 - `name.length`
 - `"My score is #{41 + 1}"`
- Numbers
 - `score = 42`
- Arrays
 - `scores = [100, 98, 42, 65]`
 - Indexing
   - `scores[0]` is the _first_ thing in the array (100)
   - `scores[1]` is the _second_ thing in the array (98)
 - Negative indexing
   - `scores[-1]` is the _last_ thing in the array (65)
   - `scores[-2]` is the _second to last_ thing in the array (42)
 - Returns `nil` if the index isn't there
   - `scores[500]` is `nil`
 - Methods
   - `length` gives you the length of the array
 - Can store mixed types
   - `my_array = ["Gavin", 42, "Toni", 100]
   - `array_with_arrays_inside = ["Gavin", 42, ["Toni", "Jason"], 100]`
- Hash (like a dictionary)
 - `person = { "name" => "Gavin Stark", "score" => 42, "favorite_color" => "blue" }`
 - `person["score"]` (returns _42_)
 - `person["favorite_color"]` (returns _blue_)
 - Returns `nil` if the key isn't there `person["address"]` returns `nil`
 - Values (and keys, though they are usually strings) can be comples
   - `person = { "name" => "Gavin Stark", "scores" => [100, 98, 42, 64] }
   - `person["scores"]` is `[100, 98, 42, 64]`
   - `person["scores"][2]` is `42` since `person["scores"]` is an array, and then we index the array at `2` to get the _third_ element


# Control Flow
- if statements

```ruby
if name == "Gavin"
  puts "The name was Gavin!"
else
  puts "The name isn't Gavin"
end
```

# Interacting with users
- puts (print out)
- gets (read from, remember to chomp)

# Looping
- loop / break

```ruby
loop do
  puts "Give me some input"
  input = gets.chomp
  if input == "done"
    break
  ene
  puts "You said #{input}"
end
```

