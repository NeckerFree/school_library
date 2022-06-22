require './decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    super()
    @nameable.correct_name.capitalize
  end
end
