library(haven)

import <- read_dta("C:\\Users\\cgabl\\Downloads\\cleaneddata.dta")

import$year

install.packages("dotwhisker")

library(haven)
library(stargazer)
library(prediction)
library(margins)
library(dotwhisker)
library(MASS)
library(nnet)

N <- nrow(import)

stargazer(data.frame(import), type='html', out = "descriptives.html",
          summary.stat = c("mean", "sd", "min", "max"),
          notes = paste("Number of observations =", N))

summary(import)

model1 <- lm(formula = provhelp ~ age + sex + marital + hispyn + highdeg + povcat + cancer1 + medplace, data = import)
summary(model1)

m1 <- lm(provhelp ~ factor(highdeg), data = import)
marg1 <- margins(m1)
summary(marg1)
plot(marg1)

NOTES BELOW ON HOW DATA WAS COLLECTED
*****The data was collected from the IPUMS Health Survey's website.
*****This site compiles and provides free usage of health data collected from United State health surveys.
*****This website offers its users the ability to create free custom data extracts from the National Health Interview Survey (NHIS) and the Medical Expenditure Panel Survey (MEPS).