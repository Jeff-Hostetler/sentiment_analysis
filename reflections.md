1. Used initialize on the provided client function from the Twitter gem, thinking we could add a user as an arguemnt in the future if we convert to rails and can use the user data to populate those fields. In a model for future instead of all code in one file.

2. For the Twitter gem, I feel like I can't do the kind of testing I want. I can't really see how the objects are constructed and can't mimic the actions in my tests, so I am relying on their testing of their code that I implement. May have been better, but slower, to user Faraday.

3. Unfortunately, I do not know how to use rspec with the OptionParser class. As a junior dev, one reason I want to work at a place like Foraker is learning how to write the best code, including implementing better testing. I test drive in Rails, I swear. I didn't want to ask instructors how as this is my personal assessment

4. I split the input/output portion of the sentiment class into the print method. This was so that in the future when this is a rails app, the run_sentiment method runs on its own/ inputs will be entered from other areas other than command line. 
