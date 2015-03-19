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
## initiate png graphic device with width = 720 and height = 500
png("plot4.png", width = 720, height = 500)
## Plot with bars, by TONS of emissions
p <- ggplot(edatasumm, aes(x = factor(year), y = Emissions/10^3)) ## Initializes ggplot object
p <- p + geom_bar(stat = "identity") + ylab("Emissions (TON)") +  xlab("Year") ## Use bar and show labels
p <- p + theme(axis.title = element_text(face="bold", size=12)) ## Change the axis labels style
p <- p + theme(plot.title = element_text(size = rel(2))) ## Change the title style
p + ggtitle("Emissions from coal combustion-related in USA by year") ## Show the title
dev.off()  ## Close the device (png)
