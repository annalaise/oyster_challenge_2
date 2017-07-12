## Our Approach (Challenge 14)

We extracted the Journey class from Oystercard, planning this first in [journey_features.rb](https://github.com/annalaise/oyster_challenge_2/blob/master/feature_tests/journey_features.rb). This helped us to plan the functionality of the Journey class.

We then wrote the spec suite for Journey, and gradually extracted features from Oystercard and adapted them for Journey's more sophisticated feature set.

#### Features

Oystercard can:
- touch in
- touch out
- deduct fares, which are calculated by Journey

Journey can:
- receive *entry station* from Oystercard (set to nil by default)
- receive *exit station* from Oystercard (set to nil by default)
- *save the journey*, regardless of whether it is complete or not
- determine if the journey is *complete* or not
- *calculate the fare* based on the complete / incomplete status, which it passes back to Oystercard to deduct
