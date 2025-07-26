# Code Book for Human Activity Recognition Using Smartphones Dataset

## Overview
This code book describes the variables, data, and transformations performed to clean up the data from the Human Activity Recognition Using Smartphones Dataset.

## Source Data
The source data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

## Transformation Details
The following transformations were applied to the source data:
1. Merged the training and test sets to create one data set
2. Extracted only the measurements on the mean and standard deviation for each measurement
3. Used descriptive activity names to name the activities in the data set
4. Appropriately labeled the data set with descriptive variable names
5. Created a second, independent tidy data set with the average of each variable for each activity and each subject

## Variables
- `subject`: ID of the test subject (range 1-30)
- `activity`: Activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- All other variables represent the average of each measurement for each activity and each subject. These include time and frequency domain signals from the accelerometer and gyroscope.

## Variable Naming Conventions
- 'Time' prefix denotes time domain signals
- 'Frequency' prefix denotes frequency domain signals
- 'Accelerometer' indicates accelerometer measurements
- 'Gyroscope' indicates gyroscope measurements
- 'Mean' indicates mean values
- 'STD' indicates standard deviation
- 'X', 'Y', 'Z' denote 3-axial signals