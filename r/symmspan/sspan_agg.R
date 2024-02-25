################################################################################
# Author:
#
################################################################################
# Description:
# reads and cleans sspan_long_cleaned.Rds
# filters rows
# aggregation/summary


################################################################################
# garbage clean
gc(verbose = FALSE, full = TRUE, reset = TRUE)

# load libraries and functions
library(dplyr)
R.utils::sourceDirectory(here::here("r", "functions"))

################################################################################
# source the previous steps (read raw, subsets to wide, converts to long, then
# writes sspan_long.Rds)
source(here::here("r", "symmspan", "sspan_long_clean.R"))

################################################################################
# read long cleaned data
SSPAN <- readRDS(here::here("data", "symmspan", "sspan_long_clean.Rds"))

################################################################################
# Aggregate
SSPAN |>
  mutate(sspan1 = ifelse(wave == "1", sspan, NA),
         sspan2 = ifelse(wave == "2", sspan, NA),
         sspan3 = ifelse(wave == "3", sspan, NA),
         ) |>
  # consider grouping variables (demog)
  group_by(id_subject, id_school) |>
  summarize(
    task_count = n(),
    sspan1 = mean(sspan1, na.rm = T),
    sspan2 = mean(sspan2, na.rm = T),
    sspan3 = mean(sspan3, na.rm = T),
    sspan_all = mean(c(sspan1, sspan2, sspan3), na.rm = T),

            ) |>
  view_html()


################################################################################
# trim data maybe

################################################################################
#

message("Wrote: sspan_long_clean.Rds")
