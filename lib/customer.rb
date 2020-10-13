# Describes an Customer
class Customer

  ### CLASS DEFINITIONS ###

  # Class variables
  @@all = [] # list of all Customers

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :name, :age

  # default constructor
  def initialize(name=nil, age=nil)
    self.name = name
    self.age = age
    self.save
  end

  # saves Customer instance to all class variable
  def save
    self.class.all << self
  end

  # initializes a meal with the given waiter and associates it with this customer
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  # Returns all meals associated with this customer
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end

  # Returns all waiters associated with this customer through meals
  def waiters
    self.meals.map do |meal|
      meal.waiter
    end
  end

end