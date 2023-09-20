# Filter collatz_df to retain sequences that exhibit backtracking
backtracks_df <- collatz_df %>%
  filter(
    start > 1,  # Exclude starting integers already at 1
    any(seq > start)  # Include sequences that go above the starting integer
  )

# Calculate the number of times each sequence goes above its starting integer
backtracks_df <- backtracks_df %>%
  mutate(
    backtrack_count = sum(seq > start) - 1  # Count the number of times it goes above start
  )

# Determine the maximum value reached after the first backtrack
max_after_backtrack <- max(
  unlist(
    lapply(backtracks_df$seq, function(x) max(x[x > x[1]]))
  )
)

# Find the most frequently occurring number of times sequences go above their starting integer
#mode_backtrack <- mode(backtracks_df$backtrack_count)

# Calculate the mode of backtrack_count using table
backtrack_counts <- backtracks_df$backtrack_count
count_table <- table(backtrack_counts)

# Find values with the highest frequency
max_frequency <- max(count_table)
modes <- as.numeric(names(count_table[count_table == max_frequency]))

if (length(modes) == 1) {
  cat("Mode of backtrack_count:", modes, "\n")
} else {
  cat("Multiple modes of backtrack_count:", paste(modes, collapse = ", "), "\n")
}

# Count the frequency of backtracking sequences among even and odd starting integers
even_odd_backtrack <- backtracks_df %>%
  group_by(parity) %>%
  summarise(count = n())

# Print the results
print(backtracks_df)
print(max_after_backtrack)
print(modes)
print(even_odd_backtrack)
