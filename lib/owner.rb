require 'pry'

class Owner
  
  attr_reader :name, :species 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all 
    @@all 
  end
  
  def self.count 
    @@all.count
  end
  
  def self.reset_all 
    @@all.clear 
  end
  
  def cats 
    Cat.all.find_all {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.find_all {|dog| dog.owner == self}
  end
  
  def buy_cat(cat_name) 
    Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  
  def walk_dogs 
    dogs = self.dogs 
    dogs.each {|dog| dog.mood = "happy"}
  end 
  
  def feed_cats 
    cats = self.cats
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets 
    dogs = self.dogs
    dogs.each {|dog| dog.mood = "nervous"}
    dogs.each {|dog| dog.owner = ""}
    cats = self.cats 
    cats.each {|cat| cat.mood = "nervous"}
    cats.each {|cat| cat.owner = ""}
  end
  
end