#BASIC EDA 
#Set working directory
setwd('C:\\Users\\CAROLINE MACHARIA\\Desktop\\R Programming\\Titanic Dataset')

#Read file
titanic_train = read.csv('train.csv')

#First 6 rows
head(titanic_train)

#Last 6 rows
tail(titanic_train)

#Basic summary of the dataset
summary(titanic_train)

#checking data class of every column
sapply(titanic_train, class)

#Survived class is integer and sex is character. For a good summary the classes 
#need to be changed
titanic_train$Survived = as.factor(titanic_train$Survived)
titanic_train$Sex = as.factor(titanic_train$Sex)

#Run sapply again
sapply(titanic_train, class)

#Run summary again
summary(titanic_train)

#Preparing Data
is.na(titanic_train)
sum(is.na(titanic_train))

titanic_train_dropedna = titanic_train[rowSums(is.na(titanic_train)) <= 0,]

#Separating Survivors and Non-Survivors
titanic_survivor = titanic_train_dropedna[titanic_train_dropedna$Survived == 1,]
titanic_nonsurvivor = titanic_train_dropedna[titanic_train_dropedna$Survived == 0,]

#PLOTTING
#Bar graph
barplot(table(titanic_survivor$Sex))
barplot(table(titanic_nonsurvivor$Sex))

#Histogram
hist(titanic_survivor$Age)
hist(titanic_nonsurvivor$Age)

hist(titanic_survivor$SibSp)
hist(titanic_nonsurvivor$SibSp)

