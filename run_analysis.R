######################
# Tidying data project
######################
# Downloading the files
# you can do: setwd(your-desired-working-directory)
temp <- tempfile()
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, dest="smartphones.zip", mode="wb") 
unzip ("smartphones.zip", exdir = "./")
unlink(temp)

# Reading the files and selecting the desired variables
# Note: activity values and variable names are simultaniously set as demanded
library(data.table)
features<-fread("./UCI HAR Dataset/features.txt", data.table = FALSE)
features<-features$V2
#Keep the features that we want
extract<-grep("mean\\(\\)|std()",features)
features<-features[extract]
features<-gsub("(Body){2}","Body",features)
#Keep the names of the activities in a vector
activities<-fread("./UCI HAR Dataset/activity_labels.txt", select = 2, data.table = FALSE)[,1]

train_id<-fread("./UCI HAR Dataset/train/subject_train.txt",col.names = "subject_id",data.table=F)
train_measurements<-fread("./UCI HAR Dataset/train/X_train.txt",select=extract,col.names=features,data.table=F)
train_activity<-fread("./UCI HAR Dataset/train/y_train.txt",col.names="activity",data.table=F)
train_activity$activity<-plyr::mapvalues(train_activity$activity,from=1:6,to=activities)#Point 3
training<-cbind(train_id,train_measurements,train_activity)

test_id<-fread("./UCI HAR Dataset/test/subject_test.txt",col.names = "subject_id",data.table=F)
test_measurements<-fread("./UCI HAR Dataset/test/X_test.txt",select=extract,col.names=features,data.table=F)
test_activity<-fread("./UCI HAR Dataset/test/y_test.txt",col.names="activity",data.table=F)
test_activity$activity<-plyr::mapvalues(test_activity$activity,from=1:6,to=activities)#Point 3
test<-cbind(test_id,test_measurements,test_activity)

# Merging the training and test sets
mergedData<-rbind(training,test)#Point 1
# Just to clean the workspace
rm(train_id,train_measurements,train_activity,training,test_id,test_measurements,test_activity,test)

# Creating the summarized data set
# 1st version: returns a tibble
library(dplyr)
summarizedData<-mergedData %>% group_by(subject_id,activity) %>% 
  summarise_at(.vars = features,
               .funs = c(avg="mean"))
summarizedData<-as.data.frame(summarizedData) #optional

# 2n version: doesn't change the variable names but it's faster
# it returns both a data.table and a data.frame
library(data.table)
summarizedData2<-setDT(mergedData)[, lapply(.SD, mean), by = c("subject_id","activity")]

# Writing the final result
write.table(summarizedData, file="summarizedData.txt", row.names=F)