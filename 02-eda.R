## Task 2 - Exploratory data analysis

# Loading library --------------------------
library(tidyverse)
library(dplyr)

# 1. Find the top 10 starting integers that produce ---------------------------
# the longest sequences [top10longest].

# Collecting the top 10 longest sequence in decending order 
top10longest_seq <- collatz_df %>%
  arrange(desc(length)) %>%      # arrange in descending order 
  head(10)                       # displaying the top 10 

# data frame to present in a vector form
top10longest <- data.frame(Integer = top10longest_seq$start,
                              Length = top10longest_seq$length)

top10longest

# 2. Find out which starting integer produces a sequence that reaches the ----
# highest maximum value [max_val_int].

max_val <- collatz_df %>%
  filter(max_val == max(max_val)) %>%
  select(start)

max_val_int <- data.frame(max_val = max_val$start)
max_val_int

# 3. What is the average length and standard deviation of the sequence for ----
# even starting integers compared to odd ones? 
# [even_odd_avg_len and even_odd_sd_len]

# Calculate avg/mean length and standard deviation for;

# even integer
even_avg_len <- mean(collatz_df$length[collatz_df$parity == "Even"]) 
even_sd_len <- sd(collatz_df$length[collatz_df$parity == "Even"])

# odd integer
odd_avg_len <- mean(collatz_df$length[collatz_df$parity == "Odd"])
odd_sd_len <- sd(collatz_df$length[collatz_df$parity == "Odd"])

# To compare, we put it in data.frame
# average
even_odd_avg_len <- data.frame(
  even_avg_len = even_avg_len,
  odd_avg_len = odd_avg_len
  )

#standard deviation
even_odd_sd_len <- data.frame(
  even_sd_len = even_sd_len,
  odd_sd_len = odd_sd_len
  )

print(even_odd_avg_len)
print(even_odd_sd_len)
