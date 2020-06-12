class Customer
    attr_accessor :name, :age
  
    @@all = []
  
    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end
  
    def self.all
      @@all
    end

    #the ability to create a `meal`. To do this, they'll need to take in an instance of a `waiter` and supply the `total` and `tip`, which we'll have defaulted to 0 here as well
    #As you can see, we don't need to take `customer` in as an argument, because we're passing in `self` as a reference to the current instance of customer.
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select do |meal|
          meal.customer == self
        end
    end

    def waiters
        meals.map do |meal|
          meal.waiter
        end
    end
  
end