library(tidyverse)

periods <- c("2020",
             "2019Q1",
             "2019Q2",
             "2019Q3",
             "2019Q4",
             "2018H1",
             "2017H1",
             "2016H1",
             "2015H1")

getData <- function(periods) {
  dfs <- list()
  for (period in periods) {
    df <- read_csv(paste0("./data/air/", period, ".csv"), skip = 4)
    dfs[[period]] <- df 
  }
  return(dfs)
}

data <- getData(periods)

sample_df <- read_csv("./data/air/2020.csv", skip = 4)

countries <- sort(unique(sample_df[["Country"]]))

cities <- sort(unique(sample_df[sample_df[["Country"]] == "CA", ][["Cities"]]))

colorful_plot <- function(df) {
  
  df = df() %>% group_by(Specie)
  
  x = df[["Date"]]
  y = df[["median"]]

  plot(x = x,
       y = y,
       xlim = c(min(x), max(x)),
       ylim = c(min(y), max(y)))

}