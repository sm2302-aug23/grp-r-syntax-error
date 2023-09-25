# Task 6 Creative visualisation challenge

#Load libraries
library(ggplot2)
library(dplyr)

# 1. How sequence lengths change over a range of starting integers -------

# Plotting a graph of sequence lengths change over a range of starting integer
ggplot(collatz_df, aes(x = start, 
                       y = sapply(seq, length))) +
  geom_line() +
  labs(
    title = "Sequence length change over a range of starting integer",
    x = "Starting integer",
    y = "Sequence Length"
  ) +
  theme_minimal()

# 2. How to quickly sequences reach 1, considering only the steps after -----
# they first reach a value less than thier starting integer

# Function to calculate Collatz steps
collatz_steps <- function(n) {
  steps <- 0
  while (n != 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    steps <- steps + 1
  }
  return(steps)
}

# Make a vector to know the number of steps for each integer
steps_vector <- numeric(0)

# Steps for numbers from 2 to 10,000 
for (i in 2:10000) {
  steps_vector <- c(steps_vector, collatz_steps(i))
}

data <- data.frame(Number = 2:10000, Steps = steps_vector)

# Histogram graph
ggplot(data, aes(x = Steps)) +
  geom_histogram(binwidth = 10, fill = "red", color = "black") +
  labs(title = "Distribution of Collatz Steps",
       x = "Number of Steps to Reach 1",
       y = "Frequency")

# 3. How often specific numbers (other than 1) appear in sequences, -----
# across all starting integers

# Function to find Collatz sequence
collatz_sequence <- function(n) {
  sequence <- c(n)
  while (n > 1) {
    if (n %% 2 == 0) {
      n <- n / 2
    } else {
      n <- 3 * n + 1
    }
    sequence <- c(sequence, n)
  }
  return(sequence)
}

#Range from 2 to 10000
start_range <- 2:10000


# Initialize data frame for specific numbers
data <- data.frame(Number = numeric(0), Count = numeric(0))

# Selecting specific number to be examined (excluding 1)
numbers_to_count <- c(2:10)

# Generate collatz sequence for a starting integer and particular number
for (start in start_range) {
  sequence <- collatz_sequence(start)
  for (number in numbers_to_count) {
    count <- sum(sequence == number)
    data <- rbind(data, data.frame(Number = number, Count = count))
  }
}

# Bar chart graph
ggplot(data, aes(x = factor(Number), y = Count)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(title = "Specific number frequency in collatz seq",
       x = "Specific Number",
       y = "Frequency")
