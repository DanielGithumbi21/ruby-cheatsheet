
require 'pry'

# STRINGS
name = "Daniel Githumbi"
puts name.class
puts name.methods
puts name.upcase
puts "My Name is #{name}"


# NUMBERS


# integer
age = 7
puts age

# float
price = 28.23
puts price

# NIL

returns absenc of a value

# BOOLEAN

is_admin = true

puts is_admin

# SYMBOLS

puts :this_is_a_symbol.object_id

# ARRAYS

age_sets = [21,34,67,89,65,12,23,43,54]

p age_sets.reverse
p age_sets.sort
p age_sets.length

age_sets[0] = 34
p age_sets

p age_sets.first

p age_sets.slice(0,3)


# adding to an array
age_sets.push(45)
age_sets.unshift(90)
age_sets << 67
p age_sets

# removing from an array
age_sets.pop()
age_sets.shift()
p age_sets

# advanced

puts age_sets.include?(56)

p age_sets.reverse

puts age_sets.sum

p age_sets.uniq


# HASHES -> Equivalent to plain javascript objects


 student = {
    name:"patrick",
    age:23,
    is_disabled: false
 }
 p student[:name]

 will return nil
 p student[:names]

 student[:name] = "Joseph"
  p student

student[:year] = "third"

p student

student.delete(:year)
p student


p student.empty?


# NESTED HASHES

contacts = {
  "Jon Snow" => {
    name: "Jon",
    email: "jon_snow@thewall.we",
    favorite_ice_cream_flavors: ["chocolate", "vanilla", "mint chip"],
    knows: nil
  },
  "Freddy Mercury" => {
    name: "Freddy",
    email: "freddy@mercury.com",
    favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  }
}

contacts.each do |person, data|
    #at this level, "person" is Jon Snow or Freddy and "data" is a hash of
    #key/value pairs to iterate over the "data" hash, we can use the following
    #line:
  
    data.each do |attribute, value|
      #at this level, "attribute" describes the key of :name, :email,
      #:favorite_ice_cream_flavors, or :knows we need to first check and see if
      #the key is :favorite_ice_cream_flavors, if it is, that means the VALUE is
      #an array that we can iterate over to print out each element
  
      if attribute == :favorite_ice_cream_flavors
        value.each do |flavor|
          # here, each index element in an ice cream flavor string
          puts "#{flavor}"
        end
      end
    end
  end


# ENUMERABLES

# map

upcased = ["this", "is", "Ruby"].map do |str|
    str.upcase
  end

 p upcased

# METHODS

def my_method(param)
    puts "This is my method"
    param + 1
end

# Local variable
name = "Carter"

# Global variable
$name = "Carter"

# Instance variables
@name = "Carter"

# Class variables
@@name = "Carter"

# Binding


def prying_into_the_method
  inside_the_method = "We're inside the method"
  puts inside_the_method
  puts "We're about to stop because of pry!"
  binding.pry
  this_variable_hasnt_been_interpreted_yet = "The program froze before it could read me!"
  puts this_variable_hasnt_been_interpreted_yet
end

prying_into_the_method


# Conditional Statements
# FizzBuzz

def fizz_buzz (number)
    if number.modulo(3) == 0 && number.modulo(5) == 0
        puts "FIZZBUZZ"
        "FIZZBUZZ"   
    elsif number.modulo(3) == 0
        puts "FIZZ"
        "FIZZ"  
    elsif number.modulo(5) == 0
        puts "BUZZ"
        "BUZZ"   
    else
        puts number
        number        
    end
end

fizz_buzz(33)

# LOOPS
# While loop

i = 0

while i<5
    puts i
    i += 1
end

# Looping with #times

10.times do |i|
    puts "Looping!"
    puts "i is: #{i}"
end

# Looping with #Each

(1..20).each do |num|
    puts num
end

def happy_new_year
    i = 10
    while i > 0
        puts i
        i -= 1
    end

    puts "Happy new year"
end

happy_new_year


# OBJECT ORIENTATION

class Dog
    # setter method
    def name=(value)
      @name = value
    end
  
    # getter method
    def name
      # access the data from the @name instance variable and return it
      @name
    end
end
  
  odie = Dog.new
  odie.name = "Odie"
  
  # call the Dog#name method
  puts odie.name




class Person

    def name=(value)
        @name = value
      end
    
      # getter method
      def name
        # access the data from the @name instance variable and return it
        @name
      end
    def talk
        puts "The person is talking"
    end

    def walk
        puts "The person is walking"
    end
end

dan = Person.new
dan.name = "Daniel"
puts dan.name
dan.walk
dan.talk


# USING MACROS

# shortens our getters and setters methods

class Human
  attr_reader :name
  attr_writer :name
end

jay_z = Human.new
jay_z.name = "Carter"

puts jay_z.name


class Cat
  attr_accessor :name
  attr_reader :breed
# Initializing when class is called
  def initialize(breed)
    @breed = breed
  end

  def meow
    puts "meows"
    
  end
end

puss = Cat.new("hhhhhh")
puss.name = "paka"
puts puss.name
puss.meow
puts puss.breed


class Anagram
  attr_reader :word
  def initialize (word)
    @word = word
    
  end

  def match (words)
    words.map do |x|
      if x.include?(word)
        x
      end
    end
  end
  
end

anagram = Anagram.new("listen")
p anagram.match(%w[enlists google inlets banana])


# USING SELF

class Footballer
  attr_accessor :name, :team
  def initialize (name)
    @name = name
  end

  def change_team (team_name)
    self.team = team_name   
  end

  def player_info
    "I am #{self.name} I play for #{self.team}"
    
  end
  
  
end

footballer = Footballer.new("Messi")
puts footballer.name
footballer.change_team("Arsenal")
puts footballer.team
puts footballer.player_info

# CLASS VARIABLES and CLASS CONSTANTS
class Album

  # class variable
  @@album_count = 0

  # class constant
  GENRES = ["hip-hop","Jazz","Rock"]
  def initialize
    @@album_count += 1
  end

  def self.count
    @@album_count
  end
end

Album.new
Album.new

puts Album.count


class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  def self.print_all_song_names
    self.all.each do |song|
      puts song.name
    end
  end 
end

hello = Song.new("Hello")
goodbyes = Song.new("Goodbyes")
savage = Song.new("savage")

puts Song.print_all_song_names


# PUBLIC AND PRIVATE METHODS

class Bartender
  attr_accessor :name
  @@all = []

  def initialize (name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def make_drink
    @ingredients = []
    choose_liquor
    choose_mixer
    choose_garnish

    "Here is your drink, it contains #{@ingredients}"
  end


  private

  def choose_liquor
    @ingredients << "Whiskey"
  end

  def choose_mixer
    @ingredients << "Vermouth"
  end

  def choose_garnish
    @ingredients << "Olives"
  end
  
end

phil = Bartender.new("Phil")

puts phil.make_drink


# RUBY CUSTOM ERRORS

class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    end
  end

  class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name


# INHERITANCE


class Vehicle

    attr_accessor :wheel_size, :wheel_number

    def initialize (wheel_number,wheel_size)
        @wheel_number =  wheel_number
        @wheel_size = wheel_size
    end

    def go
        "Vrrrrrrrrroooom"
    end

    def fill_up_tank
        "filllling"
    end
    
    
end


class Car < Vehicle
    def go
        "VROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOMMMMMMMMMMM"
    end
    
end

car = Car.new("234",9000)

puts car.go


class User
    attr_accessor :first_name, :last_name
    def initialize (first_name,last_name)
        @first_name = first_name
        @last_name = last_name
    end
end

class Teacher < User
    KNOWLEDGE = ["a String is a type of data in Ruby", "programming is hard, but it's worth it", "javascript async web request", "Ruby method call definition", "object oriented dog cat class instance", "class method class variable instance method instance variable", "programming computers hacking learning terminal", "bash Ruby rvm update certs"]
    def teach
        KNOWLEDGE.sample(1)
    end
    
end


class Student < User
    @@knowledge = []

    def knowledge
        @@knowledge
    end

    def learn (skill)
        @@knowledge << skill
    end
    
end

student = Student.new("Daniel","Carter")


student.knowledge

# super is used to call a method on the superclass with the same name as the subclass



# METAPROGRAMMING


# keyword arguments

# Now I can use these arguments interchangably
def my_age(name:,age:)
    puts "My name is #{name}"
    age += 1
    puts "I am #{age} years old"
end

my_age(age:31,name: "Carter")
