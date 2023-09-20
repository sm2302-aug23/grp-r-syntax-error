# Load the necessary libraries
library(tibble)

# Define the gen_collatz function
gen_collatz <- function(n) {
  collatz_seq <- c(n)
  
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    collatz_seq <- c(collatz_seq, n)
  }
  
  return(list(seq = collatz_seq))
}

# Initialize an empty tibble
collatz_df <- tibble(start = integer(0), seq = list(), length = integer(0), parity = character(0), max_val = integer(0))

# Loop through integers from 1 to 10,000 and apply the gen_collatz function
for (i in 1:10000) {
  result <- gen_collatz(i)
  
  collatz_seq <- result$seq
  collatz_df <- collatz_df %>%
    add_row(start = i, 
            seq = list(collatz_seq), 
            length = length(collatz_seq), 
            parity = ifelse(i %% 2 == 0, 
                            "Even", 
                            "Odd"),
            max_val = max(collatz_seq))
}

# Print the first few rows of collatz_df
collatz_df

