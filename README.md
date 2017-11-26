# README: Coursera - Getting and Cleaning Data - Course Project: Human Activity Recognition Dataset

## Description of project

In this project, we take data from the University of California Irvine (UCI) _Human Activity Recognition Using Smartphones Data Set_, wrandle the data, and create a tidy dataset. 

The UCI study used the sensors in smartphones to record physical characteristics like acceleration and velocity in three dimensions for these common activities: walking, walking up stairs, walking down stairs, sitting, standing, and laying. The study had 30 different participants perform these different activities and recorded data for each. More information on the UCI project and data is available here:

- Project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The tidy dataset `aggregated_activity_data.txt` created in this class project includes average summaries of the sensor data for each participant and the participant's activity type. Each row of the tidy data set is an observation of a participant's activity type and the average of each of the sensor data variables (the summaries of different types of sensor data). Each column is a different variable. 

Note: in this project, the data summarized are limited to measurements on the mean and standard deviation for each sensor measurement. In other words, we are summarizing means of means and meand of standard deviations.


## What is tidy data?

The "tidy data" concept is thoroughly described here: http://vita.had.co.nz/papers/tidy-data.html

In short, tidy data means:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

The tidy dataset, `aggregated_activity_data.txt`. adheres to these principles and also has these characteristics:

- Contains a header row at the top with variable names
- Variable names are human readable
- Data saved in one file per table

## Contents of this repo

- `readme.md` - the file you are reading
- `codebook.md` - code book or data dictionary for the tidy dataset
- `data` directory - UCI data needed to run script and generate tidy data set
- `run_analysis.R` - script to take UCI data and generate tidy data set
- `aggregated_activity_data.txt` - the tidy data set
    - Note: to open in R, use `read.table("./aggregated_activity_data.txt", header = TRUE)`


## Tidying the UCI data

This section describes the step by step process to take the UCI data and turn it into a tidy dataset. This follows the steps in the script, `run_analysis.R`.

1. Merge the "training" and "test" UCI data sets into one data set
    1. Read the data into R
    2. Append the appropriate files together vertically, e.g., subjects data from "training" and subjects data from "test"
    3. Apply variable names to the columns
    4. Combine the data horizontally to get one dataset with subject id, activity id, and the sensor observations
2. Extract only the measurements on the mean and standard deviation for each measurement
    1. Along with the id columns, take columns with names that include "mean()" or "std()"
3. Use descriptive names, e.g., "walking," to name the activities in the data set, instead of numbers
4. Change the column names to be descriptive and human readable
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject
6. Save the tidy data set