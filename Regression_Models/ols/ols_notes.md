# Ordinary Least Squares (OLS)

A regression line fits the data best in the sense of "ordinary least squares." In the case of Galton's data, this means that we square the difference between a child's actual height and our estimate of it. Then we sum up these squares over all 928 samples.

Let $X_i$ represent parental height in sample $i.$ Our estimate of the child's height is given by a line which has the form, $\beta_0 + \beta_1X_i,$ but whose intercept, $\beta_0,$ and slope, $\beta_1,$ are unknown. If $Y_i$ is a child's actual height, we want to find the slope and intercept which minimize total squared error,$$\Sigma_{n=1}^{928}(\beta_0 + \beta_1X_i - Y_i)^2.$$

Ordinary least squares criteria are convenient because they provide two equations which can be solved for the two unknowns, intercept and slope. The first equation says that the errors in our estimates, also known as "residuals," have mean zero. The second equation says that our residuals must be uncorrelated with our predictors, the parents' heights.

The two equations follow from the definition of a minimum. If $\beta_0,$ and $\beta_1$ minimize squared error, then any change in either would *increase* squared error. This, and a little ugly algebra, do the trick. To make the algebra somewhat less ugly, let $\widetilde{Y_i}$ represent our estimate of a child's height, i.e., $\widetilde{Y}_i = \beta_0 + \beta_1X_i.$ 

### Residuals have mean zero

If residuals have mean zero, changing the intercept will increase squared error.

Suppose we were to change the intercept by adding some (positive or negative) quantity, $\Delta,$ to it. This would change each estimate by the same amount and the squared error would become$$\Sigma_{n=1}^{928}(\widetilde{Y}_i + \Delta - Y_i)^2,$$which, with a little ugly algebra, can be written as,$$\Sigma_{n=1}^{928}(\widetilde{Y}_i + \Delta - Y_i)^2 = \Sigma_{n=1}^{928}\left[(\widetilde{Y}_i - Y_i)^2 +2\Delta(\widetilde{Y}_i - Y_i) + \Delta^2\right],\\ = \Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i)^2 +2\Delta\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i) + \Sigma_{n=1}^{928}\Delta^2.$$The term on the left is the original squared error, before we added $\Delta.$ The term on the right is always positive since it is a sum of squares. If the residuals, $\widetilde{Y}_i - Y_i,$ have mean zero, i.e., if$$\frac{1}{928}\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i) = 0,$$then the middle term is zero, and changing the intercept increases the squared error.

In the introduction we saw that parents' and chidren's average heights cross at the regression line. This was not an accident, but a consequence of the residuals having mean zero. A bit more algebra tells the tale.

Let $\bar{X}$ be the average parental height and $\bar{Y}$ the average child's height. If$$\frac{1}{928}\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i) = 0,$$then$$\frac{1}{928}\Sigma_{n=1}^{928}\widetilde{Y}_i =  \frac{1}{928}\Sigma_{n=1}^{928}Y_i,\\ \frac{1}{928}\Sigma_{n=1}^{928}(\beta_0 + \beta_1X_i) = \bar{Y},\\ \beta_0 + \beta_1\frac{1}{928}\Sigma_{n=1}^{928}X_i = \bar{Y},\\\beta_0 + \beta_1\bar{X} = \bar{Y}.$$Thus the point $(\bar{X}, \bar{Y})$ is on the regression line as we saw in the introduction.

Since $\bar{X}$ and $\bar{Y}$ are averages which can be calculated from the data, this gives us one of the two equations in $\beta_0$ and $\beta_1.$

### Residuals are uncorrelated with predictors

If residuals are uncorrelated with predictors, changing the slope will increase squared error.

Suppose we were to change the slope by adding some quantity, $\epsilon,$ to $\beta_1.$ This would change the $i^{th}$ estimate from $\beta_0 + \beta_1X_i$ to $\beta_0 + \beta_1X_i + \epsilon X_i.$ Our squared error would then become$$\Sigma_{n=1}^{928}(\widetilde{Y}_i + \epsilon X_i - Y_i)^2.$$Using essentially the same algebraic steps as before we can rewrite the squared error as,$$\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i)^2 + + 2\epsilon\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i)X_i + \epsilon^2\Sigma_{n=1}^{928}(X_i)^2.$$Again, the first term is the original squared error before we added $\epsilon$ to the slope, and the last term is positive. If the middle term is zero, the squared error will have increased. The middle term is zero if$$\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i)X_i = 0.$$Since the residuals have mean zero, this is equivalent to$$\Sigma_{n=1}^{928}(\widetilde{Y}_i - Y_i)(X_i - \bar{X})= 0,$$which says the residuals are uncorrelated with the predictors. Further algebraic manipulation using $\beta_0 + \beta_1\bar{X} = \bar{Y}$ and the definitions of sample variance and covariance give the second equation in concise form,$$\beta_1var(X) = cov(X, Y).$$

### Residuals have mean zero and are uncorrelated with predictors.

If residuals have mean zero and are uncorrelated with predictors, then changing either will increase squared error. This means that any slope and intercept which satisfy both conditions will minimize squared error. Hence, if$$\beta_0 + \beta_1\bar{X} = \bar{Y},$$and$$\beta_1var(X) = cov(X, Y),$$then $\beta_0$ and $\beta_1$ are opitimal. Except in the uninteresting case when $var(X)=0,$ (i.e., $X_1=X_2=X_3=\ldots,$) these equations have exactly one solution.

Could there be other slopes and intercepts which don't satisfy these two equations but which give an equally good squared error? The answer is no, but to prove it requires more detailed mathematics. Essentially, if the middle terms in the above arguments are not zero, then very small $\Delta$ or $\epsilon$ of the proper sign can be found which decrease squared error.  
