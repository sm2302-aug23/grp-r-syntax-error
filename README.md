[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/HUOoSZXh)
# Assignment 1 (R group)

Task 1 - 19B9029
Task 2 - 19B9046
Task 3 - 19B9052
Task 4 - 19B9029
Task 5 - 19B9027
Task 6 - 19B9046
README. - 19B9027 & 19B9052

> Analysis of the Collatz Conjecture

- [Assignment questions](ASSIGNMENT.md) 
- Please also read [`INSTRUCTIONS.md`](INSTRUCTIONS.md) for specific
submission instructions and marking rubric.

#Task 1

Firstly we generate the Collatz function and create an empty tibble. Next we 
apply the gen_collatz function on integers from 1 to 10,000. Thus we have 
produce a tibble consist of the sequence of the integer, length, parity (odd
and even) and the max_val.

#Task 2

In part 1 we find the top 10 strongest in descending order. We use 
arrange(desc()) to arrange in the descending order and then use the data.frame
function to show in vector form. In Part 2 we find the starting integer that 
produces a sequence that reaches the highest maximum value. Next we apply the 
filter() function to subset the data frame, therefore we get 9663 for the 
max_val. For part 3 we find the average length and the standard deviation for 
both odd and even. firstly, we need to find the even and odd integer. Then to 
compare we use the mean() and sd() function. We got the even average length and 
odd average length which is 79.5936 and 92.3396 respectively. For the standard 
deviation we got 45.10308 for even and 47.1837 for odd.

#Task 3

In part 1 we use the has_backtracking function, this is used for comparing 
elements in the sequence. The function we are using also checks if the condition
are met the functions TRUE however FALSE for otherwise. Next we use the mutate()
and map_lgl, the reason for this function is to apply the method for each 
element of a vector. Thus, a new tibble will show for the result. Part 2 we find
the most frequently occurring number of times sequences backtrack. The result 
we got was 53. In part 3 we made a tibble to find the each max value backtrack.
Finally for part 4 we find the total for even and odd backtrack value which
is 567643 for even and 292020 for odd.

#Task 4

First we create the scatter plot for the sequence length using the geom_point 
function. For the next scatter plot we used to find highest value reached in the
sequence on the vertical axis, we also highlight the top 10 with the colour 
green. The final plotting is the box plot using the geom_boxplot. The different 
for even and odd is not noticeable however odd is higher than even.

#Task 5 

In this question we are trying to find the trend or relation between prime 
numbers with its parity in collatz sequence. To analyse the data and to look 
for the trend sort out the prime numbers from collatz_df, by creating a function 
to sort out the prime numbers. After running the code we found out after the 
number 2 all of the prime number's parity is odd. Only prime number 2 has even 
parity. After analysing the table again, we found out the there is alot of 
repeating maximum value, such as the number 52 and 9232. But in the table number 
9232 keeps popping up. In visualisation the collatz conjecture the connecting 
lines will mostly go to number 9232. When arranging the collatz conjecture 
diagram just like in the assignment page ( The circle diagram for collatz 
conjecture ) there will be many numbers connected to the number 9232 where as 
the maximum value always pops up the number 9232.

#Task 6

For part 1 we use geom_line for the sequence length change over a range of 
starting integer with sequence length in the x-axis and starting in the y-axis.
In part 2 we use the histogram graph to find the fastest sequence to reach 1 
when they first reached a value less than their starting integer. Part 3 we use 
a bar chart graph to find the common specific number appearing in the sequence 
with frequency in the x-axis and specific number in the y-axis.