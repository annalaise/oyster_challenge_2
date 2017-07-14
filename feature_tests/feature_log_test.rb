
# FEATURE TEST FOR JOURNEYLOG, Challenge 15

# Initialize the JourneyLog with a journey_class parameter (hint: journey_class expects an object that knows how to create Journeys. Can you think of an object that already does this?)
# #start should start a new journey with an entry station
#  a private method #current_journey should return an incomplete journey or create a new journey
#  #finish should add an exit station to the current_journey
#  #journeys should return a list of all previous journeys without exposing the internal array to external modification
#  remove redundant code from OysterCard class

# Creates a new card, touches in and out at different stations, charges card
card = Oystercard.new
journeylog = JourneyLog.new
card.top_up(50)
card.touch_in("Bank") # journeylog.start is called here and creates new instance of journey

p journey
card.touch_out("Highgate")
p journey
card.charge # calculates minimum fare
