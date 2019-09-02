## code to prepare `DATASET` dataset goes here
library(devtools)
install.packages(c("roxygen2", "testthat", "knitr"))
library(devtools)
library(roxygen2)
library(testthat)
library(knitr)

usethis::use_data_raw(elaborar_3_linhas, mtcars)

use_data_raw(name="elaborar_3_linhas")
usethis::use_data("DATASET")

elaborar_3_linhas <- read.csv(file="Dados_para_grafico_3_linhas.csv" , header = T, sep=";")
head(elaborar_3_linhas)

elaborar_4_linhas <- read.csv(file="Dados_para_grafico_4_linhas.csv" , header = T, sep=";")
head(elaborar_4_linhas)

elaborar_c_ratio <- read.csv(file="Dados_para_CR1_CR4.csv" , header = T, sep=";")
head(elaborar_c_ratio)

elaborar_taxa_cresc_12P <- read.csv(file="Dados_para_taxa_crescimento_12Pontos.csv" , header = T, sep=";")
head(elaborar_taxa_cresc_12P)

elaborar_taxa_cresc_16P <- read.csv(file="Dados_para_taxa_crescimento_16Pontos.csv" , header = T, sep=";")
head(elaborar_taxa_cresc_16P)


#criar arquivo .rda na pasta "data"
save(file="elaborar_3_linhas")
use_data_raw(elaborar_4_linhas)
use_data_raw(elaborar_c_ratio)
use_data_raw(elaborar_taxa_cresc_12P)
use_data_raw(elaborar_taxa_cresc_16P)
save(list = ls(all=TRUE), file = ".RData")

#criar arquivo R/sysdata.rda
use_data(elaborar_3_linhas, internal = TRUE)
use_data(elaborar_4_linhas, internal = TRUE)
use_data(elaborar_c_ratio, internal = TRUE)
use_data(elaborar_taxa_cresc_12P, internal = TRUE)
use_data(elaborar_taxa_cresc_16P, internal = TRUE)



grafico_linhas_ex
