## JD: This is not part of your script; this is something you do once.
## dir.create("assignment1data")

library(tidyverse)

## JD: It seems from the flow that you meant to put the script in the main directory, so I moved it. I also gave it a more focused name
## JD: I'm also wondering about your main data set; why put it in a folder called assignment1data instead of data/?

## JD: This seems fine, though not ambitious. The "calculation" is canned
readdata<-read_csv("assignment1data/Mating_Data_Day_1.csv")
summary(readdata)
head(readdata)
factor(readdata$CODE)
colnames(readdata)
names(readdata)[names(readdata) == "mating duration"] <- "mating_duration"
colnames(readdata)
model<-lm(mating_duration~CODE,data=readdata)
anova(model)

## JD: The names thing would be a good one to learn how to do in tidyverse

## JD: Grade 1.8/3



