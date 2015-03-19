## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
## edatasum <- aggregate(Emissions ~ year,edata, sum)
edatasum <- aggregate(Emissions ~ year,NEI, sum)

## edatasumm <- summaryBy(Emissions ~ year, data = edata, keep.names = TRUE, FUN = sum) ## use doBy package

png("plot1.png") ## initiate png graphic device
## Plot the bar graph, by kilotons of emmissons
barplot((edatasum$Emissions)/10^6,
      names.arg = edatasum$year,
      col = "black",
      xlab = "Year",
      ylab = "PM2.5 Emissions (kiloton)",
      main = "PM2.5 emission from all sources in USA"
)
dev.off()  ## Close the device (png)