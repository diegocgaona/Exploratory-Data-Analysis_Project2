## Coursera Exploration Data Analysis Course Assignment 2
## Load ggplo2
require("ggplot2")
## Load and merge data. Be patient, this will take some time.
SCC <- readRDS("Source_Classification_Code.rds")
NEIBALT <- subset(readRDS("summarySCC_PM25.rds",), fips == "24510")
edatabalt <- merge(NEIBALT, SCC[,c(1:4,7:10)], by = "SCC")
## Remove data frames not necessary anymore and clean with gc()
rm(list = c("NEIBALT","SCC")); gc()
## Subset for "veh" in SHort.Name to get only motor vehicles
edataveh <- edatabalt[grep("Veh|Vehicles", ignore.case = TRUE, edatabalt$Short.Name),]
## Summarize the data emisssions per year
edatasumm <- aggregate(Emissions ~ year, edataveh, sum)
## initiate png graphic device with width = 720 and height = 500
png("plot5.png", width = 720, height = 500)
## Plot with bars
p <- ggplot(edatasumm, aes(x = factor(year), y = Emissions)) ## Initializes ggplot object
p <- p + geom_bar(stat = "identity") + ylab("Emissions") +  xlab("Year") ## Use bar and show labels
p <- p + theme(axis.title = element_text(face="bold", size=12)) ## Change the axis labels style
p <- p + theme(plot.title = element_text(size = rel(2))) ## Change the title style
p + ggtitle("Emissions from motor vehicle sources in Baltimore per year") ## Show the title
dev.off()  ## Close the device (png)