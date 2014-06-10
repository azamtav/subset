# Subset

You will be given a data file. The first line of the data file will have a target price. The following lines contain a menu of dishes.

Write a program to read in the data file and find any combination of dishes that add up exactly to the target price specified on the first line of the data file. If there is no solution, your program should specify that there is no combination of dishes that will be equal in cost to the target price.

## Assumptions
* The menu can have duplicate priced items
* The menu items will all be greater than $0
* The total price will be greater than or equal to $0

## Solution
The solution I devised for the problem begins by creating an array of the menu items prices, removes any items that are priced higher than the sum, and then sorts the items in descending order of price.

The algorithm tries to solve the problem as quickly as possible. It first checks to see if any individual item adds up to the total sum. If it finds one, it returns that item. If not, it checks all the possible combinations by adding an item to an array of options and adding the combination of that item with all the previous options before it.
