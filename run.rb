require "pry"

class Animal
  attr_accessor :name, :age, :species
  @@all = []
  def initialize(args)
    args.each_key do |key, value|
      # This 'self.send()' method allows us to build a dynamic class with an unlimited amount of attributes
      # if needed
      self.send("#{key}=", args[key])
    end
    @@all << self
  end
  def self.all
    @@all
  end
  def self.method_builder(method_name)
    define_method(method_name) {
      "Hello World"
    }
  end

end

cat = {
  name: "Jacques",
  age: 8,
  species: "F.catus"
}

animal = Animal.new(cat)

# NOTE:
# Here we are calling the class method from the 'Animal' class, and provide it the value of 'Hi':
# This literally creates a new method, "Hi", which can be then called using 'animal.Hi':
Animal.method_builder("Hi")

binding.pry
