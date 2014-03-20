# Regression Models

* Unit 01 04, *Regression to the Mean*, covers Galton again.

* Unit 01 05, *Statistical Linear Regression Models*, uses UsingR::diamond (price vs weight in carats) and covers 3 topics:
 1. OLS is max likelihood in the case of Gaussian (normal) residuals. This is theory.
 2. Interpreting coefficients: delta price per delta carat 
 3. Prediction: estimating price given weight
It also covers scaling. 

* Unit 01 06, *Residual Variation*, covers much of the same properties as our 01 03 OLS swirl unit. 

* Unit 01 07, *Inference*, is fairly important. It deals with standard error of coefficient estimates. It asserts that errors in estimates of coefficients tend to be normally distributed or, if scaled using a standard deviation estimated from samples, to be distributed according to a Student's T.

 * We can illustrate these assertions by repeatedly taking, say, 200 random samples from galton, finding the regression line from the 200 samples, and collecting the resulting slopes. We'll get, say, 2000 estimates and examine their distribution. 

 * A quantile-quantile plot against a standard normal will be linear, as it would be the slope estimates are normal, and a Shapiro-Wilks test will fail to reject normality. The standard deviation of the samples will be close to the standard errors given by summary. Normality:


```r
galton <- UsingR::galton
set.seed(1234)
f.temp <- function(x) lm(child ~ parent, galton[sample.int(928, 200), ])$coef[2]
temp <- unlist(lapply(1:2000, f.temp))
qqnorm(temp)
abline(mean(temp), sd(temp), col = "red", lwd = 3)
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 

```r
shapiro.test(temp)
```

```
## 
## 	Shapiro-Wilk normality test
## 
## data:  temp
## W = 0.9989, p-value = 0.2849
```


 * Student's T. The summary of an lm model includes a t value, a probability P(>|t|), and asterisks indicating "significance," which may be interpreted as follows: The estimated coefficient is significantly different from zero, assuming coefficient errors are normally distributed, hence that scaled errors are distributed according to a Student's T.
 

```r
qqplot(scale(temp), rt(2000, 200 - 1), xlab = "Scaled slopes", ylab = "Student's T")
abline(0, 1, col = "red", lwd = 3)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


* Unit 02 01, Mutivariable regression

 * Uses the Swiss fertility data (datasets::swiss) involving province fertility and 5 socioeconomic variables.
 * Treats multiple variables by iterative application of single variable regression--essentially Gram-Schmidt orthogonalization. Given n predictors, regress response and other predictors on one of them. This gives the coefficient of the chosen predictor. Apply the same to the response residual and the n-1 predictor residuals, etc.
 * 
 
