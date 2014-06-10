# Subset Menu

You will be given a data file. The first line of the data file will have a target price. The following lines contain a menu of dishes.

Write a program to read in the data file and find any combination of dishes that add up exactly to the target price specified on the first line of the data file. If there is no solution, your program should specify that there is no combination of dishes that will be equal in cost to the target price.

## Assumptions
* The menu can have duplicate priced items
* The menu items will all be greater than $0
* The total price will be greater than or equal to $0

## Solution
The solution I devised for the problem begins by reading the file and creating an array of the menu items and their prices. Next it uses the class `Subset` to create an array of possible combinations  by removing any items that are priced higher than the sum and sorting the items in descending order of price. These combinations are stored using the `Node` class which automatically generates a sum when it is instantiated.

The `findSubset` function of the class `Subset` finds the first combination of items that adds to the total sum. If the sum is 0 or the set is empty, it will return nil. Otherwise, it will first check to see if any individual item by itself equals the total, and if so, it will return that. If that doesn't find a match, then it will start to build all possible combinations from the original set and test those solutions. It does so by inserting the first item into an options array. Next it tries the next item in the set as well as the combination of  that and all previous items in the options array. For example:

```
subset = [1,2,3]

Iteration 1:
options = [[1]]

Iteration 2:
options = [[1], [2], [2, 1]]

Iteration 3:
options = [[1], [2], [2,1], [3], [3,1], [3,2], [3,2,1]]
```

If any of these combinations in the options array are greater than the sum, then it doesn't add it into the array. This prevents checking any future combinations using that set since it's already greater than the sum.

If no subsets are found, then it return nil.

## Execution
`ruby subsetFinder.rb menus/menu.txt`

## Tests
I wrote a number of tests in RSpec to test out my classes. They are in the spec folder and were tested using RSpec version 3.0.0.

`rspec spec`
