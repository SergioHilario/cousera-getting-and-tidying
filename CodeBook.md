# Code Book
The whole data set can be found in http://archive.ics.uci.edu/ml/machine-learning-databases/00240/. In this code book we describe all the features and the changes we made in order to obtain the project's final data set.
## Variables description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Considered measurements
Each of the above features come with a corresponding measurement description. For our final data set we only needed the following measurements on the above described signals: 

mean(): Mean value

std(): Standard deviation

## Units
* The linear acceleration magnitudes are in standard gravity units (g).
* The angular acceleration magnitudes are in rad/s.
* Jerk variables are time derivatives so their corresponding units are g/s and rad/s^2.
* All the frequency measurements are the fourier transform of the corresponding magnitude, so their units are the ones of the corresponding magnitude multiplied by seconds.

## Identification variables
The data set contains two variables in order to identify different experimental subjects and the conditions in which the experiment was performed:
* Subject_id: a number ranging from 1 to 30 used to identify each person.
* Activity: its values are the labels of the different activites (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) under which the experiment was carried out.

## Summarized data set
Our project consists on tidying the original data set, selecting the mean and standard deviation measurements and summarizing the data set by averaging the experiment features on subject_id and activity. Thus, all the variables that appear in "summarizedData.txt" (the project's final data set) are averaged on the different observations that were recorded for each of these groups.

