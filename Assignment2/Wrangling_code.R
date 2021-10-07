
gdp <- read.xlsx("/Users/lengyuanming/Desktop/615/Assignment/MA615_1/Assignment2/Data/gdp_per_capita_yearly_growth.xlsx") # read data file
hapiness <- read.xlsx("/Users/lengyuanming/Desktop/615/Assignment/MA615_1/Assignment2/Data/hapiscore_whr.xlsx")

#Changing variable types makes it easy to merge
for (i in 1:ncol(gdp)) {
  gdp[,i] <- as.character(gdp[,i])
}
for (i in 1:ncol(hapiness)) {
  hapiness[,i] <- as.character(hapiness[,i])
}

# Combining two tables into one
data_tidy <- bind_rows("gdp" = gdp,  "hapiness"=hapiness, .id= "id")

#tidy data, a narrower table
data_tidy1 <- gather(data_tidy, "year", "value", 3:ncol(data_tidy))

#replace irregular character
data_tidy1$value[grepl("*−", data_tidy1$value)] <- gsub("−", "-",grep("*−", data_tidy1$value,value = T))

#change the character to prepare for the plot 
data_tidy1$value <- as.numeric(data_tidy1$value)
data_tibble$year <- as.numeric(data_tibble$year)

# ignore data records which include NA
data_tidy1 <- na.omit(data_tidy1)

#Change dataset into tibble
data_tibble <- as_tibble(data_tidy1)

#Choosing the year we are interested
data_tibble <- filter(data_tibble, year %in% 2004:2018)








