library(shiny)
library(shinythemes)
library(DT)
library(hms)
library(reshape2)
library(readr)
library(readxl)

## read refdata into R
file = "data/GSARefDB_1.5.xlsx"

## openxlsx::read.xlsx(file,1, startRow=5)
GTdata <- readxl::read_excel(file, sheet = 1, range = "B5:L391")
RBdata <- readxl::read_excel(file, sheet = 2,  range = "B5:H90")
GeGdata <- readxl::read_excel(file, sheet = 3, range = "B5:H70")
ncGdata <- readxl::read_excel(file, sheet = 4, range = "B5:H38")
MSdata <- readxl::read_excel(file, sheet = 5, range = "B5:H34")
MGdata <- readxl::read_excel(file, sheet = 6, range = "B5:H28")
Indata <- readxl::read_excel(file, sheet = 7, range = "B5:H25")
history <- readxl::read_excel(file, sheet = 8, range = "B5:E646")

## analysis
source("R/2019_Mora_Popularity_versus_Performance.R")


