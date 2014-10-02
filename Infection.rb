require_relative 'Person'
class Infection
  def initialize(rate_of_infection, incubation, healthy_pop, infected_pop, immune_pop)
    @rate_of_infection = rate_of_infection
    @duration = incubation
    # @fatality = fatality
    @healthy_pop = healthy_pop
    @infected_pop = infected_pop
    @immune_pop = immune_pop
  end
  def virus(virus_s=nil)
    # puts "infected pop: #{@infected_pop}"
    virus_strength =  if virus_s == nil
                        rand(1..100)
                      else
                        virus_s
                      end
    todays_infected = *(1..(@rate_of_infection * @healthy_pop))
    infected_count = todays_infected.length > 0 ? todays_infected.length : nil
    pop_affected = (@infected_pop * @rate_of_infection).to_i
    person = Person.new
    if infected_count != nil
      infected_count.times {
        individual = person.generate_stats(rand(1..80))
        if virus_strength > individual
          @healthy_pop -= pop_affected > 0 ? pop_affected : 1
          @infected_pop += pop_affected > 0 ? pop_affected : 1
        else
          @healthy_pop -= 1 # pop_affected > 0 ? pop_affected : 1
          @immune_pop += 1 # pop_affected > 0 ? pop_affected : 1
        end
      }
      # puts @healthy_pop
      if @healthy_pop[0] == nil
        return [0], @infected_pop, @immune_pop, infected_count
      else
        return @healthy_pop, @infected_pop, @immune_pop, infected_count
      end
    end
  end
end
