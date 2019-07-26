plot(c(3,23,29,55), c(0.5, 0.5, 1.0, 1.0), type='l', lwd=5, col="purple", col.lab="purple", ylim=c(0.25,1),
     xlab="Ravens' Score", ylab="Probability of a Ravens win", col.main="purple",
     main="Ravens' win vs score probabilities: GLM maximum likelihood estimates\ncompared to crude estimates.")
lines(mdl$data$ravenScore, mdl$fitted.values, lwd=5, col="black")
legend('bottomright', c("Crude estimates", "GLM maximum likelihood estimates"), lwd=5, lty=1,
                        col=c("purple", "black"))