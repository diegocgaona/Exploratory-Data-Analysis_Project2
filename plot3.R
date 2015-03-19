## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
## Load only the data where fips == "24510" 
NEIBALT <- subset(readRDS("summarySCC_PM25.rds",), fips == "24510")
## Summarize the data emisssions per year
NEIBALTtypesum <- aggregate(Emissions ~ year + type, NEIBALT, sum)
require("ggplot2")
png("plot3.png", width = 700, height = 600) ## initiate png graphic device
## Plot with lines separated by type color
p <- ggplot(NEIBALTtypesum, aes(x = factor(year), y = Emissions, colour = type)) ## Initializes ggplot object
p <- p + geom_line(stat = "identity", aes(group = type)) ## Use lines
p <- p + geom_point(stat = "identity", size = 4) ## Use points
p <- p + ylab("Emissions") +  xlab("Year") ##  Show labels
p <- p + theme(axis.title = element_text(face="bold", size=12)) ## Change the axis labels style
p <- p + theme(plot.title = element_text(size = rel(1.5))) ## Change the title style
p + ggtitle("Emissions per type in Baltimore") ## Show the title
dev.off()  ## Close the device (png)