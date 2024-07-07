motor <- SCC[grepl("Vehicle", SCC$SCC.Level.Two), ]
motor_scc <- unique(motor$SCC)
motor_emi <- NEI[(NEI$SCC %in% motor_scc), ]
motor_balt <- subset(motor_emi, fips == "24510")
motor_balt_year <- aggregate(Emissions ~ year, motor_balt, sum)

#graph
png("./plot/Plot5.png")
par(mai = c(0.9, 0.9, 0.9, 0.9))
barplot(
        motor_balt_year$Emissions,
        names.arg=motor_balt_year$year, 
        col = "darkblue", 
        ylim = c(0,450),
        xlab="Year",
        ylab=expression('PM'[2.5]*' emission '*(x10^3)),
        main="Total Motor Vehicle Emissions in Baltimore")
dev.off()