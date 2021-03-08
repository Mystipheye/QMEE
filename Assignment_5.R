
library(tidyverse)
fullmatingtable<-read_csv("Mating_Data_Day_1.csv")

## JD: It's good to enter pure checks into the console, or comment them out of scripts
## str (fullmatingtable)

library(dplyr)

#mating latency test #1: brute force permutation test, where test statistic is difference between the means

dflatency<-subset(fullmatingtable, select=c("Treatment", "mating_latency")); dflatency

## JD: There was a typo here; please submit code that runs
print(ggplot(dflatency,aes(Treatment,mating_latency)) + geom_boxplot(fill="lightgray")+stat_sum(alpha=0.7)) + scale_size(breaks=1:2, range=c(3,6))
                                                                                                                  

str(dflatency)

set.seed(101)
res <- numeric(9999)
for (i in 1:9999) {
  perm<- sample(nrow(dflatency))
  dflatencynew <-transform (dflatency, mating_latency=mating_latency[perm])
singlemean <- mean(dflatencynew$mating_latency[dflatencynew=="single"])
rivalmean <-mean(dflatencynew$mating_latency[dflatencynew=="rival"])
res[i]<-singlemean-rivalmean
}
singlemean <- mean(dflatency$mating_latency[dflatency=="single"])
rivalmean <-mean(dflatency$mating_latency[dflatency=="rival"])

obs <- singlemean-rivalmean

allval<- c(res,obs)
hist(res,col="grey",las=1,main="")
     abline(v=obs,col="red")
abline(v=obs,col="red")

## JD It's better to have a check to make sure you are doubling the smaller tail.
2*mean(allval>=obs) #multiplying by 2 to make this relevant to a two-tailed test

#What can be said is that since the derived p-value of 0.223 is greater than 0.05, the observed difference between the rival and single treatments with regards to mating
#latency is not statistically clear. 

#mating latency test #2: permutation test using lmperm

str(dflatency)
library(lmPerm)
summary(lm(mating_latency~Treatment,data=dflatency))

#What can be said is that since the derived p-value of 0.222529 is greater than 0.05, the observed difference between the rival and single treatments with regards to
#mating latency is not statistically clear.

#mating duration test #1: brute force permutation test, where test statistic is difference between the means


dfduration<-subset(fullmatingtable, select=c("Treatment", "mating_duration")); dfduration
str(dfduration)

## JD: and the same typo again; am I missing something weird?
print(ggplot(dfduration,aes(Treatment,mating_duration)) + geom_boxplot(fill="lightgray")+stat_sum(alpha=0.7)) + scale_size(breaks=1:2, range=c(3,6))

set.seed(101)
res2 <- numeric(9999)
for (i in 1:9999) {
  perm<- sample(nrow(dfduration))
  dfdurationnew <-transform (dfduration, mating_duration=mating_duration[perm])
  singlemean <- mean(dfdurationnew$mating_duration[dfdurationnew=="single"])
  rivalmean <-mean(dfdurationnew$mating_duration[dfdurationnew=="rival"])
  res2[i]<-singlemean-rivalmean
}
singlemean <- mean(dfduration$mating_duration[dfduration=="single"])
rivalmean <-mean(dfduration$mating_duration[dfduration=="rival"])

obs2 <- singlemean-rivalmean

allval2<- c(res2,obs2)
hist(res2,col="grey",las=1,main="")
abline(v=obs2,col="red")

2*mean(allval2>=obs2) #multiplying by 2 to make this relevant to a two-tailed test

#What can be said is that since the derived p-value of 8e-04 is less than 0.05, the observed difference between the rival and single treatments with regards to mating latency
#is statistically clear, and is due to some real phenomenon. 
## JD: Better to say: the observed longer mating duration in "single" is due to a real phenomenon. Not just he observed difference.

#Mating Duration Test 2: permutation test using lmperm
str(dfduration)
summary(lm(mating_duration~Treatment,data=dfduration))

#What can be said is that since the derived p-value of 0.000484 is greater than 0.05, the observed difference between the rival and single treatments with regards to mating
#duration is statistically clear, and is due to some real phenomenon.

## GRade 2.1
