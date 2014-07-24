# This function takes the UCI data and cleans it up for the getting and Cleaning Data class on Coursera.

run_analysis <- function() {
  # load the supporting data tables, with function names and feature names.
  activityLabels <- read.table("activity_labels.txt");
  names(activityLabels) <- c("activityId", "activityName");
  featureLabels <- read.table("features.txt");

  #get the test data.  The test data is split into 3 files.  The subject_test.txt which has a line per subjectId
  # the y_test.txt which has a line per activityId
  # the x_test.txt which has a line with all the measurements.  The order of the lines are the same as the order of the lines in the other 
  # two files.
  subject <- read.table("test/subject_test.txt");
  names(subject) <- c("subjectid"); 
  activity <- read.table('test/y_test.txt');
  names(activity) <- c("activity"); 
  measurements <- read.table('test/x_test.txt');
  names(measurements) <- featureLabels[, c("V2")];
  
  #only return the subject, activity and mean/std data.  There are some fields named meanFreq... these should also be eliminated.
  test_results <- cbind(subject, activity, 
                        measurements[, regexpr("(mean|std)\\(", names(measurements)) != -1]);

  #get the training data.  The training data is split the same way as the test data
  subject <- read.table("train/subject_train.txt");
  names(subject) <- c("subjectid"); 
  activity <- read.table('train/y_train.txt');
  names(activity) <- c("activity"); 
  measurements <- read.table('train/x_train.txt');
  names(measurements) <- featureLabels[, c("V2")];
  train_results <- cbind(subject, activity, measurements[, regexpr("(mean|std)\\(", names(measurements)) != -1]);

  #merge the two data sets.
  train_results <- rbind(train_results, test_results);

  #set the activity labels on the results set and push the results up to the global environment
  results <<- merge(activityLabels, train_results,  by.x="activityId", by.y="activity")[,2:69];

  #create the mean for each of the measurement columns.
  aggResult <<- aggregate( results[,3:68], results[,1:2], FUN = mean );
}


