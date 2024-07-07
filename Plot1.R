#just to know
with(NEI, tapply(Emissions, year, mean, na.rm = T))

#total emissions
#TotEmiYear <- NEI %>% group_by(year) %>% summarize(total = sum(Emissions))
TotEmiYear <- aggregate(Emissions ~ year, NEI, sum)

#graph
png("./plot/Plot1.png")
par(mai = c(0.9, 0.9, 0.9, 0.9))
barplot(
        (TotEmiYear$Emissions)/10^6,
        names.arg=TotEmiYear$year, 
        col = "darkblue", 
        ylim = c(0,8),
        xlab="Year",
        ylab=expression('Total PM'[2.5]*' emission '*(x10^6)),
        main=expression('PM'[2.5]*' emission by year'),
)
dev.off()
