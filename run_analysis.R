# Getting and Cleaning Data Course Project

# Steps:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#######################            Step 1 | START |        #############################

# Read (load) txt files from defualt working directory that are in.

    # Train Data
    trainX = read.table("./train/X_train.txt")
    trainY = read.table("./train/y_train.txt")
    trainS = read.table("./train/subject_train.txt")

    # Test Data
    testX = read.table("./test/X_test.txt")
    testY = read.table("./test/y_test.txt")
    testS = read.table("./test/subject_test.txt")

    # other txt
    features = read.table("./features.txt")
    activity = read.table("./activity_labels.txt")

# changing column names (variable names)
    
    # Train Data
    colnames(trainX) = features[,2] 
    colnames(trainY) = "ActivityId"
    colnames(trainS) = "SubjectId"
    
    # Test Data
    colnames(testX) = features[,2] 
    colnames(testY) = "ActivityId"
    colnames(testS) = "SubjectId"
    
    # other txt
    colnames(activity) = c('ActivityId','ActivityType')

# Bind tables to create final table for each data (train, test) and then create final table.

    # Create final tables for train & test
    trainData <- cbind(trainX, trainY, trainS)
    testData <- cbind(testX, testY, testS)

    # Create final table (by bine trainData & testData)
    finalData <- rbind(trainData, testData)

# remove temporary "objects" for the next steps
    rm(trainX)
    rm(trainY)
    rm(trainS)
    rm(testX)
    rm(testY)
    rm(testS)
    rm(features)
    rm(trainData)
    rm(testData)


#######################            Step 2 | START |        #############################

#  select the colomuns names  
    colNames <- names(finalData)
# search column position that consits the name "ActivityId"
    n <- grep("ActivityId", colNames) 
# search columns position that consits the name "mean"    
    nn <- grep("mean()", colNames) 
# search columns position that consits the name "std"
    nnn <- grep("std()", colNames)
# create temporary tables with the columns
    datan <- finalData[n]
    datann <- finalData[nn]
    datannn <- finalData[nnn]

# create final table with the results above
    finalData <- cbind(datan, datann, datannn)

# remove temporary "objects" for the next steps
    rm(colNames)
    rm(n)
    rm(nn)
    rm(nnn)
    rm(datan)
    rm(datann)
    rm(datannn)

    
#######################            Step 3 | START |        #############################
   
    finalData <- merge(finalData, activity, by='ActivityId',all.x=TRUE)

# remove temporary "objects" for the next steps
    rm(activity)
   

#######################            Step 4 | START |        #############################
    
# find and replace bud strings in label names     
    names(finalData) <- gsub("Acc", "Accelerator", names(finalData))
    names(finalData) <- gsub("Mag", "Magnitude", names(finalData))
    names(finalData) <- gsub("Gyro", "Gyroscope", names(finalData))
    names(finalData) <- gsub("^t", "time", names(finalData))
    names(finalData) <- gsub("^f", "frequency", names(finalData))
    
    
#######################            Step 5 | START |        #############################
   
    Temp <- data.table(finalData)
    
# calculate the mean of every column broken down by ActivityType 
    Tidy <-Temp[, lapply(.SD, mean), by = 'ActivityType']
    write.table(Tidy, file = "Tidy.txt", row.names = FALSE)    
    
    rm(Temp)
    
    