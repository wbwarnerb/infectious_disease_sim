#Infections Disease/Virus Simulation

This simulation is influenced by several equations and calculations for viral disease transmission:
http://en.wikipedia.org/wiki/Apparent_infection_rate

##Definitions:
Healthy Pop: The population that is not yet infected with this virus.
Infected: Those who are infected but not yet showing signs of the virus.
Sick: Infected population who are now experiencing the viral symptoms.
Immune: those members of the population that are immune to the viral infection.
Quarantine: Those placed in quarantine, to remove them from spreading the sickness.

##Parameters:
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

Human Resistance Stats
----------------------
Human resistance is calculated in the Person class.  It is primarily based on age as a factor of resistance.

##To-Do:
- Follow the calculations here: http://en.wikipedia.org/wiki/Mathematical_modelling_of_infectious_disease
to simulate mass vaccinations
- Add a fatality param, so that a % of the sick will not be curable.
- Rate of infection should be dynamic (not constant.)

##Example:
To run the sim for 5,700,000 people being introduced to a contagion that:
infects 0.0002% of the population per day (120 people), the virus incubates for 10 days (before showing symptoms in host),
quarantine will start after 10 sick patients, with no immunity to the contagion (virus strength is 100):

sim = Simulation.new(5700000)
sim.start_sim(0.000002,10,10,0,100)

Output would look like so:

...

Day: 19 - Healthy Pop: 5697701, Infected: 2300, Sick: 10, Immune: 0, Quarantine: 9

Day: 20 - Healthy Pop: 5697580, Infected: 2421, Sick: 10, Immune: 0, Quarantine: 10

Day: 21 - Healthy Pop: 5697459, Infected: 2542, Sick: 10, Immune: 0, Quarantine: 11

Day: 22 - Healthy Pop: 5697338, Infected: 2663, Sick: 10, Immune: 0, Quarantine: 12

Day: 23 - Healthy Pop: 5697217, Infected: 2784, Sick: 10, Immune: 0, Quarantine: 13

Day: 24 - Healthy Pop: 5697096, Infected: 2905, Sick: 10, Immune: 0, Quarantine: 14

Day: 25 - Healthy Pop: 5696975, Infected: 3026, Sick: 10, Immune: 0, Quarantine: 15

...

#Running the Simulation
This uses the Ruby standard library (no gems required.)
Simply pull and update the run_simulation.rb file (modify as desired.)