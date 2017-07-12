require './lib/journey.rb'

# USER STORY
# In order to be charged correctly
# As a customer
# I need a penalty charge deducted if I fail to touch in or out

journey = Journey.new
card = Oystercard.new

card.top_up(50)
card.touch_in("Bank")
p journey.entry_station
card.touch_out("Highgate")
p journey.exit_station



journey.save_journey # adds journey to array (journey finish)
journey.calc_fare # within this, detects normal or penalty fare
journey.complete?



# Penalty Fare States
# 1. Touch in and don't touch out
# 2. Don't touch in, but touch out

# How do we determine when user HASN'T touched in or out?

# Record current Time and Date of either In or Out
# 'end of day' is Date + 1 and time + 1 min
# If end of day, no tap = penalty charge (and leave empty touch point as nil (or unknown?))

Plan
