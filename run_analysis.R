
run_analysis <- function() {
  activityLabels <- read.table("activity_labels.txt");
  names(activityLabels) <- c("activityId", "activityName");
  featureLabels <- read.table("features.txt");
  subject <- read.table("test/subject_test.txt");
  names(subject) <- c("subjectid"); 
  activity <- read.table('test/y_test.txt');
  names(activity) <- c("activity"); 
  measurements <- read.table('test/x_test.txt');
  names(measurements) <- featureLabels[, c("V2")];
  test_results <- cbind(subject, activity, 
                        measurements[, regexpr("(mean|std)\\(", names(measurements)) != -1]);

  subject <- read.table("train/subject_train.txt");
  names(subject) <- c("subjectid"); 
  activity <- read.table('train/y_train.txt');
  names(activity) <- c("activity"); 
  measurements <- read.table('train/x_train.txt');
  names(measurements) <- featureLabels[, c("V2")];
  train_results <- cbind(subject, activity, measurements[, regexpr("(mean|std)\\(", names(measurements)) != -1]);
  train_results <- rbind(train_results, test_results);
  results <<- merge(activityLabels, train_results,  by.x="activityId", by.y="activity")[,2:69];
  aggResult <<- aggregate( results[,3:68], results[,1:2], FUN = mean );
}


