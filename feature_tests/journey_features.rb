<<<<<<< HEAD
cd require './lib/journey.rb'
=======
require './lib/journey.rb'
require './lib/oystercard.rb'
>>>>>>> dd39eb85972afd90838f38f0dbc6cd8dd66cf137

# USER STORY
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

# Complete Journey
journey = Journey.new
card = Oystercard.new(journey)
card.top_up(50)
card.touch_in("Bank")
p journey
card.touch_out("Highgate")
p journey
card.charge # calculates minimum fare

# Incomplete Journey (no touch out)
journey2 = Journey.new
card2 = Oystercard.new(journey2)
card2.top_up(50)
card2.touch_in("Bank") # User does NOT touch out
p journey2
card2.charge

# Penalty Fare States
# 1. Touch in and don't touch out
# 2. Don't touch in, but touch out

# How do we determine when user HASN'T touched in or out?

# Record current Time and Date of either In or Out
# 'end of day' is Date + 1 and time + 1 min
# If end of day, no tap = penalty charge (and leave empty touch point as nil (or unknown?))
