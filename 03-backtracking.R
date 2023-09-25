## Task 3

# Load libraries
library(tibble)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(purrr)

# Part (1)----------------------------------------------------------------------
# Using the has_backtracking function
has_backtracking <- function(seq) {
  n <- length(seq)
  for (i in 1:(n - 2)) {
    if (!is.na(seq[i]) && !is.na(seq[i + 2]) && seq[i] > seq[i + 2]) {
      return(TRUE) 
    }
  }
  return(FALSE)
}

# Use possibly to handle errors and filter the rows
backtracks_df <- collatz_df %>%
  mutate(backtrack = map_lgl(seq, ~possibly(has_backtracking, 
                                            otherwise = FALSE)(.x))) %>%
  filter(backtrack)

# to view the result of backtracks_df
view(backtracks_df)

# Part (2)----------------------------------------------------------------------
# Count the number of times sequences backtrack for each row
backtrack_counts <- sapply(backtracks_df$seq, function(seq_list) 
  sum(!is.na(seq_list)))

# Find the mode (most frequently occurring count)
mode_backtrack <- as.numeric(names(sort(table(backtrack_counts), 
                                        decreasing = TRUE)[1]))

# Print the result
cat("The most frequently occurring number of times sequences backtrack is:", 
    mode_backtrack, "\n")

# Part (3)----------------------------------------------------------------------
# Find the maximum value of backtracks_df
max_value <- backtracks_df %>%
  summarise(max_after_backtrack = max(map_dbl(seq, ~ max(.x)))) %>%
  pull(max_after_backtrack)

# Print the updated dataframe
print(backtracks_df)

# Print the maximum value
cat("Maximum Value After Backtrack:", max_value)

# Part (4)----------------------------------------------------------------------
# Unnest the "seq" column to convert it from a list to a long format
backtracks_df_long <- backtracks_df %>%
  unnest(seq)

# Calculate the total count of even and odd backtracking integers
total_even_odd_backtrack <- backtracks_df_long %>%
  group_by(is_even_odd = ifelse(seq %% 2 == 0, "Even", "Odd")) %>%
  summarise(count = n())

# Rename the result column to "even_odd_backtrack"
even_odd_backtrack <- total_even_odd_backtrack %>%
  rename(even_odd_backtrack = count)

# Print the result
print(even_odd_backtrack)
