# My Coursera's "Getting and Cleaning Data" project
We have written a single script in order to perform the desired manipulations on the considered data, "run_analysis.R". The description of the data set variables and their units is in "CodeBook.md". Next we outline the most important features of the program.

## Script description
When you run "run_analysis.R" in your working directory, it first downloads the zip file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip in a temporary file and then it is unzip in the working directory. Then, it performs the desired operations and as a result we get the output "summarizedData.txt" in the working directory as well. 

In order to read the files from the unzip folder ("UCI HAR Dataset") I have used the "data.table::fread" function, which is the fastest method for this task. First of all we save the features names in a vector and using grep we select the features of interest (the measurements on mean and standard deviation) and their indexes, then we read them with fread (we only read the variables of interest, as opposed to deleting them after reading the whole files). After reading the activity and subject_id columns we bind it all into a single data frame with cbind. We do this with both the train and the test sets separately and then join them using rbind. In this way we obtain the "mergedData" data.frame.

In order to summarize the data with the average values on the subject and activity groups there are many different possibilities and we have opted for doing it in two different ways. The first approach uses "dplyr::group_by" and "dplyr::summarize_at" and the second one "data.table::setDT". The first method returns a "tibble" (it can easily be casted again as a data.frame just with "as.data.frame") while the second one returns both a data.table and a data.frame. Although the second method doesn't change the variable names, notice that the code is significantly shorter.
