###R code for visualisation for SQL project Data Jobs
#Visualisation for SQL Data Jobs project

#Load libraries ---

library(tidyverse)
library(lubridate)
library(tidyquant)

#load data ---
data_jobs_tbl <- read.csv("2_top_paying_role.csv")

# top paying data role in the UK in 2023
data_jobs_tbl %>% 
    ggplot(aes(x = average_yearly_salary, y = reorder(job_title_short, average_yearly_salary), 
               fill = average_yearly_salary)) +
    geom_col() +
    scale_fill_gradient(low = "grey", high = "#2e3c50") + # Gradient colour
    
    scale_x_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = "K")) +
    
    labs(title = "Top-paying data roles in the UK in 2023",
         x = "Average Yearly Salary",
         y = "") +
    theme_minimal() +
    theme(legend.position = "none") # This removes the legend 