# Put initialization code in this file.
dice_fair <- c(1/6,1/6,1/6,1/6,1/6,1/6)
dice_high <- c(1/21,2/21,3/21,4/21,5/21,6/21)
dice_low <- c(6/21,5/21,4/21,3/21,2/21,1/21)
expect_dice <- function(pmf){ mu <- 0; for (i in 1:6) mu <- mu + i*pmf[i]; mu}
dice_sqr <- c(1,4,9,16,25,36)
edh <- expect_dice(dice_high)
edl <- expect_dice(dice_low)