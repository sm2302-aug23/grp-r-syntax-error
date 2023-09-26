## Task 4
# Loading libraries ----
library(ggplot2)

# 1. Create a scatterplot of all the sequence lengths, with the starting ------
# integer on the horizontal axis and the length of the sequence on the 
# vertical axis. Identify the top 10 starting integers on your plot.

# Create a scatterplot of sequence lengths
ggplot(collatz_df, aes(x = start,
                       y = length)) + 
  geom_point() +
  labs(x = "Starting Integer", 
       y = "Sequence Length") +
  ggtitle("Collatz Sequence Lengths by Starting Integer") +
  theme_minimal()


# 2. Create another scatterplot, but this time graph the highest value --------
# reached in the sequence on the vertical axis. Highlight the top 10 
# starting integers in a different color.

# Create a scatterplot of the highest value reached
ggplot(collatz_df, aes(x = start, 
                       y = max_val)) +
  geom_point(aes(color = ifelse(start %in% top10longest_seq$start, 
                                "Top 10", 
                                "Others"))) +
  scale_color_manual(values = c("Top 10" = "green", 
                                "Others" = "blue")) +
  labs(x = "Starting Integer",
       y = "Maximum Value Reached") +
  ggtitle("Collatz Maximum Value Reached by Starting Integer") +
  theme_minimal()

# 3. Create a boxplot comparing the distributions of sequence lengths for -----
# even and odd starting integers. Are there any noticeable differences?

# Create a boxplot comparing sequence lengths for even and odd starting integers
ggplot(collatz_df, aes(x = parity, 
                       y = length, 
                       fill = parity)) +
  geom_boxplot() +
  labs(x = "Parity (Even or Odd)", 
       y = "Sequence Length") +
  ggtitle("Distribution of Collatz Sequence Lengths by Parity") +
  theme_minimal()
