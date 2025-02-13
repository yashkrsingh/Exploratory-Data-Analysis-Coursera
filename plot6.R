## Name         : Yash Kumar Singh
## Program Title: Constructing plot6.png
## ------------------------------------------------------------------

##-------------------------------------------------------------------
## Reading data and altering it according to the need
##-------------------------------------------------------------------
NEI <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/summarySCC_PM25.rds")
SCC <- readRDS("~/Exploratory-Data-Analysis-Assignment-2/Source_Classification_Code.rds")

library(ggplot2)
graph1 <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]
graph1 <- aggregate(Emissions ~ year, graph1, sum) 
graph1 <- cbind(Counties = rep("Baltimore City", 4),graph1)
graph2 <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD",]
graph2 <- aggregate(Emissions ~ year, graph2, sum) 
graph2 <- cbind(Counties = rep("Los Angeles", 4),graph2)
graph <- rbind(graph1, graph2)
rm(graph1, graph2)

##-------------------------------------------------------------------
## Constructing plot1.png
##-------------------------------------------------------------------
png(filename = "~/Exploratory-Data-Analysis-Assignment-2/plot6.png", width = 480, height = 480, units = "px", bg = "white")
g <- ggplot(graph, aes(year, Emissions, col = Counties))
g <- g + geom_line() + xlab("Year") + ylab("Total Emissions from Motor Sources") + ggtitle("Comparison of Motor Source Related Emissions between two Counties over the years")
print(g)
dev.off()

##-------------------------------------------------------------------