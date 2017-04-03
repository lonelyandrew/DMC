# Set working directory

setwd("~/Codes/Github/DMC/")
# Exploratory Data Analysis

# Import csv data.

# Import people.csv.
people <- read.csv('data/people.csv', header = TRUE)

# Check how many people(rows) are in the dataset people.
nrow(people)

# Chekc how many features(columns) are in the dataset people.
length(people)

# Or we can check the dim of the dataset people.
dim(people)

# Show all features.
names(people)

# Show data types of all columns of dataset people.
sapply(people, class)

# Show heads of dataset people.
head(people)

# Check if there are NA values in dataset people. The answer is FALSE.
anyNA(people)

# Check how many types of value in each characteristic among the whole dataset.

# people$group_1
length(table(people$group_1))

# people$char_1
people.char_1.table <- table(people$char_1)
barplot(people.char_1.table)

# Conclusion: there are two types of data in the field people$char_1,
# the count of type1 data is 15251,
# the count of type2 data is 173867,
# the type2 data is significantlly over the type1 data (more than ten times)

# people$char_2
people.char_2.table <- table(people$char_2)
barplot(people.char_2.table)

people.char1.type1 = which(people$char_1 == 'type 1')
people.char2.type1 = which(people$char_2 == 'type 1')

# We can see that all value in the comparison result is TRUE,
# so we can get the conclusion that char_2 is a variation of
# the char_1, all type 1 data in the char_1 data is the same set
# in the char_2, but the type 2 data in the char_2 data is
# expanded into the type 2 and type 3 data.
all(people.char1.type1 == people.char2.type1)

# Remove the people$char_1.
people$char_1 <- NULL

# people$char_3
people.char_3.table <- sort(table(people$char_3), decreasing = TRUE)
barplot(people.char_3.table)

# people$char_4
people.char_4.table <- sort(table(people$char_4), decreasing = TRUE)
barplot(people.char_4.table)

# people$char_5
people.char_5.table <- sort(table(people$char_5), decreasing = TRUE)
barplot(people.char_5.table)

# people$char_6
people.char_6.table <- sort(table(people$char_6), decreasing = TRUE)
barplot(people.char_6.table)

# Import act_train.csv.
train <- read.csv('data/act_train.csv', header = TRUE)

train.char1.table <- sort(table(train$char_1), decreasing = TRUE)
barplot(train.char1.table)

train.char2.table <- sort(table(train$char_2), decreasing = TRUE)
barplot(train.char2.table)

train.char3.table <- sort(table(train$char_3), decreasing = TRUE)
barplot(train.char3.table)

train.activity_cat <- table(train$activity_category)
train.activity_cat

train.activity.type1 <- train[train['activity_category'] == 'type 1',]
train.activity.type1$char_10 <- NULL
train.activity.type1$activity_category <- NULL

train.activity.type.other <- train[train['activity_category'] != 'type 1',]

test <- train.activity.type.other[,]
test == train.activity.type.other
.Internal(inspect(test))
tracemem(train.activity.type.other)
untracemem(train.activity.type.other)
library(data.table)
library(dplyr)
library(ggplot2)
library(knitr)
kable(sample_n(train, 4))
kable(str(train))

train %>% 
    count(outcome) %>% 
    ggplot(aes(x = outcome, y = n)) +
    geom_bar(stat = "identity", width = 0.6, fill = "light blue") +
    ggtitle("Outcomes")

train %>% 
    ggplot(aes(x = outcome, fill = activity_category)) +
    geom_bar(width = 0.6, position = "fill") +
    ggtitle("Outcome by activity category")

