names(df)
lapply(names(df), function(x))
lapply(names(df), function(x)names(df[[x]]))
df[['V1']]
writeLines(df[['Brand']][[127]])

library(tidyverse)

extract_df <- function(df) {
  
  # fileds extracted from the site
  names_df <- names(df)
  
  # function to extract each list from the information obtained from
  prepare_list <- function(name_df, df){
    
    remove_space <- function(string) {
      str_replace_all(string, "[\r\n\t\\s\\/]" , "")
      
    }
    
    do.call(rbind, lapply(df[[name_df]], remove_space))
    
  }
  
  # apply the above function to each list of information
  out <- lapply(names_df, prepare_list, df)
  
  # combine them together to for a table
  out <- do.call(cbind.data.frame, out)
  out <- as.data.frame(apply(out, 2, as.character))
  
  # assign the field names
  colnames(out) <- names_df
  
  # return fina output
  out

}

out <- extract_df(df)

class(out)
str(out)
summary(out)

head(out)
dim(out)

DATA[12]
