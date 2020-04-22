#!/usr/bin/env Rscript

library(shiny)
library(tidyverse)

fluidPage(
  fluidRow(
    column(
      titlePanel(title = "Air Pollution Comparison App.",
                 windowTitle = "Air Pollution."),
      width = 12)),
  
  tags$br(),
  
  fluidRow(
    column(
      selectInput(input = "left_period",
                  label = "Period:",
                  choices = periods,
                  selected = "2019Q2"),
      selectInput(input = "left_country",
                  label = "Country:",
                  choices = countries, 
                  selected = "CA"),
      selectInput(input = "left_city",
                  label = "City:",
                  choices = cities, 
                  selected = "Toronto"),
    plotOutput("left_plot"),
    width = 6),
    
    column(
      selectInput(input = "right_period",
                  label = "Period:",
                  choices = periods,
                  selected = "2020"),
      selectInput(input = "right_country",
                  label = "Country:",
                  choices = countries, 
                  selected = "CA"),
      selectInput(input = "right_city",
                  label = "City:",
                  choices = cities, 
                  selected = "Toronto"),
      plotOutput("right_plot"),
      width = 6),
  ),
)