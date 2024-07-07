with(NEI, tapply(Emissions, year, mean, na.rm = T))
png("./plot/Plot1.png", width = 480, height = 480)
boxplot(log10(Emissions) ~ year, data = NEI)
dev.off()
