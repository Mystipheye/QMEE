library(tidyverse)
## BMB: we generally prefer spaces around '<-' for legibility
matingtable<-read_csv("Mating_Data_Day_1.csv")
matingtable<-as.data.frame(matingtable) ## BMB: why convert? you already have a tibble, which is in some ways more convenient than a data frame anyway
structure(matingtable) #upon inspection, seems like there are 120 unique combinations of code(treatment) and line, none of which are mislabeled
## BMB: did you mean str(), which gives a shorter summary?
## View() (or the table view in RStudio) is good if you just want to
## visually inspect all your data
summary (matingtable)

## BMB: all of these can be done in a single pipeline (%>% ... %>%) if
## you want. mutate(., across(c(Line,Code),as_factor)) or something
## like it could also be useful,
matingtable$Line<-as_factor(matingtable$Line)
matingtable$Code<-as_factor(matingtable$Code)
## BMB: these can also be combined
matingtable<-rename(matingtable, "Mating_Duration"="mating duration") ##rename=tidyverse's function for renaming a column
matingtable<-rename(matingtable, "Mating_Latency"="mating latency")

group_by(matingtable,Mating_Duration, Line, Code)%>%summarize(count = n())%>%filter(count>0)%>%print ##shows that there are 120 unique combinations, which means there are no redundancy errors with mating duration

## BMB: I like this as shorthand:
## 12840 combos that are *not* represented
## all 120 combos are represented exactly once
## you can also do something with
## stopifnot(any(duplicated(...)))
with(matingtable, table(table(Mating_Duration, Line, Code)))

group_by(matingtable,Mating_Latency, Line, Code)%>%summarize(count = n())%>%filter(count>0)%>%print  ##shows that there are 120 unique combinations, which means there are no redundancy errors with mating latency
ggplot(matingtable, aes(x=Mating_Duration)) +geom_histogram(bins=30) +labs(x="Mating Duration(s)") #seems like there MIGHT be some erroneous lower mating duration values
ggplot(matingtable, aes(x=Line,y=Mating_Duration, color=Code)) + geom_point() +labs(x="Line", y="Mating Duration(s)")
ggplot(matingtable, aes(x=Mating_Latency)) +geom_histogram(bins=30)  +labs(x="Mating Latency(s)") #seems like there MIGHT be some erroneous higher mating duration values
ggplot(matingtable, aes(x=Line,y=Mating_Duration, color=Code)) + geom_point() +labs(x="Line", y="Mating Latency(s)")  

<<<<<<< HEAD
=======
       
## BMB: this is thorough and thoughtful, you might try to automate things
## some more (e.g. with stopifnot, or the assertthat package
## mark: 2.1
>>>>>>> 4034a3a852a90918b6ba6a3d2be3125c543e9a1e
