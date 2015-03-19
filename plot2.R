## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
## Load only the data where fips == "24510" 
NEIBALT <- subset(readRDS("summarySCC_PM25.rds",), fips == "24510")
## Summarize the data emisssions per year
NEIBALTsum <- aggregate(Emissions ~ year,NEIBALT, sum)

png("plot2.png") ## initiate png graphic device

barplot((NEIBALTsum$Emissions),
        names.arg = edatasum$year,
        xlab = "Year",
        ylab = "Total PM2.5 Emissions",
        main = "PM2.5 emission from all sources in Baltimore",
        col = "red",
        ylim = c(0,3500)
)
dev.off()  ## Close the device (png)