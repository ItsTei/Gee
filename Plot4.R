## plot4.R
## United States: Emissions from coal combustion-related sources, 1999–2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Package 'ggplot2' is required. Install it with install.packages('ggplot2').")
}
library(ggplot2)

coal_scc <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), "SCC"]

coal_nei <- NEI[NEI$SCC %in% coal_scc, ]

agg <- aggregate(Emissions ~ year, data = coal_nei, sum, na.rm = TRUE)

png("plot4.png", width = 900, height = 550)

ggplot(agg, aes(x = year, y = Emissions)) +
  geom_line() +
  geom_point() +
  labs(title = "US PM2.5 Emissions from Coal Combustion-Related Sources (1999–2008)", x = "Year",y = "PM2.5 Emissions (tons)"
  ) + scale_x_continuous(breaks = sort(unique(agg$year))) + theme_minimal()

dev.off()
