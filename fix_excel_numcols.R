# Very simple function to turn german encoded (comma as decimal) excel 
# columns into numeric r functions

require(stringr)
require(magrittr)
fix_excel_numcols <- function(x){
  x %>% 
    str_squish() %>% 
    str_replace(pattern = "\\,", replacement = "\\.") %>% 
    as.numeric()
}