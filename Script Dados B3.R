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
                      first_year = 2010, 
                      last_year = 2020)

str(l_dfp)

l_dfp_EM <- l_dfp %>% 
  

writexl::write_xlsx(x = list(df_info = df_info),
                    path = 'D:/Desktop/FINOR/DadosEmpresasB3.xlsx',
                    format_headers = F)
writexl::write_xlsx(x = list(DRE = l_dfp$`DF Consolidado - Demonstração do Resultado`),
                    path = 'D:/Desktop/FINOR/l_dfp.xlsx',
                    format_headers = F)
                    