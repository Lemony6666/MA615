country_compare <- function(data1, country_choose){ #build a function, and the only interest is an input dataset
  data2 <- data1[data1$country %in% country_choose, ]
  ggplot(data= data2, aes(x=year, y=value, colour = country))+ #choosing data, x lab, ylab and country is group
    geom_line() +
    facet_wrap(~id)+#plot a line chart
    geom_label_repel(data= subset(data2, year == max(year)), #set for label text and the site in the end of the line
                     aes(label = country), #label by country
                     nudge_x = .75, #the label will far from
                     na.rm = TRUE) +
    theme(legend.position = "none")
}

id_compare <- function(data1, country_choose){ #build a function, and the only interest is an input dataset
  data2 <- data1[data1$country %in% country_choose, ]
  ggplot(data= data2, aes(x=year, y=value, colour = id))+ #choosing data, x lab, ylab and country is group
    geom_line() +
    facet_wrap(~country)+#plot a line chart
    geom_label_repel(data= subset(data2, year == max(year)), #set for label text and the site in the end of the line
                     aes(label = id), #label by id
                     nudge_x = .75, #the label will far from
                     na.rm = TRUE) +
    theme(legend.position = "none")
}


# add a new function
country_compare_newadd <- function(data1){
  ggplot(data = data1) +
    geom_point(mapping = aes(x = Country, y = mean.gdp)) 
}








#######################
#' You did a really good job. Your presentation structure, your readable plots
#' and your story are awesome and interesting.
#' I also add another function to illustrate the comparison between different 
#' countries by show the GDP with scatter plot.
#######################
