# CleaningData_CourseProject

The repository contains one R file (run_analysis.R) and a codebook (Codebook.md) to explain the variables. An example of the output of run_analysis.R is also included (tidy_data.txt)

# run_analysis.R

The script uses data sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The zip files includes detailed decriptions of the data and the variables.

At a broad level, the raw data consists of data collected from Samsung smartphone accelerators from 30 different test subjects. 561 measures were collected for a number of 6 different activites (walking,running etc.) by each subject. The collected data was split in to training and test datasets, with the names of the measures and activities stored seperately.

run_analysis.R uses this raw data to output a 'tidy' dataset consisting of the average of selected measures (mean & standard deviation) for each activity and subject across training and test datasets. 

The raw data of both training and test sets are imported to R, using read.table and data.table.The descriptive measurement names and activivty labels are then attached to the data. The data is then subset to include only those measurements that involve a mean or a standard deviation. An average of each measure is then calculated for each subject and actitvity. This data is then output using write.table to create a tidy dataset.

# Codebook.md 

Contains a detailed description of the variables and their creation

# tidy_data.txt

Example of r_analysis ouput
