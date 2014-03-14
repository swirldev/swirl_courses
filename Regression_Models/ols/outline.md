# Outline for OLS

0. **init** galton <- UsingR::galton; fit <- lm(child ~ parent, galton)

1. **text**  A regression line fits the data best in the sense of "ordinary least squares." In the case of Galton's data, this means that we square the difference between a child's actual height and our estimate of it. Then we sum up these squares over all 928 samples.

2. **text** Ordinary least squares criteria are convenient because they provide two equations which can be solved for the two unknowns, intercept and slope. The first equation says that the errors in our estimates, also known as "residuals," have mean zero. The second equation says that our residuals must be uncorrelated with our predictors, the parents' heights.

3. **cmd_question** We've created the regression line and called it "fit." The residuals are fit$residuals. Verify that mean(fit$residuals) is essentially zero.

4. **cmd_question** Verify that the covariance of fit$residuals with galton$parent is essentially zero.

