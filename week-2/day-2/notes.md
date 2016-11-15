- Ruby Comments
 - Comments start with a `#` mark. With a bare `#`, anything that follows will be ignored by Ruby.

- Methods
 - Organizing code
 - Placing a name on a set of steps or a way of doing something
 - Methods have a name, and optionally a set of inputs (arguments) and a return
 - Example:

   ```ruby

   # This method has no inputs or return
   def say_hello
     puts "Hello there!"
   end

   # This method has an input but no returns
   def say_hello(name)
     puts "Hello there #{name}!"
   end

   # This method has inputs and a return
   def make_sentence(name, score)
     return "The score for #{name} is #{score}"
   end
   ```

- More control flow
  - Conditionals
    - Are two things true:
      - `if score > 10 && score < 80`
    - Are either of two things true
      - `if score > 90 || name == "Gavin"`
  - What if we are looking for a few options we have the `case` statement
    ```ruby

    case name
    when "Gavin"
      puts "Instructor"
    when "Mark"
      puts "Instructor"
    when "Jason"
      puts "Instructor"
    when "Dania"
      puts "Ops"
    when "Holly"
      puts "Ops"
    when "Toni"
      puts "Campus Director"
    end
- Classes
 - Ruby is an `Object Oriented Language`
 - Classes/Objects combine data (values) and behavior (methods) into one concept
 - `Class`es are the template that describes what data, and what behavior we have
 - `Object`s are _instances_ of a class.
 - `Class`es are like cookie cutters, where `object`s are like the cookies
 - Instances of objects
   - We have already created many objects, just using the _literal_ form of creating them.
   - e.g. `name = "Gavin"`
   - e.g. `score = 42`:wa
   - e.g. instance of a string: `name = String.new("Gavin")`
 - But we can make our own classes. Lets make one to keep track of information
   about my dog.

   ```
   class Dog
   end

   riley = Dog.new
   ```

 - and we can define methods

   ```
   class Dog
     def age
       return 1
     end
   end
   ```

   And then call them:

   ```
   riley = Dog.new
   p riley.age
   # => 1
   ```

 - But what if there are two dogs with different ages?
 - Same behavior, different data.
 - Must give the data to the object some how
 - Done via the `initialize` method

 ```
 class Dog
   def initialize(age)
     @age = age
   end

   def age
     return @age
   end
 end
 ```

 - New type of variable, the _instance_ variable, noted by
   the fact that it starts with an `@`
 - Every _isntance_ of a `Dog` has it's _own_ instance variables.
 - Now that we have an initialize method we *must* supply the age
   when creating each _instance_ of a Dog.

 ```
 riley = Dog.new(1)
 roscoe = Dog.new(7)
 ```

 - We also added a _behavior_ (method) to ask for the age of a `Dog`
 - `age` simply returns *this* `Dog` instances `@age` _instance_ variable.
 - Thus the same behavior (knowing a `Dog`'s age) but different data (the
   actual age of the dog) results in different action.
 - `attr_accessor` allows us to shortcut the defining of methods to return
   the value of the data (attribute) as well as *set* the value.

 ```
 class Dog
   attr_accessor :age, :sound, :color

   def initialize(age, sound, color)
     @age   = age
     @sound = sound
     @color = color
   end
 end

 riley = Dog.new(1, "woof", "red")
 puts "Riley is #{riley.age} years old, sounds like #{riley.sound} and is #{riley.red} in color"

 # Riley gets a little older
 riley.age = 2
 puts "Riley is now #{riley.age} years old, sounds like #{riley.sound} and is #{riley.red} in color"
 ```

