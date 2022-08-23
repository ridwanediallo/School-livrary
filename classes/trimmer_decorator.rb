require_relative 'decorator'

class TrimmerDecorator < Decorator
  def correct_name
    name_to_trim = @nameable.correct_name
    name_to_trim.slice!(10, name_to_trim.length) if name_to_trim.length > 10
    name_to_trim
  end
end
