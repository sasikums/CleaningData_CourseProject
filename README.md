# CleaningData_CourseProject

The repository contains one R file (run_analysis.R) and a codebook (Codebook.md) to explain the variables.

# run_analysis.R

The script uses data sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The zip files includes detailed decriptions of the data and the variables.

At a broad level, the raw data consists of data collected from Samsung smartphone accelerators from 30 different test subjects. 561 measures were collected for a number of 6 different activites (walking,running etc.) by each subject. The collected data was split in to training and test datasets, with the names of the measures and activities stored seperately.

run_analysis.R uses this raw data to output a 'tidy' dataset consisting of the average of selected measures (mean & standard deviation) for each activity and subject across training and test datasets. 

See Codebook.md for details.
