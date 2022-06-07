library(jsonlite)
library(tidyverse)
library(janitor)
library(dplyr)
library(ggplot2)
library(googlesheets4)
library(stringr)
library(rvest)
library(XML)
library(RCurl)
library(rjson)
library(png)
library(baseballr)
library(dplyr)
library(lubridate)


date <- Sys.Date()

raw_data <- read.csv("https://raw.githubusercontent.com/globaldothealth/monkeypox/main/latest.csv")

all_data <- raw_data %>% 
  filter(Status == "confirmed") %>% 
  select(ID, Status, Location, City,
         Country, Age, Gender, Date_onset,
         Date_confirmation, Symptoms)
all_data$observation <- 1:nrow(all_data) 

Country_data <- all_data %>% 
  count(Country)

write.csv(Country_data,
          file = "MonkeyPox_Cases_Country.csv",
          row.names = F)


canada <- raw_data %>% 
  filter(Country == "Canada") %>% 
  filter(Status == "confirmed") %>% 
  select(ID, Status, Location, City,
         Country, Age, Gender, Date_onset,
         Date_confirmation, Symptoms)
canada$observation <- 1:nrow(canada) 

write.csv(canada,
          file = "canada_monkeypox_confirmed.csv",
          row.names = F)
