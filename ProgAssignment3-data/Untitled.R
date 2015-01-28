df <- data.frame(Name = c("A", "B", "C", "D", "E"), 
                 Amount = c(150, 120, 175, 160, 120))

df[which.min(df$Amount), ]
#   Name Amount
# 2    B    120

df[which(df$Amount == min(df$Amount)), ]
#   Name Amount
# 2    B    120
# 5    E    120
#Edit: If there are NAs in the Amount column you can do:
  
df[which(df$Amount == min(df$Amount, na.rm = TRUE)), ]