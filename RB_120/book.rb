class Banner
  WIDTH = 78
  
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  

  def horizontal_rule
    "+#{'-' * WIDTH}+"
  end

  def empty_line
    "|#{' ' * WIDTH}|"
  end

  def message_line
    half = (WIDTH - @message.size) / 2
    
    "|#{' ' * half}#{@message}#{' ' * half}|"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

# class Vehicle
#   attr_accessor :color
#   attr_reader :year, :model

#   @@number_of_vehicles = 0

#   def self.number_of_vehicles
#     puts "This program has created #{@@number_of_vehicles} vehicles"
#   end

#   def initialize(year, model, color)
#     @year = year
#     @model = model
#     @color = color
#     @current_speed = 0
#     @@number_of_vehicles += 1
#   end

#   def self.gas_mileage(miles, gallons)
#     puts "Your car gets #{miles / gallons}MPG"
#   end
# end

# class MyCar < Vehicle
#   NUMBER_OF_DOORS = 4
# end

# class MyTruck < Vehicle
#   NUMBER_OF_DOORS = 2
# end

# class MyCar
#   attr_accessor :color, :model, :speed
#   attr_reader :year

#   def initialize(y, c, m)
#     @year = y
#     @color = c
#     @model = m
#     @speed = 0
#   end

#   def show_year(y)
#     puts "The year of the car is #{year}!"
#   end

#   def accel(number)
#     self.speed += number
#     puts "You pushed the gas and accellerate #{number} MPH!"
#   end

#   def brake(number)
#     self.speed -= number
#     puts "You pushed the brake slowed down #{number} MPH!"
#   end

#   def current_speed
#     puts "You are now going #{self.speed} MPH!"
#   end

#   def stop
#     self.speed = 0
#     puts "Let's park this bad boy!"
#   end

#   def spray_paint(color)
#     self.color = color
#     puts "Your new #{color} car looks amazing!"
#   end

#   def info
#     "Your car is a #{color} #{year} #{model}"
#   end
# end

# volt = MyCar.new(2017, 'grey', 'Chevy Volt')

# MyCar.gas_mileage(300, 15)

# volt.current_speed

# class Animal
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end
# end

# class BadDog < Animal
#   def initialize(age, name)
#     super(name)
#     @age = age
#   end
# end

# fido = BadDog.new(14, 'Fido')
# p fido
# class GoodDog < Animal
#   attr_accessor :name, :height, :weight

#   # def initialize(n, h, w)
#   #   self.name   = n
#   #   self.height = h
#   #   self.weight = w
#   # end
#   def initialize(color)
#     super
#     @color = color
#   end

#   def change_info(n, h, w)
#     self.name   = n
#     self.height = h
#     self.weight = w
#   end

#   def what_is_self
#     self
#   end

#   def speak
#     " from GoodDog class"
#   end

#   def info
#     "#{self.name} weighs #{self.weight} and is #{self.height} tall."
#   end
# end

# sparky = GoodDog.new('Brown')
# p sparky
# sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
# puts sparky.what_is_self
# puts sparky.speak
