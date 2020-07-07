## How to start this project_ getting and cleaning data
Download source data as a zip file and unzip it to working directory of RStudio 

It is OK if the files were downloaded onto other folder (e.g. your desktop), not the same with RStudio folder. 

then you have to change the working directory instead (e.g. changing the current working to Desktop instead (e.g. using setwd("~/Desktop"))


## The source data (copy link from the Getting and Cleaning Data Course Project)
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## About R code: run_analysis.R
The library(plyr) should be existed or be installed into your RStudio before run or test the code
The code includes following steps
  1. Reading and assign var. names for all data sets: train and test data
  Var. manes for train data: xtrain, ytrain and subtrain
  Var. manes for test data: xtest, ytest and subtest
    Reading and assign var. manes for feature file and activity labels
  Var. mane for feature and activity labels: var_feature and act_labels
  2. Merge data into single sones (e.g. my_x, my_y and my_sub) using rbind function
    my_x: 10299 obs. of 66 var. 
    my_y: 10299 obs. of 2 var col. (activity and actlabel with 6 levels)
    my_sub: 10299 obs. of 1 var.
    
  3. Extract the required data values (mean and std) and assign col. manes 
    For x variable:
      create vector for defining data with "mean and std labels"
      extract all selected values and assigned with the same mane my_x
      label my_x data table with 
