motor_baltla <- subset(motor_emi, (fips == "24510" | fips == "06037"))
motor_baltla_year <- aggregate(Emissions ~ (year + fips), motor_baltla, sum)
motor_baltla_year <- motor_baltla_year %>%
        mutate(fips = recode(fips, "06037" = "Los Angeles", "24510" = "Baltimore"))

#graph
g2 <- ggplot(motor_baltla_year, aes(factor(year), Emissions, 
                          fill = fips, label = round(Emissions)))
png("./plot/Plot6.png")
g2 + 
        geom_bar(stat = "identity") + 
        facet_grid(. ~ fips, scales = "free", space = "free") + 
        ggtitle("Total Motor Vehicle Emissions in Baltimore and Los Angeles") +
        labs(x = "year",
             y = expression('Total PM'[2.5]*' emission '*(x10^3))) +
        ylim(c(0, 8000)) +
        theme_classic() +
        theme(legend.position = "bottom",
              axis.text.x = element_text(size = 8),
              plot.title = element_text(hjust = 0.5)) +
        geom_text(size = 4, vjust = -1)
dev.off()
