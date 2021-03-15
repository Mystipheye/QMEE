#My hypotheses: 
#I hypothesize that mating latency will be lower for males perceiving greater sperm competition (previously housed with rival males), than for males
#perceiving lower sperm competition (previously housed singly). I also hypothesize that mating duration will be greater for males perceiving higher sperm
#competition, than for males perceiving lower sperm competition. I expect the differences in mating latency and mating duration between different genetic
#lines to be statistically clear.
## BMB: I question the usefulness of the last sentence; that's not a scientific hypothesis, that's a hope. You might expect there to be large variation among lines in the effects of housing on latency and mating duration (why? wouldn't this be under strong selection?)

##For Mating Latency:

 
mating_table<-read.csv("Mating_Data_Day_1.csv")
## BMB: eventually might want to treat Line as a random effect
latencymodel<- lm(mating_latency~Treatment*Line,
                  data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(latencymodel,id.n=4)  

## BMB: your analysis doesn't make sense because you
## are (accidentally) treating line as a numeric variable
## when (as far as I can tell) it should be categorical.
## however, if you treated it as categorical you'd also
## be in trouble because then you would be estimating 120
## parameters, one for each line/treatment combination.
## The mixed model topic will be useful for you.

#The 'Residuals vs Fitted' plot tests for linearity. Since the mean residual value for each fitted value region is not roughly zero (since all the points
#don't lie along a horizontal line roughly, but rather a negatively sloped line), it would be fair to say that linearity is lacking within the data.

## BMB: It seems clear from this plot that observations 112, 116, 118 are throwing off your model.  What are these observations? You definitely need to deal with these before going farther.  I'm really surprised that they don't show up as having a large Cook's distance but that may be because you only have pairwise contrasts within lines. In any case they will mess up the assumption of homoscedasticity.

mating_table[c(112,116,118),]
library(ggplot2); theme_set(theme_bw())
ggplot(mating_table,
       aes(factor(Line),
           mating_latency,colour=Treatment)) +
    geom_point()

ggplot(mating_table,
       aes(Treatment,mating_latency,
           group=factor(Line))) +
       geom_point() + geom_line(alpha=0.5)

## BMB: You definitely need to deal with these points before you go further.
## If you do need to include them you might want to look into robust linear models.

# The Normal Q-Q' plot tests normality of the data. the points lie closely along a straight line, and hence the normality assumption is satisfied by this
# distribution. The 'Scale-Location' plot tests assumption of equal variance (homoscedasticity). It looks to see if the fitted line is approximately
#horizontal, and whether the average magnitude of the standardized residuals doesn't change much as a function of the fitted values. The line here isn't
##approximately horizontal, and the spread definitely changes going across the fitted values. Hence, the homoscedasticity assumption does not hold up here. 
#The final plot is looking for data points that's inclusion/exclusion would be influential against a regression line, and could be "outliers". Although point
# 116 comes close to crossing the line indicating Cook's distance, it doesn't actually do so, and hence the data here doesn't show any influential points.

dotwhisker::dwplot(latencymodel) +
    geom_vline(xintercept=0,lty=2)

## BMB: did you notice/think about the huge difference in
## scale between the "treatmentsingle" and the other variables?
## This is largely because of the problem with line being
## treated as numeric

dotwhisker::dwplot(latencymodel,by_2sd=TRUE) +
    geom_vline(xintercept=0,lty=2)





#The following can be inferred from this dot-and-whisker plot. All three 95 % confidence intervals (top one is associated with "Treatment", middle one
#is associated with "Line", and bottom one is associated with the interaction between "Treatment" and "Line") cross the zero mark. This means that, with
#regards to mating latency, the coefficient (estimated effect) of treatment is not statistically clear, that  of line is not statistically clear, and that
#of that interaction between treatment and line is not statistically clear. 

## BMB: if you can, *please* describe what's going on in terms
## of magnitudes of effects, not just "clear"/"unclear".

##For Mating Duration:

durationmodel<- lm(mating_duration~Treatment*Line, data=mating_table)
par(mfrow=c(2,2),mar=c(2,3,1.5,1),mgp=c(2,1,0))
plot(durationmodel,id.n=4)

#The residuals vs Fitted plot shows a horizontal line, which indicates that the linearity assumption holds for this data. The points in the Normal Q-Q plot
#mostly lie along a straight line, but they are lower than expected towards the left. This indicates a large left tail in the distribution, and a potential
#violation of normality. The Scale-Location plot shows a roughly horizontal line with a pretty even spread of points, which indicates that the 
#homoscedasticity assumption holds here. The Residuals vs Leverage plot does not have any points outside of the Cook's distance boundary, indicating that
#including or excluding any of these points would not be very influential on the regression line.

## BMB: this looks much better to me. Still the same
## problem with line being treated as numeric.
## The skew is probably not a very big deal.

dotwhisker::dwplot(durationmodel)

#The same thing can be inferred from this dot_and_whisker plot as for the one done for mating latency.All three 95 % confidence intervals (top one is
#associated with "Treatment", middle one is associated with "Line", and bottom one is associated with the interaction between "Treatment" and "Line")
#cross the zero mark. This means that, with regards to mating duration, the coefficient (estimated effect) of treatment is not statistically clear, the
#effect of line is not statistically clear, and the interaction between treatment and line is not statistically clear. 


## BMB: grade 1.9
## The diagnostics were OK, but I thought you could have thought
## harder about what the results meant.

