

sum_special <- function(df_x){
  
  ## sum_special calculates data summary statistics
  ## the input param df_x is the data frame of input values
  
  #  browser()  # browser() will start the debugger
               # if the line is uncommented
  
  
  ## test the input data to assure that it is a data frame.
  try(if(!is.data.frame(df_x)) stop("Input data must be a data frame."))
  
  
  sp_means <- apply(df_x, MARGIN = 2, FUN = mean)
  sp_var <- apply(df_x, MARGIN = 2, FUN = var)
  sp_cov <- cov(df_x)
  sp_cor <- cor(df_x)
  
  ## Note that defining a list with the 
  ## syntax list(list_name = list_content) produces
  ## named list items
  sp_outputs <- list(sp_means=sp_means, 
                     sp_var = sp_var, 
                     sp_cov = sp_cov, 
                     sp_cor = sp_cor)
  
  return(sp_outputs)
}






