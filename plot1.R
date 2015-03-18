## Coursera Exploration Data Analysis Course Assignment 2
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
## SCC <- readRDS("Source_Classification_Code.rds")
## edata <- merge(NEI, SCC[,c(1:4,7:10)], by = "SCC")
## gc()
## rm(list = c("NEI","SCC")) ## Remove data frames not necessary anymore
## teste <- edata[,c(1:9,12:15)] ## substituir por edata antes de finalizar
## edatasum <- aggregate(Emissions ~ year,edata, sum)
edatasum <- aggregate(Emissions ~ year,NEI, sum)

## edatasumm <- summaryBy(Emissions ~ year, data = edata, keep.names = TRUE, FUN = sum) ## use doBy package

png("plot1.png") ## initiate png graphic device

barplot((edatasum$Emissions)/10^6,
      names.arg = edatasum$year,
      col = "black",
      xlab = "Year",
      ylab = "PM2.5 Emissions (kiloton)",
      main = "PM2.5 emission from all sources in USA"
)
dev.off()  ## Close the device (png)