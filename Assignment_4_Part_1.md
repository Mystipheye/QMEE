Assignment 4 Part 1 (MMV Question):
  
  - MMV is a viral infection that can cause a serious disease (called MMD)
- MMD patients are unable to control their natural urge to make mathematical models that attempt to describe biological phenomena
- The rapid MMV test gives a positive result:
  - 100% of the time for people with the virus
- 5% of the time for people without the virus
- A certain population has a prevalence of 1%
- You pick a person from this population at random, and test them, and the test is positive.

a) What is the probability that they have MMV?
  
  b) You learn that your friend has a positive rapid test for MMV. What do you tell them?
  

A:
  
  a) Bayes Theorem: P(H1|E) = P(E|H1) P(H1)/(P(E|H1) P(H1) + P(E|H2) P(H2))
  
  P(H1|E) - Posterior probability for MMV given positive test
P(H1) - Prior probability for MMV in that specific population before any test is administered
P(H2) - Prior probability for no MMV in that specific population before any test is administered
P(E|H1) – Probability for positive test given that one has MMV
P(E|H2) – Probability for positive test given that one doesn't have MMV

P(E|H1)=1(100%/100%=1)

p(E|H2)=0.05(5%/100%=0.05)

P(H1)=0.01(1%/100%=0.01)

P(H2)=0.99(100%-1%)/100%=99%/100%=0.99)

P(H1|E) = (1)(0.01)/((1) (0.01) + (0.05)(0.99))

             =0.17.

The probability that they have MMV is 0.17.

b) There are no chances of false negatives with this test, but there is a 5% chance of getting a false positive. 
If my friend were found to have a positive test for MMV, I'd tell them to take the test again. If they took the 
test again and were found to have a positive test, then that would mean that they probably have MMV, as the probability 
of getting two positive tests while not having MMV is 0.0025 (0.5*0.5), which is rather low. If during their second test
they were found to have a negative test, then that would mean that they don't have MMV, and that the result of their 
first test was a false positive. This is because given the probabilities, a false negative can't occur here.

**BMB: this is fine. See notes about the possible issues with multiple testing. Good point about perfect sensitivity.**
