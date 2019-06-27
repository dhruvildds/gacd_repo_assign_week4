---
title: "codebook for week 4 assignment of course Getting and Cleaning Data"
author: "Dhruvil Solanki"
date: "June 27, 2019"
output: html_document
---

###Raw Data
The raw data for this project is accelerometer data collected from the Samsung Galaxy S smartphone, and was provided to us at the links below:

Data file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

CodeBook: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


There are 4 types of files:

x: rows of feature measurements
y: the activity labels corresponding to each row of X. Encoded as numbers.
subject: the subjects on which each row of X was measured. Encoded as numbers.
Inertial signals (a,b): measurements of 
                  - Triaxial acceleration from the accelerometer (total                      acceleration) and the estimated body acceleration. 
                  - Triaxial Angular velocity from the gyroscope. 

In addition, to determine which features are required, we look at the list of features:

features.txt
The encoding from activity labels ids to descriptive names.

activity_labels.txt


###Data load
The Inertial Signals (a,b), Y, S and X data is loaded from each of the training and test datasets, directly as their final type.
Only the columns of interest from X are loaded, that is the mean() and sd() columns. We determine the columns by examining the feature names (from features.txt) for patterns “mean” or “std”.
All of these files are fixed format text files.

###Transformation
The activity descriptions are joined to the activity label data (Y).
The corresponding training and test datasets are concatenated to get the final data "complete_data" 

The data is further subsetted to only include the activity, subject, and the mean of each of the features.
The data is then agrgregate at the "activity" + "subject" level to find the mean of all the other features using the "aggregate" function.

This result is output as mean_by_subject_activity.txt


