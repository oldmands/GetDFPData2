# install.packages("devtools")
# install.packages("tidyverse")
# devtools::install_github('msperlin/GetDFPData2')
# library(devtools)
library(tidyverse)
library(GetDFPData2)

df_info <- get_info_companies(tempdir())
print(df_info )

l_dfp <- get_dfp_data(companies_cvm_codes = NULL, 
                      use_memoise = FALSE,
                      clean_data = TRUE,
                      cache_folder = tempdir(), # use local folder in live code
                      type_docs = c("BPA", "BPP", "DRE"),
                      type_format = 'con',
                      first_year = 2010, 
                      last_year = 2020)

writexl::write_xlsx(x = list(companies_info = df_info,
                             DRE = l_dfp$`DF Consolidado - Demonstração do Resultado`,
                             Ativo = l_dfp$`DF Consolidado - Balanço Patrimonial Ativo`,
                             Passivo = l_dfp$`DF Consolidado - Balanço Patrimonial Passivo`),
                    path = 'D:/Desktop/FINOR/DadosEmpresasB3.xlsx',
                    format_headers = F)

                    