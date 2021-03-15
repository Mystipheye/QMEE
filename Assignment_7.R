#My hypotheses: 
#I hypothesize that mating latency will be lower for males perceiving greater sperm competition (previously housed with rival males), than for males
#perceiving lower sperm competition (previously housed singly). I also hypothesize that mating duration will be greater for males perceiving higher sperm
#competition, than for males perceiving lower sperm competition. 

#In the last assignment, also had a hypothesis regarding "line" on "mating latency" and "mating duration", which wasn't a proper hypothesis to make. Tried 
#to make the same line*treatment interaction models as last time (but GLM instead of LM), but they would only give me the "residuals vs fitted" plot, and
#not all 4 diagnostic plots. For these reasons, decided to forgo including "line" in these models.

#For Mating Latency:


mating_table<-read.csv("Mating_Data_Day_1.csv")
mating_table$Treatment<-as.factor(mating_table$Treatment)
str(mating_table)

latencymodel<-glm(mating_latency~Treatment, family="gaussian", data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(latencymodel,id.n=4)  

#It seems like points 112, 116, and 118 are throwing off the diagnostic plots, even though they don't lie outside of Cook's distance. This throw's off
#homoscedasticity assumption, which was also a problem with the last assignment. 

mating_table[c(112,116,118),]
library(ggplot2); theme_set(theme_bw())
ggplot(mating_table,
       aes(
           Treatment, mating_latency)) +
  geom_point()


mating_table_subset<-mating_table[-c(112,116,118),] #Going to analyze diagnostic plots with exclusion of points 112, 116, and 118.
str(mating_table_subset)

latencymodel2<-glm(mating_latency~Treatment, family="gaussian", data=mating_table_subset)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(latencymodel2,id.n=4)  





#For residuals vs fitted plot, the line is horizontal, which means that linearity assumption holds up for the residuals in this case. As for the 
#Q-Q plot, the points are roughly along a straight line. They are above the line towards the right, which would indicate an underestimation of response 
#values, and a large right tail in the distribution.  A few are above the line towards the left as well, which would indicate an underestimation of 
#response values, and a slightly larger left tail in the distribution. It seems like normality amongst the residuals might be violated in this case. The 
#Scale-Location plot shows a line that is roughly horizontal, which indicates taht the homoscedasticity assumption for residuals holds up in this case.
#The residuals vs leverage plot reveals no points outside of Cook's distance, meaning there are no "influential data points" present in this subset.



dotwhisker::dwplot(latencymodel,by_2sd=TRUE) +
  geom_vline(xintercept=0,lty=2)
#The following can be inferred from this dot-and-whisker plot. The magnitude of difference in mating latency is about 250 s greater on average for the 
#single treatment in comparison to the rival treatment. However, the 95 % confidence interval, which is associated with "Treatment", crosses the zero mark. 
#This means that with regards to mating latency, the effect of treatment is not statistically clear. 

#For Mating Latency:

durationmodel<-glm(mating_duration~Treatment, family="gaussian", data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(durationmodel,id.n=4)  


#For residuals vs fitted plot, the line is horizontal, which means that linearity assumption holds up for the residuals in this case. As for the 
#Q-Q plot, the points are roughly along a straight line. They are below the line towards the left, which would indicate an overestimation of response 
#values, and a large left tail in the distribution.  A few are below the line towards the right as well, which would indicate an overestimation of response 
#values, and a slightly larger right tail in the distribution.It seems like normality amongst the residuals might be violated in this case. The
#Scale-Location plot shows a line that is roughly horizontal, which indicates that the homodescedasticity assumption holds up here.



library(ggplot2)

dflev <- data.frame(Leverage = hatvalues(durationmodel), y = resid(durationmodel))

ggplot(dflev, aes(Leverage, y)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed") +
  ggtitle("Residuals vs Leverage") +
  lims(y = c(-1, 1)) +
  ylab("") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"))
#Here I tried to create the residuals vs leverage plot since it wasn't showing up before, but it didn't work for some reason.

dotwhisker::dwplot(durationmodel,by_2sd=TRUE) +
  geom_vline(xintercept=0,lty=2)
#The following can be inferred from this dot-and-whisker plot. The magnitude of difference in mating duration is about 140 s greater on average for the 
#single treatment in comparison to the rival treatment. The 95 % confidence interval, which is associated with "Treatment", crosses the zero mark. 
#This means that with regards to mating duration, the effect of treatment is statistically clear. 