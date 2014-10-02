require_relative 'Infection'
class Simulation
  @@day = 0
  @@incubation_period = {}
  def initialize(healthy_pop,quarantine_pop=0,sick_pop=0,infected=1)
    @healthy_pop = healthy_pop
    @quarantine_pop = quarantine_pop
    @sick_pop = sick_pop
    @infected = infected
  end

  def start_sim(rate_of_infection,incubation_period,quarantine_trigger,immune_pop=0,virulence=nil,rate_of_quarantine=0.1)
    v = Infection.new(rate_of_infection, incubation_period, @healthy_pop, @infected, immune_pop)
    until @healthy_pop <= 0 do
      # puts @healthy_pop
      begin
        infection_result = v.virus(virulence)
        @healthy_pop = infection_result[0]
        @infected_results = infection_result[1]
        @immune = infection_result[2]
        @pop_change = infection_result[3]
        incubation(@@day,@infected_results,incubation_period, quarantine_trigger,rate_of_quarantine)
        @@day += 1
        puts "Day: #{@@day} - Healthy Pop: #{@healthy_pop}, Infected: #{@infected_results}, Sick: #{@sick_pop}, Immune: #{@immune}, Quarantine: #{@quarantine_pop}"
      rescue
        break
      end
    end
    puts "Final Day: #{@@day} - Healthy Pop: #{@healthy_pop}, Infected: #{@infected_results}, Sick: #{@sick_pop}, Immune: #{@immune}, Quarantine: #{@quarantine_pop}"
  end

  def incubation(day,infected,incubation_period, quarantine_trigger,rate_of_quarantine)
    @@incubation_period[day] = @pop_change
    if day >= incubation_period && infected > 0
      @sick_pop = @@incubation_period[day - 10]
      @infected -= @@incubation_period[day - 10]
      quarantine(quarantine_trigger,incubation_period,rate_of_quarantine)
    end
  end

  def quarantine(quarantine_trigger, incubation_period,rate_of_quarantine=0.1)
    if @@incubation_period.values[0] != nil && @@day >= incubation_period
      if @@incubation_period.values.max > quarantine_trigger
        pop_change = (@sick_pop * rate_of_quarantine).to_i
        @sick_pop -= pop_change > 0 ? pop_change : 1
        @quarantine_pop += pop_change > 0 ? pop_change : 1
        # cure(@immune)
      end
    end
  end

  def cure(immune_pop)
    if immune_pop > 5000
      @quarantine_pop -= (@quarantine_pop * 0.50).to_i
      @immune += (@quarantine_pop * 0.50).to_i
      puts "Adding #{@quarantine_pop} immune pop is now: #{@immune}"
      return @quarantine_pop, @immune
    end
  end
end