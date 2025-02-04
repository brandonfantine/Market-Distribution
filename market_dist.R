library("readxl")
library("ggplot2")

with_0 <- read_excel("Market Financial Data Distribution.xlsx", sheet="%_with_0")
without_0 <- read_excel("Market Financial Data Distribution.xlsx", sheet="%_without_0")
proportion <- read_excel("Market Financial Data Distribution.xlsx", sheet="div_prop")
data <- read_excel("Market Financial Data Distribution.xlsx", sheet="market_time")

hist(without_0$optdr, breaks = 100, xlim=c(0, 15), ylim=c(0, 6000), 
     main="Percent Yields above 0", xlab="Percent Yield (%)", 
     ylab="Frequency of YieldS")

hist(with_0$optdr, breaks = 100, xlim=c(0, 15), ylim=c(0, 40000), 
     main="Percent Yields (Including 0)", xlab="Percent Yield (%)", 
     ylab="Frequency of YieldS")

ggplot(without_0, aes(x=`FISCAL YEAR`, y=optdr)) + geom_point() + coord_flip()

prop_plot <- ggplot(proportion, aes(x=year, y=divprop)) + geom_line()
prop_plot + labs(title="Proportion of Stocks Paying Dividends From 2001-2022", 
       subtitle="Zero Dividend Stocks not Included", x="Year", 
       y="Proportion Paying Dividends
       ")

cap_1930 <- read_excel("Market Financial Data Distribution.xlsx", 
                       sheet="1926-1975")
cap_1976 <- read_excel("Market Financial Data Distribution.xlsx", 
                       sheet="1976-2000")
cap_2001 <- read_excel("Market Financial Data Distribution.xlsx", 
                       sheet="2001-2022")

ratio_plot <- ggplot(data, aes(x=`FISCAL YEAR`, y=ebitda/ev)) + geom_point() + 
  ylim(-1130, 1500)
ratio_plot + labs(x="Year", y="Ratio of EBITDA/EV")

plot(data$`FISCAL YEAR`, data$mv)

mc_plot <- ggplot(data, aes(x=`FISCAL YEAR`, y=mv)) + geom_point()
mc_plot + labs(title="Market Capitalization by Year", x="Year", 
               y="Market Cap for Each Stock")

percent_ebitda <- 283443/363168

percent_ev <- 48526/363168

if (percent_ev < percent_ebitda){
  percent_ratio <- percent_ev
} else{
  percent_ratio <- percent_ebitda
}

percent_mv <- 302038/363168

percent_div_yield <- 54128/363168
