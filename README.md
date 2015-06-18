# Getting and Cleaning Data
******
Konstantinos Koumoundouros

## Overview
This repo is created for the Getting and Cleaning Data Course Project submission provided by coursera/ Johns Hopkins University.

All information about data set that used: [Human Activity Recognition Using. Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Course Project

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Files

All three files are requested for the project

* ```run_analysis.R``` Contains all the code that is needed for the above four (4) steps.

* ```Tidy.txt``` The output of the 5th step.

* ```CodeBook.md``` Describes the variables, the data, and any transformations or work that took place to clean up the data.

In order to work properly the R script ```run_analysis.R``` the data set must be unzipped and set working directory of R studio  in ```./UCI HAR Dataset/UCI HAR Dataset```