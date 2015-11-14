# Dynamic Programming Python implementation of Coin Change problem

# Quick Explanation of how the code works:

# S is the set of all coins that we are given
# m is the length of S
# n is the value that we are searching for

# We know that count(S, m, n) = count(Set[:-1], m-1, n) + count(Set, m, n - Set[-1])

# ^ The above statement means that any count(S,m,n) is defined by the sum of [count() where we use the
# last element at least once, and a count() where we do NOT use the last element].

def count(S, m, n):
    # We need n+1 rows as the table is consturcted in bottom up
    # manner using the base case 0 value case (n = 0)
    table = [[0 for x in range(m)] for x in range(n+1)]
 
    # Fill the entries for 0 value case (n = 0)
    for i in range(m):
        table[0][i] = 1


    print table
    
    # Fill rest of the table enteries in bottom up manner
    for i in range(1, n+1):
        for j in range(m):
            # Count of solutions including S[j]
            x = table[i - S[j]][j] if i-S[j] >= 0 else 0
 
            # Count of solutions excluding S[j]
            y = table[i][j-1] if j >= 1 else 0
 
            # total count
            table[i][j] = x + y
        print table
 
    return table[n][m-1]
 
# Driver program to test above function
arr = [1, 3, 5]
m = len(arr)
n = 10
print(count(arr, m, n))
