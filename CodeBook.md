# CodeBook for the data set

This data set contains the results of experiments using Samsung Galaxy S smartphones and trying to recognize activities (walking, standing, sitting...) using accelerometer and gyroscope.

## Information about the experiments
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc_XYZ and timeGyro_XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc_XYZ and timeGravityAcc_XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk_XYZ and tBodyGyroJerk_XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc_XYZ, freqBodyAccJerk_XYZ, freqBodyGyro_XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. 
## Variables used
These signals were used to estimate variables of the feature vector for each pattern:  
'_XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*timeBodyAcc_XYZ
*timeGravityAcc_XYZ
*timeBodyAccJerk_XYZ
*timeBodyGyro_XYZ
*timeBodyGyroJerk_XYZ
*timeBodyAccMag
*timeGravityAccMag
*timeBodyAccJerkMag
*timeBodyGyroMag
*timeBodyGyroJerkMag
*freqBodyAcc_XYZ
*freqBodyAccJerk_XYZ
*freqBodyGyro_XYZ
freqBodyAccMag

freqBodyAccJerkMag

freqBodyGyroMag

freqBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean: Mean value

Std: Standard deviation

Mad: Median absolute deviation 

Max: Largest value in array

Min: Smallest value in array

Sma: Signal magnitude area

Energy: Energy measure. Sum of the squares divided by the number of values. 

Iqr: Interquartile range 

Entropy: Signal entropy

ArCoeff: Autorregresion coefficients with Burg order equal to 4

Correlation: correlation coefficient between two signals

MaxInds: index of the frequency component with largest magnitude

MeanFreq: Weighted average of the frequency components to obtain a mean frequency

Skewness: skewness of the frequency domain signal 

Kurtosis: kurtosis of the frequency domain signal 

BandsEnergy: Energy of a frequency interval within the 64 bins of the FFT of each window.

Angle: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

timeBodyAccMean

timeBodyAccJerkMean

timeBodyGyroMean

timeBodyGyroJerkMean
