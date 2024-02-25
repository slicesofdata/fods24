################################################################################
# Author:
#
################################################################################
# Description:
# reads and cleans gng_long.Rds
# create necessary variables
# modifies RT
# saves gng_long_clean.Rds for data aggregation/summary


################################################################################
# load libraries and functions
library(dplyr)
R.utils::sourceDirectory(here::here("r", "functions"))

################################################################################
# source the previous steps (read raw, subsets to wide, converts to long, then
# writes gng_long.Rds)
source(here::here("r", "gng", "gng_wide_to_long.R"))

################################################################################
# read long data
GNG <- readRDS(here::here("data", "gng", "gng_long.Rds"))

################################################################################
# Clean
GNG <-
  GNG |>
  # create and relocate wave
  mutate(wave = id_wave) |>
  relocate(wave, .after = id_wave) |>

  # then pipe to:
  mutate(count = 1) |>

  # then pipe to:
  mutate(cue = case_when(
    ptarget %in% c("VGO.bmp", "VNOGO.bmp") ~ "Vertical",
    ptarget %in% c("HGO.bmp", "HNOGO.bmp") ~ "Horizontal",
    is.na(ptarget) ~ NA
  )) |>
    #ifelse(ptarget %in% c("VGO.bmp", "VNOGO.bmp"), "Vertical", "Horizontal")) |>
  # could also use gsub to clean up.

  # then pipe to:
  mutate(target = case_when(
    stringr::str_detect(ptarget, "NOGO") ~ "No-Go",
    !stringr::str_detect(ptarget, "NOGO") ~ "Go",
    is.na(ptarget) ~ NA
  )) |>

  # accuracy
  mutate(accuracy = case_when(
    correct %in% c("Correct1", "Correct2") ~ 1,
    correct == "Incorrect" ~ 0,
    is.na(ptarget) ~ NA
  )) |>
  # make rt missing
  mutate(rt = ifelse(rt == 0, NA, rt))

#view_html(GNG)
#glimpse(GNG)
################################################################################
# trim data maybe

################################################################################
# write
saveRDS(GNG, here::here("data", "gng", "gng_long_clean.Rds"))

message("Wrote: gng_long_clean.Rds")

