class Person
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
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
