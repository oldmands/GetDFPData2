install.packages("devtools")
install.packages("tidyverse")
devtools::install_github('msperlin/GetDFPData2')
library(devtools)
library(tidyverse)
library(GetDFPData2)

df_info <- get_info_companies(tempdir())
print(df_info )

# downloading DFP data
l_dfp <- get_dfp_data(companies_cvm_codes = NULL, 
                      use_memoise = FALSE,
                      clean_data = TRUE,
                      cache_folder = tempdir(), # use local folder in live code
                      type_docs = c("BPA", "BPP", "DRE"),
                      type_format = 'con',
                      first_year = 2000, 
                      last_year = lubridate::year(Sys.Date()))

str(l_dfp)
