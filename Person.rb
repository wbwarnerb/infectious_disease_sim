# require_relative 'Infection'
class Person
  def generate_stats(age)
    result = case age
      when 0..6
        immunity = rand(1..5)
      when 5..10
        immunity = rand(6..20)
      when 11..19
        immunity = rand(20..30)
      when 20..30
        immunity = rand(30..40)
      when 30..50
        immunity = rand(20..30)
      when 51..60
        immunity = rand(6..20)
      else
        immunity = rand(1..5)
    end
  end
end