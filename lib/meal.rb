# Describes an Meal
class Meal
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Meals

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :waiter, :customer, :total, :tip

  # default constructor
  def initialize(waiter=nil, customer=nil, total=nil, tip=0)
    self.waiter = waiter
    self.customer = customer
    self.total = total
    self.tip = tip
    self.save
  end

  # saves Meal instance to all class variable
  def save
    self.class.all << self
  end
end