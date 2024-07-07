comcoal <- SCC[grepl("Comb.*Coal", SCC$EI.Sector), ]

comcoal_scc <- unique(comcoal$SCC)
comcoal_emi <- NEI[(NEI$SCC %in% comcoal_scc), ]
comcoal_year <- comcoal_emi %>% group_by(year) %>% summarise(total = sum(Emissions))

#graph
png("./plot/Plot4.png")
par(mai = c(0.9, 0.9, 0.9, 0.9))
barplot(
        comcoal_year$total/10^3,
        names.arg=comcoal_year$year, 
        col = "darkblue", 
        ylim = c(0,600),
        xlab="Year",
        ylab=expression('Total PM'[2.5]*' emission '*(x10^3)),
        main=expression('Coal combustion related PM'[2.5]*' emissions'),
)
dev.off()