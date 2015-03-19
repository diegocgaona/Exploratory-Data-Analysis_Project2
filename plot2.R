## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
## Load only the data where fips == "24510" 
NEIBALT <- subset(readRDS("summarySCC_PM25.rds",), fips == "24510")
## Summarize the data emisssions per year
NEIBALTsum <- aggregate(Emissions ~ year,NEIBALT, sum)
png("plot2.png") ## initiate png graphic device
## Create the bar plot
barplot((NEIBALTsum$Emissions),
        names.arg = edatasum$year, ## Use the year for the x axis thicks
        xlab = "Year", ## Label the x axis
        ylab = "Total PM2.5 Emissions", ## Label the y axis
        main = "PM2.5 emission from all sources in Baltimore", ## Title
        col = "red", ## Bar Color
        ylim = c(0,3500) ## y axis thicks
)
dev.off()  ## Close the device (png)