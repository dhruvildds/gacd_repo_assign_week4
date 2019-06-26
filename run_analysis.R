#Downloading all the files in the current working directory

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","assign_4_dataset.zip")

unzip("./assign_4_dataset.zip")

setwd("./UCI HAR Dataset/")

#Reading all train data

file_list<-list.files("./train/Inertial Signals/")

a<- list()

for (i in 1:length(file_list))
  a[i]<-read.table(paste("./train/Inertial Signals/",file_list[i],sep=""),stringsAsFactors=FALSE)

names(a)<-gsub("_train.txt|_test.txt","",file_list)

b_train<-data.frame(a,stringsAsFactors = FALSE)
str(b_train)

colnames(b_train)

subject_train<-read.table(paste("./train/subject_train.txt",sep=""),stringsAsFactors = FALSE)
X_train<-read.table(paste("./train/X_train.txt",sep=""),stringsAsFactors = FALSE)
Y_train<-read.table(paste("./train/Y_train.txt",sep=""),stringsAsFactors = FALSE)


#Reading all test data

file_list<-list.files("./test/Inertial Signals/")

a<- list()

for (i in 1:length(file_list))
a[i]<-read.table(paste("./test/Inertial Signals/",file_list[i],sep=""),stringsAsFactors=FALSE)

names(a)<-gsub("_train.txt|_test.txt","",file_list)

b_test<-data.frame(a,stringsAsFactors = FALSE)
str(b_test)

colnames(b_test)

subject_test<-read.table(paste("./test/subject_test.txt",sep=""),stringsAsFactors = FALSE)
X_test<-read.table(paste("./test/X_test.txt",sep=""))
Y_test<-read.table(paste("./test/Y_test.txt",sep=""),stringsAsFactors = FALSE)


#Adding columns names for 561 features

features<-read.table(paste("./features.txt",sep=""))

activity_labels<-read.table(paste("./activity_labels.txt",sep=""))


#Combining train and test data
#1. Merges the training and the test sets to create one data set.

colnames(X_test)<-colnames(X_train)

X<-rbind(X_train,X_test)

Y<-rbind(Y_train,Y_test)


#Replacing activity type with its label value
#3. Uses descriptive activity names to name the activities in the data set

Y<-merge(data.frame(V1=Y),activity_labels)[,2]

#Assign descriptive column names to the features data
#4. Appropriately labels the data set with descriptive variable names.
colnames(X)<-features$V2

#Filtering only for comlumns related to mean and standard deviation
#2. Extracts only the measurements on the mean and standard deviation for each measurement.

X<-X[,grep("mean|std",tolower(colnames(X))) ]

subject<-rbind(subject_train,subject_test)

colnames(subject)<-"subject"

b<-rbind(b_train,b_test)

complete_data<-data.frame(X,Y,b,subject=subject)

unique(complete_data$subject)


#Getting mean of all the attributes for every subject
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

mean_by_subject<-aggregate(. ~ subject, data=complete_data ,FUN = mean)





