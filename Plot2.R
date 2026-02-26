## plot2.R
## Total PM2.5 emissions in Baltimore City (fips 24510), 1999–2008

NEI <- readRDS("summarySCC_PM25.rds")

balt <- subset(NEI, fips == "24510")

png("plot2.png", width = 800, height = 500)

totals <- tapply(balt$Emissions, balt$year, sum, na.rm = TRUE)
years <- as.numeric(names(totals))

plot( years, as.numeric(totals), type = "b", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)",
  main = "Total PM2.5 Emissions in Baltimore City (1999–2008)"
)

dev.off()
