# QMEE

### Assignment 1 Requirement-
Information about file "Mating_Data_Days_1_-_10": 

This is a dataset from a mating experiment that I was a part of. The associated species was known as Drosophila melanogaster. The treatments were females being exposed to males that had been housed singly before, or males that had been housed with other males before.The males had 60 different genetic backgrounds. Mating trials were conducted over the course of 10 testing days, and the female from each treatment was introduced to a novel male during each mating trial that she took part in. The data is raw and needs to be cleaned up, and I shall do so while working with this dataset over the course of this semester. Biological questions that I would hope to answer using this dataset are "how does the prior experience of male Drosophila melanogaster affect their mating success with females?", and "how does genetic background of male Drosophila melanogaster affect their mating success with females?" Mating success would be determined using the measures of "mating duration and mating latency". Conducting ANOVA analyses, or more advanced related tests, would allow me to see if there are differences in mating success amongst the different treatments. 

### Assignment 2 Requirement

Investigations that I intend on doing with my data include seeing if there is a main effect for genetic line or male housing treatment on mating latency, and if whether or not there is an interaction with regards to this. 
(**BMB**: as we will discuss soon, we will try to get away from "is there an effect?", because **everything always** has an effect in biological systems. We're really asking whether there is a **clear** effect in one direction or the other, how strong it means, and what implications it has. Do you have any *a priori* ideas about what you expect?)
I'd also like to see if there's a main effect for genetic line or male housing treatment on mating duration, and whether or not there is an interaction with regards to this. I will want to see the directionality associated with all of these potential main effects and interactions as well. I'd like to take a look at this across ALL ten days listed in the cumulative data file in this QMEE repository (conduct these analyses for all ten days cumulatively, and for each day individually, seeing if the results change over time). I can separate my data into replicable parts by separating it based on day (the data for each day is segmented into a separate table). I've already been using a table only exclusive to day 1's data for assignments 1 and 2, and can do this with all of the other days as well. 
(**BMB**: I'd actually encourage you **not** to analyze each day separately (except maybe as a preliminary exercise since it will be easier. We can talk about this too. What we have in mind by "replicable components" is that you separate the data cleaning, different kinds of analysis, creating final graphs, etc. into separate units.)

###Assigment 5 Requirement 

I hypothesize that mating duration will be greater for males perceiving greater sperm competition (previously housed with rival males), than for males perceiving lower sperm competition (previously housed singly). I intend on testing this hypothesis by performing a permutation test by "brute force" where I'll be comparing the means of the two groups with each other, and then by using the lmperm function in base R. I'll also be performing "brute force"" resampling, using the t-statistic.  I also hypothesize that mating latency will be lower for males perceiving higher sperm competition, than for males perceiving lower sperm competition. I intend on testing this hypothesis by doing the same three permutation tests as for the hypothesis mentioned before. 


