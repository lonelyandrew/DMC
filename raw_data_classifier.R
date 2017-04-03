setwd("~/Codes/Github/DMC/")

people <- read.csv('data/people.csv', header = TRUE)
train <- read.csv('data/act_train.csv', header = TRUE)

people.train.merged <- merge(train, people, by = 'people_id')

people.train.merged.type1 <- people.train.merged[people.train.merged['activity_category'] == 'type 1',]
people.train.merged.type.not1 <- people.train.merged[people.train.merged['activity_category'] != 'type 1',]

people.train.merged.type.not1[,5:13] <- NULL
people.train.merged.type1[14] <- NULL
