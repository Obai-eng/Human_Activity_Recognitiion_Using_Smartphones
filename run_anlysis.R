install.packages("tidyr")
library(tidyr)
library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "data.zip")
unzip("data.zip")
features <- read.table("UCI HAR Dataset/features.txt",
                       col.names = c("index", "feature"))
head(features)
activity_labels <-read.table("UCI HAR Dataset/activity_labels.txt",
                             col.names = c("index", "activity"))
head(activity_labels)
# test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",
                           col.names = c("subject"))
head(subject_test)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",
                     col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",
                     col.names = "code")
# train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",
                            col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",
                      col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",
                      col.names = "code")
# Merging training and Testing datasets:
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)
merge_data <- cbind(subject_merge, y_merge, x_merge)
head(merge_data)
# For descriptive activity names:
merge_data$code <- activity_labels[merge_data$code, 2]
# Mean and SD:
tidy_data <- merge_data %>% select(subject, code, contains("mean"), contains("std"))
# Label with names
names(tidy_data)[2] = "activity"
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))                         
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("-std()", "STD", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("-freq()", "Frequency", names(tidy_data), ignore.case = T)
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
# Final dataset
final <- tidy_data %>% 
  group_by(subject, activity) %>% summarise_all(mean)
write.table(final, "FinalTidyData.txt", row.names = FALSE)

