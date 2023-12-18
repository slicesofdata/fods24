dataviz166_packages <- c(
  
  # DATA FRAME MANIPULATION
  "tidyverse", "dplyr", "dtplyr", "data.table",
  "car",  "magrittr", 

  # DATES AND TIMES 
  "lubridate", "zoo", "xts",

  # DEVELOPMENT
  "devtools", "remotes",

  # FONTS and TEXT
  "glue", "utf8", 

  # IMAGES AND GRAPHICS 
  "ragg", "Cairo", "magick", 

  # MODELS AND DATA
  "see", "boot", "easystats", "broom", 

  # PLOTTING
  "dendextend", "dygraphs", 
  "ggplot2", "GGally", "ggiraph", "ggpubr", 
  "gt", "gtsummary",
  "plotly", "cowplot",  

  # PROJECTS AND MANAGEMENT
  "gitr", "here", "usethis", #"renv",
  
  # READING AND WRITING DATA FILES 
  "foreign", "haven", "vroom", "xlsx", "readr", "openxlsx",

  # REFERENCES AND REPORTING 
  "bibext", "knitr", "pandoc", "rstudioapi", "rmarkdown", "quarto", 
  "shiny", "shinydashboard", "shinydashboardPlus", 

  # STRING MANIPULATION
  "stringr",

  # TABLES
  "DT", "htmlwidgets", "htmlTable", "kable", "kableExtra",
  
  # OTHER
  "coin", "fs", "zoom",
  "webshot", "sjPlot", "sqldf", 
)

install.packages(dataviz167_packages, dep = T)
