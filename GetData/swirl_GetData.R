###In this lesson, you'll learn how to manipulate data using dplyr. dplyr is a fast and powerful R package written
#| by Hadley Wickham and Romain Francois that provides a consistent and concise grammar for manipulating tabular
#| data.
library(dplyr)
# to know the package version
print(packageVersion("dplyr"))
path2csv <- "/Library/Frameworks/R.framework/Versions/3.2/Resources/library/swirl/Courses/Getting_and_Cleaning_Data/Manipulating_Data_with_dplyr/2014-07-08.csv"
mydf <- read.csv(path2csv, stringsAsFactors = FALSE)

#The first step of working with data in dplyr is to load the data into what the package authors call a 'data frame tbl' or 'tbl_df'. Use the following code to create a new tbl_df called cran:
cran <- tbl_df(mydf)

#To avoid confusion and keep things running smoothly, let's remove the original data frame from your workspace with rm("mydf").
rm("mydf")


## According to the "Introduction to dplyr" vignette written by the package authors, "The dplyr philosophy is to
# have small functions that each do one thing well." Specifically, dplyr supplies five 'verbs' that cover most
# fundamental data manipulation tasks: select(), filter(), arrange(), mutate(), and summarize().

### Select ####
#As may often be the case, particularly with larger datasets, we are only interested in some of the variables.
# Use select(cran, ip_id, package, country) to select only the ip_id, package, and country variables from the
# cran dataset.
select(cran, ip_id, package, country)
# Normally, this notation is reserved for numbers, but select() allows you to specify a sequence of columns this
# way, which can save a bunch of typing. Use select(cran, r_arch:country) to select all columns starting from
# r_arch and ending with country.
select(cran, r_arch:country)
# We can also select the same columns in reverse order. Give it a try.
select(cran, country:r_arch)

##Instead of specifying the columns we want to keep, we can also specify the columns we want to throw
#away. To see how this works, do select(cran, -time) to omit the time column.
select(cran, -time)


##We can also request rows for which EITHER one condition OR another condition are TRUE.
# For example, filter(cran, country == "US" | country == "IN") will gives us all rows for which the
# country variable equals either "US" or "IN". Give it a go.
filter(cran, country == "US" | country == "IN")

##Finally, we want to get only the rows for which the r_version is not missing. R represents missing
# values with NA and these missing values can be detected using the is.na() function.
filter(cran, !is.na(r_version))


cran2 <- select(cran, size:ip_id)
## Arrange cran2 by the following three variables, in this order: country (ascending), r_version (descending), and ip_id (ascending).
arrange(cran2, country, desc(r_version), ip_id)

## To illustrate the next major function in dplyr, let's take another subset of our original data. Use select() to grab 3 columns
# from cran -- ip_id, package, and size (in that order) -- and store the result in a new variable called cran3.
cran3 <- select(cran, ip_id, package, size)

## It's common to create a new variable based on the value of one or more variables already in a dataset. The mutate() function does
# exactly this.

#The size variable represents the download size in bytes, which are units of computer memory. These days, megabytes (MB) are a more
# common unit of measurement. One megabyte is equal to 2^20 bytes. That's 2 to the power of 20, which is approximately one million
# bytes!

#We want to add a column called size_mb that contains the download size in megabytes. Here's the code to do it:

mutate(cran3, size_mb = size / 2^20)

## One very nice feature of mutate() is that you can use the value computed for your second column (size_mb) to create a third
# column, all in the same line of code. To see this in action, repeat the exact same command as above, except add a third argument
# creating a column that is named size_gb and equal to size_mb / 2^10.
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)

##Let's try one more for practice. Pretend we discovered a glitch in the system that provided the original values for the size
# variable. All of the values in cran3 are 1000 bytes less than they should be. Using cran3, create just one new column called
# correct_size that contains the correct size.
mutate(cran3, correct_size =  size + 1000)

## The last of the five core dplyr verbs, summarize(), collapses the dataset to a single row. Let's say we're interested in knowing
# the average download size. summarize(cran, avg_bytes = mean(size)) will yield the mean value of the size variable. Here we've
# chosen to label the result 'avg_bytes', but we could have named it anything. Give it a try.
summarize(cran, avg_bytes = mean(size))

## That's not particularly interesting. summarize() is most useful when working with data that has been grouped by the values of a
# particular variable.

## We'll look at grouped data in the next lesson, but the idea is that summarize() can give you the requested value FOR EACH group in
# your dataset.

## In this lesson, you learned how to manipulate data using dplyr's five main functions. In the next lesson, we'll look at how to
# take advantage of some other useful features of dplyr to make your life as a data analyst much easier.

#### Grouping Data ####

## In the last lesson, you learned about the five main data manipulation 'verbs' in dplyr: select(), filter(), arrange(), mutate(),
# and summarize(). The last of these, summarize(), is most powerful when applied to grouped data.

## The main idea behind grouping data is that you want to break up your dataset into groups of rows based on the values of one or
# more variables. The group_by() function is reponsible for doing this.

##Our first goal is to group the data by package name. Bring up the help file for group_by().
#Group cran by the package variable and store the result in a new variable called by_package.
by_package <- group_by(cran, package)

## At the top of the output above, you'll see 'Groups: package', which tells us that this tbl has been grouped by the package
# variable. Everything else looks the same, but now any operation we apply to the grouped data will take place on a per package
# basis.

## Recall that when we applied mean(size) to the original tbl_df via summarize(), it returned a single number -- the mean of all
# values in the size column. We may care about what that number is, but wouldn't it be so much more interesting to look at the mean
# download size for each unique package?

#That's exactly what you'll get if you use summarize() to apply mean(size) to the grouped data in by_package. Give it a shot.

summarise(by_package, mean(size))
#Instead of returning a single value, summarize() now returns the mean size for EACH package in our dataset.


# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# A few thing to be careful of:
#
# 1. Separate arguments by commas
# 2. Make sure you have a closing parenthesis
# 3. Check your spelling!
# 4. Store the result in pack_sum (for 'package summary')
#
# You should also take a look at ?n and ?n_distinct, so
# that you really understand what is going on.

pack_sum <- summarize(by_package, count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size)) 

## The 'count' column, created with n(), contains the total number of rows (i.e. downloads) for each package. The 'unique' column,
# created with n_distinct(ip_id), gives the total number of unique downloads for each package, as measured by the number of distinct
# ip_id's. The 'countries' column, created with n_distinct(country), provides the number of countries in which each package was
# downloaded. And finally, the 'avg_bytes' column, created with mean(size), contains the mean download size (in bytes) for each
# package.


## Naturally, we'd like to know which packages were most popular on the day these data were collected (July 8, 2014). Let's start by
# isolating the top 1% of packages, based on the total number of downloads as measured by the 'count' column.

# We need to know the value of 'count' that splits the data into the top 1% and bottom 99% of packages based on total downloads. In
# statistics, this is called the 0.99, or 99%, sample quantile. Use quantile(pack_sum$count, probs = 0.99) to determine this number.

 quantile(pack_sum$count, probs = 0.99)
#99% 
#679.56 

# Now we can isolate only those packages which had more than 679 total downloads. Use filter() to select all rows from pack_sum for
# which 'count' is strictly greater (>) than 679. Store the result in a new variable called top_counts.
 
top_counts <- filter(pack_sum, count > 679)
 
# arrange() the rows of top_counts based on the 'count' column and assign the result to a new variable called top_counts_sorted. We
# want the packages with the highest number of downloads at the top, which means we want 'count' to be in descending order. If you
# need help, check out ?arrange and/or ?desc.

print(top_counts)

# There are only 61 packages in our top 1%, so we'd like to see all of them. Since dplyr only shows us the first 10 rows, we can use
# the View() function to see more.

View(top_counts)

## arrange() the rows of top_counts based on the 'count' column and assign the result to a new variable called top_counts_sorted. We
# want the packages with the highest number of downloads at the top, which means we want 'count' to be in descending order. If you
# need help, check out ?arrange and/or ?desc.

# top_counts_sorted <- arrange(top_counts, desc(count))

# Keep working like that and you'll get there!

# Now use View() again to see all 61 rows of top_counts_sorted.

View(top_counts_sorted)

##If we use total number of downloads as our metric for popularity, then the above output shows us the most popular packages
# downloaded from the RStudio CRAN mirror on July 8, 2014. Not surprisingly, ggplot2 leads the pack with 4602 downloads, followed by
# Rcpp, plyr, rJava, ....



## Perhaps we're more interested in the number of *unique* downloads on this particular day. In other words, if a package is
# downloaded ten times in one day from the same computer, we may wish to count that as only one download. That's what the 'unique'
# column will tell us.
#Like we did with 'count', let's find the 0.99, or 99%, quantile for the 'unique' variable with quantile(pack_sum$unique, probs =
# 0.99).
uantile(pack_sum$unique, probs = 0.99)
#99% 
#465 

##Apply filter() to pack_sum to select all rows corresponding to values of 'unique' that are strictly greater than 465. Assign the
# result to a variable called top_unique.
top_unique <- filter(pack_sum, unique > 465)
View(top_unique)


## Now arrange() top_unique by the 'unique' column, in descending order, to see which packages were downloaded from the greatest
# number of unique IP addresses. Assign the result to top_unique_sorted.

top_unique_sorted <- arrange(top_unique, desc(unique))

View(top_unique_sorted)
# Now Rcpp is in the lead, followed by stringr, digest, plyr, and ggplot2. swirl moved up a few spaces to number 40, with 698 unique
# downloads. Nice!

## Our final metric of popularity is the number of distinct countries from which each package was downloaded. We'll approach this one
# a little differently to introduce you to a method called 'chaining' (or 'piping').


# Don't change any of the code below. Just type submit()
# when you think you understand it.

# We've already done this part, but we're repeating it
# here for clarity.

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)

## It's worth noting that we sorted primarily by country, but used avg_bytes (in ascending order) as a tie breaker. This means that
# if two packages were downloaded from the same number of countries, the package with a smaller average download size received a
# higher ranking.


## We'd like to accomplish the same result as the last script, but avoid saving our intermediate results. This requires embedding
# function calls within one another.
# That's exactly what we've done in this script. The result is equivalent, but the code is much less readable and some of the
# arguments are far away from the function to which they belong. Again, just try to understand what is going on here, then submit()
# when you are ready to see a better solution.



# Don't change any of the code below. Just type submit()
# when you think you understand it. If you find it
# confusing, you're absolutely right!

result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)


## In this script, we've used a special chaining operator, %>%, which was originally introduced in the magrittr R package and has now
# become a key component of dplyr. You can pull up the related documentation with ?chain. The benefit of %>% is that it allows us to
# chain the function calls in a linear fashion. The code to the right of %>% operates on the result from the code to the left of
# %>%.
# Once again, just try to understand the code, then type submit() to continue.

### summarize4.R###

# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)

## So, the results of the last three scripts are all identical. But, the third script provides a convenient and concise alternative
# to the more traditional method that we've taken previously, which involves saving results as we go along.


##### To help drive the point home, let's work through a few more examples of chaining. ####

# select() the following columns from cran. Keep in mind
# that when you're using the chaining operator, you don't
# need to specify the name of the data tbl in your call to
# select().
#
# 1. ip_id
# 2. country
# 3. package
# 4. size
#
# The call to print() at the end of the chain is optional,
# but necessary if you want your results printed to the
# console. Note that since there are no additional arguments
# to print(), you can leave off the parentheses after
# the function name. This is a convenient feature of the %>%
# operator.

### chain1.R ###
cran %>%
  select(ip_id, country, package, size) %>%
  print

### chain2.R ###
# Use mutate() to add a column called size_mb that contains
# the size of each download in megabytes (i.e. size / 2^20).
#
# If you want your results printed to the console, add
# print to the end of your chain.
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  print

### chain3.R ####
# Use filter() to select all rows for which size_mb is
# less than or equal to (<=) 0.5.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  print

### Chain4.R ###
# arrange() the result by size_mb, in descending order.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb))
# Your call to arrange() goes here






