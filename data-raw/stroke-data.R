# load required packages ----
if (!require("pacman")) install.packages("pacman") 
pacman::p_load(magrittr, dplyr, usethis, data.table, here, haven)

# clean data ----
complete <- read_sas(here::here("data-raw","completedata.sas7bdat"))
stroke <- as.data.frame(complete) %>% dplyr::select(Age,Sex,R_E,Education,Htn,HiChol, Afib, Cad, Db,CurrentSmoker,HxStroke,NIHScore, Comorbidity1,Fatalism,Depression)

# write data in correct format to data folder ----
usethis::use_data(stroke, overwrite = TRUE)
