# Human Activity Recognition Using Smartphones Dataset Analysis

This repository contains the analysis script and documentation for processing the Human Activity Recognition Using Smartphones Dataset.

## Files
- `run_analysis.R`: R script that performs the data cleaning and transformation
- `CodeBook.md`: Describes the variables, data, and transformations
- `FinalTidyData.txt`: The final tidy data set output

## How to Use
1. Download the dataset from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Place the `run_analysis.R` script in the same directory as the unzipped "UCI HAR Dataset" folder
3. Run the script in R
4. The script will output a file called `FinalTidyData.txt` with the tidy data set

## Script Steps
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject