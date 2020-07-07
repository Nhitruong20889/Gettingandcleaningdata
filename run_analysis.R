

## download data files as folder "UCI HAR Dataset" 
## on the Desktop directory or your own ref. location

## Read and assign var. for train and test data
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## read data description/features
var_feature <- read.table("UCI HAR Dataset/features.txt")

## read activity labels
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merge/combine train and test data into one dataset/each type
my_x <-rbind(xtrain,xtest)
my_y <-rbind(ytrain, ytest)
my_sub <-rbind(subtrain,subtest)

## Extract only measurements on the mean+std for each measurements
select_var <-var_feature[grep("mean(\\)|std(\\)", var_feature[ ,2]), ]
my_x <-my_x[ , select_var[ ,1]]
colnames(my_x)<-var_feature[select_var[ ,1] ,2]

## Name the activities in the data set using descriptive activity names
colnames(my_y)<-"activity"
my_y$actlabel <- factor(my_y$activity, labels = as.character(act_labels[ ,2]))
actlabel <-my_y[ ,-1]

##tidy data set with avg of each var. for each activity and each subject
colnames(my_sub) <-"subject"
mydt <-cbind (my_x, actlabel, my_sub)
mydt_avg <-mydt %>% group_by(actlabel, subject) %>% summarize_each(funs(mean))

## write and save new data set under the same folder of orginal data files
## and  with name as tidydata.txt
write.table(mydt_avg, file = "./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)



