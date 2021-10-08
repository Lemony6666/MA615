
gdp <- read.xlsx("gdp_per_capita_yearly_growth.xlsx") # read data file
income <- read.xlsx("income_per_person_gdppercapita_ppp_inflation_adjusted.xlsx")

#Changing variable types makes it easy to merge
for (i in 1:ncol(gdp)) {
  gdp[,i] <- as.character(gdp[,i])
}
for (i in 1:ncol(income)) {
  income[,i] <- as.character(income[,i])
}

# Combining two tables into one
data_tidy <- bind_rows("gdp" = gdp,  "income"=income, .id= "id")

#tidy data, a narrower table
data_tidy1 <- gather(data_tidy, "year", "value", 3:ncol(data_tidy))

#replace irregular character
data_tidy1$value[grepl("*k", data_tidy1$value)] <- as.numeric(gsub("k", "",grep("*k", data_tidy1$value,value = T)))*(1000)
data_tidy1$value[grepl("*−", data_tidy1$value)] <- gsub("−", "-",grep("*−", data_tidy1$value,value = T))

#change the character to prepare for the plot 
data_tidy1$value <- as.numeric(data_tidy1$value)

# ignore data records which include NA
data_tidy1 <- na.omit(data_tidy1)

#Change dataset into tibble
data_tibble <- as_tibble(data_tidy1)









