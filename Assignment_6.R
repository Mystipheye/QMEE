#My hypotheses: 
#I hypothesize that mating latency will be lower for males perceiving greater sperm competition (previously housed with rival males), than for males
#perceiving lower sperm competition (previously housed singly). I also hypothesize that mating duration will be greater for males perceiving higher sperm
#competition, than for males perceiving lower sperm competition. I expect the differences in mating latency and mating duration between different genetic
#lines to be statistically clear.

##For Mating Latency:


mating_table<-read.csv("Mating_Data_Day_1.csv")
latencymodel<- lm(mating_latency~Treatment*Line, data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(latencymodel,id.n=4)  

#The 'Residuals vs Fitted' plot tests for linearity. Since the mean residual value for each fitted value region is not roughly zero (since all the points
#don't lie along a horizonal line roughly), it would be fair to say that linearity is lacking within the data. The 'Normal Q-Q' plot tests normality of
#the data. the points lie closely along a straight line, and hence the normality assumption is satisfied by this distribution. The 'Scale-Location' plot 
#tests assumption of equal variance (homoscedasticity). It looks to see if the fitted line is approximately horizontal, and whether the average magnitude
#of the standardized residuals doesn't change much as a function of the fitted values. The line here isn't approximately horizontal, and the spread definitely
#changes going across the fitted values. Hence, the homoscedasticity assumption does not hold up here. The final plot is looking for data points that's 
#inclusion/exclusion would be influential against a regression line, and could be "outliers". Although point # 116 comes close to crossing the line indicating
#Cook's distance, it doesn't, and hence the data here doesn't show any influential points.


That the red line is approximately horizontal. Then the average magnitude of the standardized residuals isn’t changing much as a function of the fitted values.
That the spread around the red line doesn’t vary with the fitted values. Then the variability of magnitudes doesn’t vary much as a function of the fitted values.

##For Mating Duration:

durationmodel<- lm(mating_duration~Treatment*Line, data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(durationmodel,id.n=4)

#The residuals vs Fitted plot shows a horizontal line, which indicates that the linearlity assumption holds for this data. The points in the Normal Q-Q plot
#mostly lie along a straight line, but they are lower than expected towards the left. This indicates a large left tail in the distribution, and a potential
#violation of normality. The Scale-Location plot shows a roughly horizontal line with a pretty even spread of points, which indicates that the 
#homoscedasticity assumption holds here. The Residuals vs Leverage plot does not have any points outside of the Cook's distance boundary, indicating that
#these none of that including or excluding any of these points would not be very influential on the regression line.

dotwhisker::dwplot(latencymodel)

dwplot(latencymodel)

#The following can be inferred from this dot-and-whisker plot. All three 95 % confidence intervals (top one is associated with "Treatment", middle one
#is associated with "Line", and bottom one is associated with the interaction between "Treatment" and "Line") cross the zero mark. This means that, with
#regards to mating latency, the effect of treatment is not statistically clear, the effect of line is not statistically clear, and the interaction between
#treatment and line is not statistically clear. 


##For Mating Duration:

durationmodel<- lm(mating_duration~Treatment*Line, data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(durationmodel,id.n=4)

#The residuals vs Fitted plot shows a horizontal line, which indicates that the linearlity assumption holds for this data. The points in the Normal Q-Q plot
#mostly lie along a straight line, but they are lower than expected towards the left. This indicates a large left tail in the distribution, and a potential
#violation of normality. The Scale-Location plot shows a roughly horizontal line with a pretty even spread of points, which indicates that the 
#homoscedasticity assumption holds here. The Residuals vs Leverage plot does not have any points outside of the Cook's distance boundary, indicating that
#these none of that including or excluding any of these points would not be very influential on the regression line.

dotwhisker::dwplot(durationmodel)

dwplot(durationmodel)

#The same thing can be inferred from this dot_and_whisker plot as for the one done for mating latency.All three 95 % confidence intervals (top one is
#associated with "Treatment", middle one is associated with "Line", and bottom one is associated with the interaction between "Treatment" and "Line")
#cross the zero mark. This means that, with regards to mating duration, the effect of treatment is not statistically clear, the effect of line is not 
#statistically clear, and the interaction between treatment and line is not statistically clear. 
