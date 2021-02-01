
library(tidyverse)
matingtable<-read_csv("Mating_Data_Day_1.csv")
matingtable<-as.data.frame(matingtable)
structure(matingtable) #upon inspection, seems like there are 120 unique combinations of code(treatment) and line, none of which are mislabeled 
summary (matingtable)
matingtable$Line<-as_factor(matingtable$Line)
matingtable$Code<-as_factor(matingtable$Code)
matingtable<-rename(matingtable, "Mating_Duration"="mating duration") ##rename=tidyverse's function for renaming a column
matingtable<-rename(matingtable, "Mating_Latency"="mating latency")
group_by(matingtable,Mating_Duration, Line, Code)%>%summarize(count = n())%>%filter(count>0)%>%print ##shows that there are 120 unique combinations, which means there are no redundancy errors with mating duration
group_by(matingtable,Mating_Latency, Line, Code)%>%summarize(count = n())%>%filter(count>0)%>%print  ##shows that there are 120 unique combinations, which means there are no redundancy errors with mating latency
ggplot(matingtable, aes(x=Mating_Duration)) +geom_histogram(bins=30) +labs(x="Mating Duration(s)") #seems like there MIGHT be some erroneous lower mating duration values
ggplot(matingtable, aes(x=Line,y=Mating_Duration, color=Code)) + geom_point() +labs(x="Line", y="Mating Duration(s)")
ggplot(matingtable, aes(x=Mating_Latency)) +geom_histogram(bins=30)  +labs(x="Mating Latency(s)") #seems like there MIGHT be some erroneous higher mating duration values
       ggplot(matingtable, aes(x=Line,y=Mating_Duration, color=Code)) + geom_point() +labs(x="Line", y="Mating Latency(s)")  

       