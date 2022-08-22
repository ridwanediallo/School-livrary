# !/usr/bin/env ruby
require_relative 'classes/person'

person = Person.new(55, 'Ridwan', parent_permission: false)
puts person.can_use_services?
puts person.parent_permission
