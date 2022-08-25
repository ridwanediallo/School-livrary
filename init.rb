# !/usr/bin/env ruby
require_relative 'classes/person'
require_relative 'classes/decorator'
require_relative 'classes/nameable'
require_relative 'classes/capitalize_decorator'
require_relative 'classes/trimmer_decorator'
require_relative 'classes/student'
require_relative 'classes/classroom'

# person = Person.new(55, 'Ridwan', parent_permission: false)
# puts person.can_use_services?
# puts person.parent_permission

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name


puts "---------------------"

student = Student.new('React', 55, 'Ridwan')
classroom = Classroom.new('React')

student.classroom = classroom
p classroom
p student

