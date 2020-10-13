# Describes an Waiter
class Waiter
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Waiters

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :name, :experience

  # default constructor
  def initialize(name=nil, experience=nil)
    self.name = name
    self.experience = experience
    self.save
  end

  # saves Waiter instance to all class variable
  def save
    self.class.all << self
  end

  # initializes a meal with the given customer and associates it with this waiter
  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  # returns all meals associated with this waiter
  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  # returns all customers associated with this waiter
  def customers
    self.meals.map do |meal|
      meal.customer
    end
  end
  
  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
  
    best_tipped_meal.customer
  end

end