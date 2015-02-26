1. Used initialize on the provided client function from the Twitter gem, thinking we could add a user there in the future if we convert to rails and can use the user data to populate those fields. In a model for future instead of one file.

2. For the Twitter gem, I feel like I can't do the kind of testing I want. I can't really see how the objects are constructed and can't mimic the actions in my tests, so I am relying on their testing of their code that I implement. May have been better, but slower, to user Faraday. 
