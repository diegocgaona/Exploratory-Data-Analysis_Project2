## Coursera Exploration Data Analysis Course Assignment 2
## Load ggplo2
require("ggplot2")
## Load and merge data. Be patient, this will take some time.
SCC <- readRDS("Source_Classification_Code.rds")
NEIcitys <- subset(readRDS("summarySCC_PM25.rds",), fips %in% c("24510","06037"))
edata <- merge(NEIcitys, SCC[,c(1:4,7:10)], by = "SCC")
## Remove data frames not necessary anymore and clean with gc()
rm(list = c("NEIcitys","SCC")); gc()
## Subset for "veh" in SHort.Name to get only motor vehicles
edataveh <- edata[grep("Veh|Vehicles", ignore.case = TRUE, edata$Short.Name),]
## Summarize the data emisssions per year
edatasumm <- aggregate(Emissions ~ year + fips, edataveh, sum)
edatasumm$fips[edatasumm$fips == "24510"] <- "Baltimore City"
edatasumm$fips[edatasumm$fips == "06037"] <- "Los Angeles County"
## initiate png graphic device with width = 720 and height = 500
png("plot6.png", width = 800, height = 500)
## Plot with bars
p <- ggplot(edatasumm, aes(x = factor(year), y = Emissions, fill = fips)) ## Initializes ggplot object
p <- p + geom_bar(stat = "identity", position = position_dodge()) ## Use bar
p <- p + ylab("Emissions") +  xlab("Year") ##  Show labels
p <- p + theme(axis.title = element_text(face="bold", size=12)) ## Change the axis labels style
p <- p + theme(plot.title = element_text(size = rel(1.5))) ## Change the title style
p + ggtitle("Emissions from motor vehicle. Baltimore City vs Los Angeles County") ## Show the title
dev.off()  ## Close the device (png)