# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
v <- paste("Employee",1:100)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
sal<-runif(100,40000,50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
adj<-runif(100,-5000,10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(v,sal,adj,stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$sal2018 <- salaries$sal+salaries$adj

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise <- salaries$adj >0

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
print(salaries[salaries$v == "Employee 57","sal2018"])

# How many employees got a raise?
print(nrow(salaries[salaries$raise == TRUE,]))

# What was the dollar value of the highest raise?
print(salaries[salaries$adj == max(salaries$adj),'adj'])

# What was the "name" of the employee who received the highest raise?

print(salaries[salaries$adj == max(salaries$adj),'v'])
# What was the largest decrease in salaries between the two years?
print(salaries[salaries$adj == min(salaries$adj),'adj'])

# What was the name of the employee who recieved largest decrease in salary?
print(salaries[salaries$adj == min(salaries$adj),'v'])

# What was the average salary change?
print(mean(salaries$adj))

# For people who did not get a raise, how much money did they lose on average?
print(mean(salaries[!salaries$raise,"adj"]))

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
#YES
# Write a .csv file of your salary data to your working directory
write.csv(salaries,"salaries.csv")
