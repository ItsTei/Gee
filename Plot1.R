## plot1.R
## Total PM2.5 emissions in the United States (all sources), 1999–2008

NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png", width = 800, height = 500)

totals <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)
years <- as.numeric(names(totals))

plot(  years, as.numeric(totals), type = "b", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)",
  main = "Total PM2.5 Emissions in the United States (1999–2008)"
)

dev.off()
