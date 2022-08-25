require_relative 'nameable'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
  end

  def add_rental(rental)
    rental.person = self
    @rentals << rental unless @rentals.include?(rental)
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end

  private

  def is_of_age?
    @age >= 18
  end
end
