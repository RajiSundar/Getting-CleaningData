<<<<<<< HEAD
==================================================================
# Project Title
## Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
## Content of this page
- Experiment description
- Raw data description
- Steps involved in creating the tidy dataset
- Description of Tidy dataset used for analysis 
- Calculations performed on tidy data
- Final output dataset description
- Notes
- License

=====================================================================
### Experiment description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


========================================================================
### Raw data description: 7 datasets total - 2 subject sets, 2 activity, 1 train and 1 test dataset.

- Subject data   :     An identifier of the subject who carried out the experiment ranging from 1-30. Two 
			 different datasets with subject details, one for training and other for test dataset.
- Activity       :     One dataset with activity codes performed by the subjects and another  dataset identifying 
			 each code, 1-6, to the related activity.
- Train dataset  :     A dataset containing various readings of from the accelerometer and the gyroscope of 
                         different combinations of subjects & activities. It contains 561-feature vectors with 
		         time and frequency domain variables. 70% of volunteers randomly partitioned as training.
- Test dataset    :    A dataset containing various readings of from the accelerometer and the gyroscope of 
                         different combinations of subjects & activities. It contains 561-feature vectors with 
		         time and frequency domain variables. 30% of volunteers randomly partitioned as test.
- Features data   :    A dataset giving the variable names of each feature.
===========================================================================
###  Steps involved in creating the tidy dataset

- 1. Extract the zipped raw datasets.
- 2. Run the script run_analysis.R uses dplyr package, the loading of which is included in the script.
     Script assumes all the raw data- subjects, activities, train, test and features are present in the current working directory.
     Script does the following:
	- a. Read the subject datasets and give its column a proper label for identification.
	- b. Read the activity dataset which has codes 1-6 relating to each activity. Create a new column with the activity
		name related to each code getting this from the activity labels data.
	- c. Read the train dataset and extract only the necessary columns required - mean & standard deviation data.
	- d. Take the features data and choose only the names of the required columns. Change the names of these variables 
		to human readable form to create the tidy dataset.
	- e. Rename the variables in subsetted train data with the new human-readable names.
	- f. Take subject data and activity data and add as columns to the train dataset. This provides a tidy training dataset.
	
	- g. Repeat steps a to f for the test data.
	- h. Merge the train and test datasets to create one dataset for analyses.
- 3. The script run_analysis.R also performs the calculations, mentioned below,  to give the final output dataset. 


==============================================================================

### Description of Tidy dataset used for analysis 

  The result of the tidying up give two clean datasets - one training & one test. Each dataset has with one row per reading
  along with the concerned subject & the related activity.Each of these datasets also has a row at the top with proper variable names.
  Merge the train and test datasets to create one dataset for analyses.

===============================================================================
### Calculations performed on tidy data
  
   We are required to create a second, independent tidy data set with the average of each variable for each activity and each subject.
   To do this :
	- Group the rows of the analyses dataset per subject per activity.
	- Calculate the average of each column on this dataset.
	- Store these averages in a second, independent tidy dataset.

==================================================================================
### Final output dataset description

	- Each row displays - subject id, activity name, average of each feature measured, so a total of 88 columns for each row.
 	- This dataset can be loaded into R and viewed with these commands : 

		data <- read.table("Project_mean_data.txt", header = TRUE) 
                View(data)

        - This is also included in the script "run_analysis.R". 
	- Sourcing the script will ensure all steps from reading the raw data to outputting the final averages dataset.

===================================================================================

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
=======
# Getting-CleaningData
>>>>>>> ad6ccbd3ba30d7d21e5fd4c64a29f60844e093e5
