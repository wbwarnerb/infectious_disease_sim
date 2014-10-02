require_relative 'Simulation'
=begin
This simulation is influenced by several equations and calculations for viral disease transmission:
http://en.wikipedia.org/wiki/Apparent_infection_rate

Definitions:
Healthy Pop: The population that is not yet infected with this virus.
Infected: Those who are infected but not yet showing signs of the virus.
Sick: Infected population who are now experiencing the viral symptoms.
Immune: those members of the population that are immune to the viral infection.
Quarantine: Those placed in quarantine, to remove them from spreading the sickness.

Parameters:
The Simulation class takes a required value of population size (i.e. 8000000) and an optional
value for sick population as well as infected population (these are defaulted to 0 and 1.)

The start_sim method takes the following parameters:
Required
--------
rate_of_infection (a percentage from 0 to 1, 1 = 100% of population are infected each day)
incubation_period (number of days for the virus to manifest symptoms in infected people)
quarantine_trigger (number of sick patients required to start quarantine measures)

Optional
--------
immune_pop (those who start the simulation immune to the virus / disease - default is 0)
virulence (virus strength that determines overcoming immunities, if no value defaults to random roll from 1 to 100)
rate_of_quarantine (the percentage of people put in quarantine per day, default is 0.1)
Human Resistance Stats
----------------------
Human resistance is calculated in the Person class.  It is primarily based on age as a factor of resistance.

Example:
To run the sim for 8,000,000 people being introduced to a contagion that:
infects 5% of the population per day, incubates for 10 days, quarantine will start after 10 sick patients,
with no immune population to begin with, and the virus strength is set to 30/100:

sim = Simulation.new(8000000)
sim.start_sim(0.05,10,10,0,30)

A real world sim would unfortunately be the recent ebola outbreak. In Seirra Leone it is reported
(http://www.theguardian.com/world/2014/oct/02/ebola-infecting-five-every-hour-sierra-leone)
5 people are infected every hour (120 a day) and the total pop of Seirra Leone is around 5700000 (Population data
taken from http://en.wikipedia.org/wiki/Demographics_of_Sierra_Leone).

That is a infection rate per day of 0.000002
sim = Simulation.new(5700000)
sim.start_sim(0.000002,3,3,0,30)
=end

# Example of Sierra Leone sim:
# 5.7 mil population
# 0.000002 people infected each day (constant)
# incubation = 10 days to symptoms appear and factoring no immunity to disease
sim = Simulation.new(5700000)
sim.start_sim(0.000002,10,10,0,50)