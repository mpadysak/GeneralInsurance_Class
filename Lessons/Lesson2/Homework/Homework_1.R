# Find out, which __year__ was the __most terrific__ for portfolio you have identified as __most profitable__ during the lesson and 
# show it on the chart using `ggplot2` package. Write an explanation about your findings into the code as comment.
# __Commit__ it to your repository into `Lessons/Lesson2/Homework`.

## Code
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

dt_KPI <- read.csv("./Data/lesson2_KPI.csv")
dt_KPI %>%  mutate(Prof = Premium - Expenses - Losses) %>% 
  group_by(Business) %>% 
  summarize(Prof = sum(Prof, na.rm = TRUE)) %>% 
  arrange(Prof) 
#Najviac profitable portfolio je Travel
subset(dt_KPI, Business=="Travel") %>%  mutate(Prof = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(Prof = sum(Prof, na.rm = TRUE)) %>% 
  arrange(Prof) 
#Najhorsi bol rok 2016
subset(dt_KPI, Business=="Travel") %>% 
  mutate(Prof = Premium - Expenses - Losses) %>% 
  group_by(Year) %>% 
  summarize(Prof = sum(Prof, na.rm = TRUE)) %>% 
  ggplot(aes(x = reorder(Year, Prof), y = Prof)) + 
  geom_point() 

# Your Explanation about analysis:
# S potencionalnou ujmou na vseobecnosti chapem identifikovanie portfolii na zaklade businessu, 
#preto najprv hladam najziskovejsie portfolio podla biznisov - prislo mi to tak najlogickejsie, 
#po zisteni ze je to Travel zoradim Profity pre toto portfolio po rokoch - zistujem ze je to 2016, 
#na zaver to vykreslim ako points kde sa to tiez da jednoducho odcitat
# Doma mi nefunguje Rstudio v kombinacii s gitom, ak chcem nacitat "dplyr" je v zlej verzii a chce sa preinstalovat, pri nacitani nema spravny "yaml" a chce ho preinstalovat a ten uz nejde vobec, nahravam to preto cez github ako text


