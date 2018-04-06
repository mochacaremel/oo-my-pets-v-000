require "pry"

class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  @@owner_count = 0

  def initialize(species)
    @species = species
    @@owner_count += 1
    @pets = {
      fishes: [],
      dogs: [],
      cats: []
    }
    @@all << self
    @name = ""
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@owner_count = 0
  end

  def self.count
    @@owner_count
  end

  def say_species
    "I am a human."
  end

  def name
    @name
  end

  def pets
    @pets
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].collect { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    self.pets[:cats].collect { |cat| cat.mood = "happy" }
  end

  def feed_fish
    self.pets[:fishes].collect { |fish| fish.mood = "happy" }
  end

  def sell_pets
    self.pets.collect do |pet_type, pets|
      pets.collect { |pet| pet.mood = "nervous" }
    end
    @pets.clear
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end