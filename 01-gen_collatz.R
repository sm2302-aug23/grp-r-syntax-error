# Load the necessary libraries
library(tibble)

# Create the start values from 1 to 10000
start_values <- 1:10000

# Function to generate Collatz sequences
gen_collatz_seq <- function(n) {
  collatz_seq <- c(n)
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    collatz_seq <- c(collatz_seq, n)
  }
  return(collatz_seq)
}

# Generate Collatz sequences for each start value
collatz_seqs <- lapply(start_values, gen_collatz_seq)

# Create the tibble
collatz_df <- tibble(
  start = start_values,
  seq = collatz_seqs,
  length = sapply(collatz_seqs, length),
  parity = ifelse(sapply(collatz_seqs, function(seq) seq[length(seq)] %% 2 == 0), "Even", "Odd"),
  max_val = sapply(collatz_seqs, max)
)

# Print the first few rows of collatz_df
collatz_df
