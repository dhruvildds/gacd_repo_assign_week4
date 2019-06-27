---
title: "README"
author: "Dhruvil Solanki"
date: "June 26, 2019"
output: html_document
---


## Assignment - Week 4 - Getting and Cleaning Data

This is a guide for anyone who needs to undertand how the data was process as per the requirement of the Assignment.

The target audience for this are people who have enrolled for the the course [Getting and Cleaning Data](https://www.coursera.org/learn/data-cleaning/home/welcome)

#### The goal of this guide is to:
* Give a brief overview of the expectations from the assignment 
* Share the location of the files to be reviewed for grading this assignment
* Read the files and the underlying contents to grade the assignment

###Overview of the expectations from the assignment
#####Review criteria 
* The submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.



#####One R script called run_analysis.R is created that does the following

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


###Share the location of the files to be reviewed for grading this assignment

The R script created for this assignment is available in the following repo:-

https://github.com/dhruvildds/gacd_repo_assign_week4

The name of the R Script is "run_analysis.R"


###Read the files and the underlying contents to grade the assignment

The R script has comments at several places to help understand the flow of the script and the expected outcome.

#####The R script in general is peforming the following tasks:-
* Downloading the data for this assignent using the link mentioned above
* Unzip the data in the current working directory
* Read the train and test data for the assignment
* Combine the train and test data for the assignment into a single data frame "complete data"
* Assign the labels to the activity type
* Assign appropriate column names
* Filter the complete data for the features realted to mean and standard deviation
* Compute the mean of the all the numeric columns by subject and activity type
* Export the results in a text file
