library (tidyverse)

matingtable <- read_csv("Mating_Data_Day_1.csv")

str(matingtable)

view (matingtable)

matingtable <- mutate(matingtable,across(c(Line,Treatment),as_factor))

class(matingtable$Treatment); class (matingtable$Line)

matingtable <- matingtable%>%rename("Mating_Duration"="mating duration", "Mating_Latency"="mating latency")

saveRDS(matingtable, "Mating_Data_Day_1.rds")

matingtablerds <- readRDS("Mating_Data_Day_1.rds")

library(ggplot2)
theme_set(theme_bw())
p1 <- ggplot(matingtable, aes(x=Line,y=Mating_Duration,color=Treatment)) 


print (p1 + geom_point() + labs(x="DGRP Line of Male",y="Mating Duration(s)")  +
         coord_flip() + theme(panel.grid.major = element_blank(), panel.grid.minor=element_blank()))

##y-axis markings look squished together, but are fine when you zoom in on the figure

##I'm trying to show the mating duration for each DGRP line.I used geometric points to represent the major predictor here since the Cleveland hierarchy says 
##position along a common scale is the best way to visually convey quantitative information correctly. I also wanted to represent treatment information, 
##and followed the rule of thumb say that the next categorical variables should be presented as groupings (typically based on colour or shape). I flipped
##the position of the axes since all of the DGRP lines would not fit on the x-axis properly. I removed gridlines here because they made the plot more 
##difficult to look at, but did not just set the theme as theme_classic at the beginning in case I thought it would be useful to include gridlines in
#subsequent plots formed by this code. I left the default colours, as they would be suitable for dichromats and black and white printouts.  

p2 <- ggplot(matingtable, aes(x=Line,y=Mating_Latency,color=Treatment)) 


print (p2 + geom_point() + labs(x="DGRP Line of Male",y="Mating Latency(s)")  + 
         coord_flip() + theme(panel.grid.major = element_blank(), panel.grid.minor=element_blank()))

##y-axis markings look squished together, but are fine when you zoom in on the figure

##I'm trying to show the mating latency for each DGRP line.I used geometric points to represent the major predictor here since the Cleveland hierarchy says 
##position along a common scale is the best way to visually convey quantitative information correctly. I also wanted to represent treatment information, 
##and followed the rule of thumb say that the next categorical variables should be presented as groupings (typically based on colour or shape). I flipped
##the position of the axes since all of the DGRP lines would not fit on the x-axis properly. I removed gridlines here because they made the plot more 
##difficult to look at, but did not just set the theme as theme_classic at the beginning in case I thought it would be useful to include gridlines in
#subsequent plots formed by this code. I left the default colours, as they would be suitable for dichromats and black and white printouts

p3 <- ggplot(matingtable, aes(x=Treatment,y=Mating_Duration))
print(p3+ geom_boxplot() + stat_compare_means() +labs(x="DGRP Line of Male", y="Mating Duration(s)"))

##I'm trying to show the difference between the two treatments in terms of mating duration here. A rule of thumb with the principles of graphical
##communication is to choose to display population variation instead of estimate variation, and thus I thought a boxplot would be suitable here. A boxplot
## is also a suitable figure type for a medium-sized dataset such as this one. Boxplots involve positions along a common scale, which according to the 
##Cleveland hierarchy is the best way of visually representing quantitative information, which makes it all the more suitable to use here. I did not remove
##gridlines here, as they not make the figure more difficult to look at. I included a measure of p-value at the top of the figure to numerically supplement
##the visual differences in mating duration between the two treatments. I haven't decided which statistical test is best to conduct here, so the p-value
##pertains to the default statistical test.The colouring presented in this plot is mindful of dichromats and black and white handouts.


p4 <- ggplot(matingtable,aes(x=Treatment,y=Mating_Latency))

print(p4+ geom_boxplot() + stat_compare_means() +labs(x="DGRP Line of Male", y="Mating Latency(s)"))

##I'm trying to show the difference between the two treatments in terms of mating latency here. A rule of thumb with the principles of graphical
##communication is to choose to display population variation instead of estimate variation, and thus I thought a boxplot would be suitable here. A boxplot
## is also a suitable figure type for a medium-sized dataset such as this one. Boxplots involve positions along a common scale, which according to the 
##Cleveland hierarchy is the best way of visually representing quantitative information, which makes it all the more suitable to use here. I did not remove
##gridlines here, as they not make the figure more difficult to look at. I included a measure of p-value at the top of the figure to numerically supplement
##the lack of visual differences in mating latency between the two treatments. I haven't decided which statistical test is best to conduct here, so the
##p-value pertains to the default statistical test.The colouring presented in this plot is mindful of dichromats and black and white handouts.

p5 <- ggplot(matingtable, aes(x=Treatment,y=Mating_Duration)) +geom_boxplot() 
print (p5+ geom_point()+  geom_line(aes(group=Line)) + theme(legend.position = "none")+ labs(x="DGRP Line of Male",y="Mating Duration(s)") + stat_compare_means())   

##I was curious to see if I could add information about the variable DGRP line here to the prior boxplot (print of p3). I was able to show the differences between
##the two treatments associated with each DGRP line using this adjusted boxplot. Mating duration information, as it pertains to both treatment and DGRP line, 
##involves positioning along a common scale. This is what the Cleveland hierarchy indicates to be the best way of depicting quantitative information 
##graphically. The colouring presented in this plot is mindful of dichromats and black and white handouts.

p6 <- ggplot(matingtable, aes(x=Treatment,y=Mating_Duration)) +geom_boxplot() 
print(p6 +geom_point() +geom_line(aes(group=Line)) +theme(legend.position="none")+labs(x="DGRP Line of Male",y="Mating Duration(s)") +  stat_compare_means())   

#I was curious to see if I could add information about the variable DGRP line here to the prior boxplot (print of p4). I was able to show the differences between 
##the two treatments associated with each DGRP line using this adjusted boxplot. Mating latency information, as it pertains to both treatment and DGRP line, 
##involves positioning along a common scale. This is what the Cleveland hierarchy indicates to be the best way of depicting quantitative information 
##graphically. The colouring presented in this plot is mindful of dichromats and black and white handouts. 


