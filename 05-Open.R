###Task 5
##Find the Relation between Prime number and its parity 

## Sort out the numbers Prime number and compare it with parity 

# For prime number after number 2 the parity is Odd, only number 2 is even parity 

#1st step is to sort out all of the prime numbers in "collatz_df"

# Inspect if the number is prime.
is_prime <- function(n) {
  if (n <= 1) return(FALSE)
  if (n == 2) return(TRUE)
  if (n %% 2 == 0) return(FALSE)
  for (i in 3:sqrt(n)) {
    if (n %% i == 0) return(FALSE)
  }
  return(TRUE)
}

# After that filter out the prime numbers in collatz_df 
prime_numbers_df <- collatz_df %>%
  filter(sapply(start, is_prime)) %>%
  arrange(start)

# Print/display the "collatz_df" with sorted and prime numbers only to visualize the result
prime_numbers_df

