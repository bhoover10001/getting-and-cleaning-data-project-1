# run_analysis.md

This is the assignment for the Getting and Cleaning Data class on coursera.

The data is split into multiple files.

* activity_labels.txt contains the map between activity id and activity name
* features.txt contains the column names for each of the measurements
* test/
 * subject_test.txt contains a line for each measurement with a numeric representation of the subject
 * y_test.txt contains a line for each measurement with the activity id
 * x_test.txt contains the summarized data for each measurement
* train/
 * subject_train.txt contains a line for each measurement with a numeric representation of the subject
 * y_train.txt contains a line for each measurement with the activity id
 * x_train.txt contains the summarized data for each measurement


In the root directory of the data, call the function run_analysis().

This will put two variables into the global environment:

* results - Consolidates the test and train data sets into a single data set with headers.
* aggResults - An aggregated data set by subject/activityName with the mean values of the results.
