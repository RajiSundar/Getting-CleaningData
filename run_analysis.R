## R script called run_analysis.R that does the following. 
##    Merges the training and the test sets to create one data set.
##    Extracts only the measurements on the mean and standard deviation for each measurement. 
##    Uses descriptive activity names to name the activities in the data set
##    Appropriately labels the data set with descriptive variable names. 
##    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##   **************************************************************************************************************************************************************

## Function that takes in the main dataset, subject data and activity data, cleans and produces train & test datasets

makeTidy <- function(dtfr, subj, act, retDf)
    {   ## Read in the train data
        df <- read.table(dtfr)
        dim(df)
        library(dplyr)
        ## Extract only the required columns
        df <- select(df, 1:6,41:46,81:86,121:126,161:166,201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 294:296, 345:350
               , 373:375, 424:429, 452:454, 503:504, 513, 516:517, 526, 529:530, 539, 542:543, 552, 555:561)
        dim(df)
  
        ## Rename the variables using a labels vector to create a tidy dataset
        labels <- c("T..BodyAccel..Mean_X", "T..BodyAccel..Mean_Y", "T..BodyAccel..Mean_Z","T..BodyAccel..Std_X",
              "T..BodyAccel..Std_Y","T..BodyAccel..Std_Z", "T..GravityAccel..Mean_X","T..GravityAccel..Mean_Y",
              "T..GravityAccel..Mean_Z","T..GravityAccel..Std_X","T..GravityAccel..Std_Y","T..GravityAccel..Std_Z",
              "T..BodyAccelJerk..Mean_X","T..BodyAccelJerk..Mean_Y","T..BodyAccelJerk..Mean_Z","T..BodyAccelJerk..Std_X",
              "T..BodyAccelJerk..Std_Y","T..BodyAccelJerk..Std_Z","T..BodyGyro..Mean_X","T..BodyGyro..Mean_Y",
              "T..BodyGyro..Mean_Z","T..BodyGyro..Std_X","T..BodyGyro..Std_Y","T..BodyGyro..Std_Z","T..BodyGyroJerk..Mean_X",
              "T..BodyGyroJerk..Mean_Y","T..BodyGyroJerk..Mean_Z","T..BodyGyroJerk..Std_X","T..BodyGyroJerk..Std_Y",
              "T..BodyGyroJerk..Std_Z","T..BodyAccelMag..Mean","T..BodyAccelMag..Std","T..GravityAccelMag_Mean",
              "T..GravityAccelMag_Std","T..BodyAccelJerkMag_Mean","T..BodyAccelJerkMag_Std","T..BodyGyroMag_Mean",
              "T..BodyGyroMag_Std","T..BodyGyroJerkMag_Mean","T..BodyGyroJerkMag_Std","F..BodyAccel..Mean_X",
              "F..BodyAccel..Mean_Y","F..BodyAccel..Mean_Z","F..BodyAccel..Std_X","F..BodyAccel..Std_Y","F..BodyAccel..Std_Z",
              "F..BodyAccelMeanFreq_X","F..BodyAccelMeanFreq_Y","F..BodyAccelMeanFre_Z","F..BodyAccelJerk..Mean_X",
              "F..BodyAccelJerk..Mean_Y","F..BodyAccelJerk..Mean_Z","F..BodyAccelJerk..Std_X","F..BodyAccelJerk..td_Y",
              "F..BodyAccelJerk..Std_Z","F..BodyAccelJerkMeanFreq_X","F..BodyAccelJerkMeanFreq_Y","F..BodyAccelJerkMeanFreq_Z",
              "F..BodyGyro..Mean_X","F..BodyGyro..Mean_Y","F..BodyGyro..Mean_Z","F..BodyGyro..Std_X","F..BodyGyro..Std_Y",
              "F..BodyGyro..Std_Z","F..BodyGyroMeanFreq_X","F..BodyGyroMeanFreq_Y","F..BodyGyroMeanFreq_Z","F..BodyAccelMag..Mean",
              "F..BodyAccelMag..Std","F..BodyAccelMagMeanFreq","F..BodyAccelJerkMag_Mean","F..BodyAccelJerkMag_Std",
              "F..BodyAccelJerkMagMeanFreq","F..BodyGyroMag_Mean","F..BodyGyroMag_Std","F..BodyGyroMagMeanFreq","F..BodyGyroJerkMag_Mean",
              "F..BodyGyroJerkMag_Std","F..BodyGyroJerkMagMeanFreq","AngleTBodyAccMean_gravity","AngleTBodyAccJerkMean_gravityMean",
              "AngleTBodyGyroMean_gravityMean","AngleTBodyGyroJerkMean_gravityMean","Angle_X_gravityMean","Angle_Y_gravityMean","Angle_Z_gravityMean" )
        colnames(df) <- labels
  
  
        ## Read in subject data and give its column a proper label
        
        sub <- read.table(subj)
        sub <-dplyr:: rename(sub, Subject=V1)
  
        ## Read in activity data
        act <- read.table(act)
        act <- data.frame(act)
        dim(act)
  
         ## Make a new column with activity labels
         act$Activity<-ifelse(act$V1==1,"Walking",
                       ifelse(act$V1==2,"Walking_upstairs",
                            ifelse(act$V1==3,"Walking_downstairs",
                                ifelse(act$V1==4,"Sitting",
                                    ifelse(act$V1==5,"Standing",
                                          ifelse(act$V1==6,"Laying","Not_Valid"))))))
  
         ## Rename column for activity_code, V1 to act in order to avoid confusion
         act <- dplyr::rename(act,act=V1)
        
         ## Take subject data and activity data and add as columns to the train dataset.
         retDf <- cbind(sub, act, df)
        
         if (identical(dtfr,"X_train.txt"))
              {   dftrain <<- retDf
                  return(dftrain)
              }
         else if(identical(dtfr,"X_test.txt"))
              {   dftest <<- retDf
                  return(dftest)
              }
}



########################################################################################################
## Make the training and test datasets by getting the subject, activity and train/test data together
## Check if the train and test datasets exist first.

if (!file.exists("dftrain"))
{makeTidy("X_train.txt", "subject_train.txt", "y_train.txt", dftrain)}

if (!file.exists("dftest"))
{makeTidy("X_test.txt", "subject_test.txt", "y_test.txt", dftest)}

########################################################################################################

## Merge train and test datasets and remove the activity_code column
merged <- merge(dftrain, dftest, all=TRUE)
merged <- merged[, -2]

## Group by Subject & Activity and then find the summary of each column
mean_df<-  merged %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))

## Rename each column of the final mean dataframe with mean attached to the original column name except for Subject & Activity
colnames(mean_df) <- paste("Mean..",colnames(merged),  sep = "")
colnames(mean_df)[colnames(mean_df)=="Mean..Subject"] <- "Subject"
colnames(mean_df)[colnames(mean_df)=="Mean..Activity"] <- "Activity"

## Final dataset saved as a text file
write.table(mean_df, file="Project_mean_data.txt", row.name=FALSE) 

## See in the output in R
data <- read.table("Project_mean_data.txt", header = TRUE) 
View(data)