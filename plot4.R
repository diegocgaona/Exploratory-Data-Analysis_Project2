## Coursera Exploration Data Analysis Course Assignment 2
## Load ggplo2
require("ggplot2")
## Load and merge data. Be patient, this will take some time.
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds",)
edata <- merge(NEI, SCC[,c(1:4,7:10)], by = "SCC")
## Remove data frames not necessary anymore and clean with gc()
rm(list = c("NEI","SCC")); gc()
## Subset for only coal combustion-related sources (including charcoal)
## I used the "Short.Name" column to subset the data.
edatacoal <- edata[grep("coal|charcoal", ignore.case = TRUE, edata$Short.Name),]

## Summarize the data emisssions per year
edatasumm <- aggregate(Emissions ~ year, edatacoal, sum)

png("plot4.png") ## initiate png graphic device
## Plot with bars, by TONS of emissions

p <- ggplot(edatasumm, aes(x = factor(year), y = Emissions/10^3))
p + geom_bar(stat = "identity")
p + labs(title="Emissions from coal combustion-related sources in USA")

qplot(year, Emissions,, data = edatasumm, color = "black", 
      geom = "bar", main = "Emissions")

qplot(year, Emissions, data = NEIBALTtypesum, facets = . ~ type, geom = c("point", "line"), 
      ylab = "Emissions per type", main = "Emissions from coal combustion-related sources in USA")

dev.off()  ## Close the device (png)
