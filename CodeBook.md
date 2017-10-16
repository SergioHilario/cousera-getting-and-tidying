# Code Book
In this code book we describe all the variables of the data set "summarizedData.txt" (the project's final data set).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


From the original data set we selected the following variables for each of the previous signals: 

mean(): Mean value
std(): Standard deviation

The summarized data set contains the average values grouped by subject_id and activity

# Variable description 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

|     Variable name      |  Description | Units |
|----------|:-------------:|:-------------:|
|subject_id| A number labeling the different subjects of the experiment| Range from 1 to 30|
| tBodyAcc-XYZ | accelerometer average of raw signals  | Standard gravity units (g) |
| tBodyAcc-XYZ|
|tGravityAcc-XYZ|
|tBodyAccJerk-XYZ|
|tBodyGyro-XYZ|
|tBodyGyroJerk-XYZ|
|tBodyAccMag|
|tGravityAccMag|
|tBodyAccJerkMag|
|tBodyGyroMag|
|tBodyGyroJerkMag|
|fBodyAcc-XYZ|
|fBodyAccJerk-XYZ
|fBodyGyro-XYZ|
|fBodyAccMag|
|fBodyAccJerkMag|
|fBodyGyroMag|
|fBodyGyroJerkMag| |bb|
| c| cc |
