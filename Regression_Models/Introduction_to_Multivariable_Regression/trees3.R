print('> coef(lm(Volume ~ Constant - 1, eliminate("Height", trees2)))')
print(coef(lm(Volume ~ Constant - 1, eliminate("Height", trees2))))
