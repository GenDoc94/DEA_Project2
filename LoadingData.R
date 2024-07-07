#LOADING LIBRARIES
library(dplyr)
library(ggplot2)

#CREATING FOLDERS
if(!file.exists("./data")) {
        dir.create("./data")
}
if(!file.exists("./plot")) {
        dir.create("./plot")
}

#DOWNLOADING DATA
linkURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(linkURL, destfile = "./data/FNEI_data.zip")
rm(linkURL)
unzip(zipfile = "./data/FNEI_data.zip", exdir = "./data")
file.remove("./data/FNEI_data.zip")

##READING DATA
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

#MODIFING BASE
NEI$year <- factor(NEI$year)
NEI$type <- factor(NEI$type)