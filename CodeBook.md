# Getting and Cleaning Data
******
Konstantinos Koumoundouros

## Code 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> General Observation: My experience in data manipulation has learn me to use temporary tables for better controlling (although is more costly). I am creating in every step temporary tables that in the end (before next step) i drop them.

The R script ```run_analysis.R``` contains the code for the 5 requested steps:

* Step1:
    * Using ```read.table``` loads in temporary tables the train, test, features & activity data sets.
    
    * Using ```colnames()``` renaming the name of columns with the proper names.
    
    * Using ```cbind()``` bind the same data sets (all txt files for train) & (all txt files for test).
    
    * Using ```rbind``` bind the two data set in one table (train data set & test data set).
    
    * Using ```rm()``` remove any temporary table that used for the transformations.

* Step2:
    * Using ```grep()``` searching in column names and store them in temporary tables (the column position) the columns that contains "ActivityId", "mean()" & "std()".
    
    * Using ```cbind()``` create a final table that contains the measurements on the mean and standard deviation for each measurement (+ ActivityId).
    
    * Using ```rm()``` remove any temporary table that used for the transformations.

* Step3:
    * Using ```merge()``` to give descriptive activity names (from "activity_labels.txt") to name the activities in the data set.       
    
* Step4:
    * Using ```gsub()``` to give appropriately labels the data set with descriptive variable names.          
    
* Step5:
    * Using ```lapply()``` calculate the average of each variable for each activity.
    
    * Using ```write.table()``` output the tidy data set in txt file in default working directory "Tidy.txt".
    
    * Using ```rm()``` remove any temporary table that used for the transformations.

## Variables
******
>First steps.

* ```trainX```, ```trainY```, ```trainS``` contains tha data for *train* data set.

* ```testX```, ```testY```, ```testS``` contains the data from *test* data set.

* ```features``` contains the correct columns names.

* ```activity``` contains the activity data set.

* ```trainData``` contains the merge data from alla *train* txt files.

* ```testData``` contains the merge data from alla *test* txt files.

* ```finalData``` contains the merge data from *train* & *test* data sets.

* ```colNames``` contains the column names of *finalData*


>Selecting only the measurements on the mean and standard deviation for each measurement.

* ```n``` contains the column position with tha name ActivityId from *finalData*.

* ```nn``` contains the columns positions that in the name has the string "mean()" from *finalData*.

* ```nnn``` contains the columns positions that in the name has the string "std()" from *finalData*. 

* ```datan``` contains tha data ActivityId from *finalData*.

* ```datann``` contains tha data with "mean()" from *finalData*.

*  ```datannn``` contains tha data with "std()" from *finalData*.

*  ```finalData``` contains the final merged data.

>Final Steps.

* ```Temp``` contains the final data.

* ```Tidy``` contains the final data of project with the average of each variable for each activity.

 