dir.create("assignment1data")
library(tidyverse)
readdata<-read_csv("./assignment1data/Mating_Data_Day_1.csv")
summary(readdata)
head(readdata)
factor(readdata$CODE)
colnames(readdata)
names(readdata)[names(readdata) == "mating duration"] <- "mating_duration"
colnames(readdata)
model<-lm(mating_duration~CODE,data=readdata)
anova(model)



