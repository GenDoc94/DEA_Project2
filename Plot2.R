balt <- subset(NEI, fips == "24510")

#just to know
with(balt, tapply(Emissions, year, mean, na.rm = T))

#total emissions
balt_TE_Y <- aggregate(Emissions ~ year, balt, sum)

#graph
png("./plot/Plot2.png")
par(mai = c(0.9, 0.9, 0.9, 0.9))
barplot(
        balt_TE_Y$Emissions/10^3,
        names.arg=balt_TE_Y$year, 
        col = "darkblue", 
        ylim = c(0,4),
        xlab="Year",
        ylab=expression('Total PM'[2.5]*' emission '*(x10^3)),
        main=expression('PM'[2.5]*' emission by year in Baltimore'),
)
dev.off()
