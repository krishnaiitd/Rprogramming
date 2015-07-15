df <- read.csv("hw1_data.csv")
# Q11
print('Q.11, Ans:');
print(names(df))
# Q12
print('Q.12, Ans:');
print(df[1:2,])

# Q13
print('Q.13, Ans:')
print(nrow(df))

# Q14
print('Q.14, Ans:')
totalRow = nrow(df);
print(df[totalRow-1:0,])


# 15
print('Q.15, Ans:');
print(df$Ozone[47])

# 16
print('Q.16, Ans:');
ozone <- df$Ozone
is.na(ozone)
print(sum(is.na(ozone)))

# 17
print('Q.17, Ans:');
print(mean(df$Ozone, na.rm = TRUE));

# 18
#  Extract the subset of rows of the data frame 
#   where Ozone values are above 31 and 
#   Temp values are above 90. What is the mean of Solar.R 
#   in this subset?
data18 <-  df[df$Ozone > 31 & df$Temp > 90, ];
print('Q.18, Ans:');
print(mean(data18$Solar.R, na.rm =  TRUE));

# Q.19: What is the mean of "Temp" when "Month" is equal to 6? 
data19 <- df[df$Month == 6, ]
print('Q.19, Ans:');
print(mean(data19$Temp, na.rm = TRUE))

# Question 20
# What was the maximum ozone value in the month of May (i.e. Month = 5)?
print('Q.20, Ans:');
data20 <- df[df$Month == 5, ]
print(max(data20$Ozone, na.rm = TRUE))
