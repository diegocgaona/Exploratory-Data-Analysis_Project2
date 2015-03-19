## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
## Load only the data where fips == "24510" 
NEIBALT <- subset(readRDS("summarySCC_PM25.rds",), fips == "24510")
## Summarize the data emisssions per year
NEIBALTtypesum <- aggregate(Emissions ~ year + type,NEIBALT, sum)
require("ggplot2")
png("plot3.png") ## initiate png graphic device
## Plot with lines separated by type color
qplot(x = year, y = Emissions, data = NEIBALTtypesum, color = type, 
      geom = c("point", "line"), main = "Emissions per type in Baltimore")
dev.off()  ## Close the device (png)
