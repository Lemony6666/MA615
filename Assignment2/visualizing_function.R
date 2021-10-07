country_compare <- function(data){ #build a function, and the only interest is an input dataset
  ggplot(data= data, aes(x=year, y=log(value), colour = country))+ #choosing data, x lab, ylab and country is group
    geom_line() + #plot a line chart
    facet_wrap(~id)+ #divided chart by which group they are
    geom_label_repel(data= subset(data, year == max(year)), #set for label text and the site in the end of the line
                     aes(label = country), #label by country
                     nudge_x = .75, #the label will far from
                     na.rm = TRUE) +
    theme(legend.position = "none")}

id_compare <- function(data){
  ggplot(data=data, aes(x=year, y=log(value), colour = id))+
    geom_line() +
    facet_wrap(~country)+ 
    geom_label_repel(data= subset( data, year == max(year)),
                     aes(label = country),
                     nudge_x = .75,
                     na.rm = TRUE) +
    theme(legend.position = "none")}
