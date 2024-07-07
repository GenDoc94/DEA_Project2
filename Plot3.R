balt_TE_YT <- aggregate(Emissions ~ year + type, balt, sum)

png("./plot/Plot3.png")
g <- ggplot(balt_TE_YT, 
            aes(x = factor(year), 
                y = Emissions, 
                fill = type, 
                label = round(Emissions))) 
g + 
        geom_bar(stat = "identity") + 
        facet_grid(. ~ type, scales = "free", space = "free") + 
        ggtitle(expression('Total PM'[2.5]*' emission in Baltimore')) + 
        labs(x = "year",
             y = expression('Total PM'[2.5]*' emission '*(x10^3))) +
        theme_classic() + 
        theme(legend.position = "bottom",
              axis.text.x = element_text(size = 8),
              plot.title = element_text(hjust = 0.5))
dev.off()
