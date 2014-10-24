GCProject
=========

This is a script created for the project of the coursera course "Getting and cleaning the data"

The project folder contains the cleanin script named "run_analysis.R", the raw data in the directory "rawData" documentation files and the directory procData that contains the resulting datafile 

Full information about raw data can be found into the readme file included ih the raw data directory 


The run_analisys script:
=======================

### Dependences  
*plyr* library

### script at work 

1. Data about subject for the test set is read from ./rawData/test/subject_test.txt using read.table (this will be the function used for reading the txt files in the following)

2. Measurementes for the test set read from ./rawData/test/X_test.txt

3. Ids for activity for the test set read from ./rawData/test/Y_test.txt

4. Column for subject information is given the name "subject" in the subject information data frame

5. Column for activity codes is given the name "activityLabel" in the activity codes data frame 

6. Variable names for the measurements are readen from ./rawData/features.txt

7. Variable names for the measurements are asigned using the ones readen 

8. Subject, activityID and measurements dataframes are combined onto a new data frame using cbind

9. A new variable named "set" is created in this dataframe and filled with the "test" value to keep track of the origing of the data
    
10. Data about subject for the train set is read from ./rawData/train/subject_train.txt 

11. Measurementes for the train set read from ./rawData/train/X_train.txt

12. Ids for activity for the train set read from ./rawData/train/Y_test.txt

15. Column for subject information is given the name "subject" in the subject information data frame

16. Column for activity codes is given the name "activityLabel" in the activity codes data frame 

17. Variable names for the measurements are readen from ./rawData/features.txt

18. Variable names for the measurements are asigned using the ones readen     

19. Subject, activityID and measurements dataframes are combined onto a new data frame using cbind

20. A new variable named "set" is created in this dataframe and filled with the "training" value to keep track of the origing of the data    

21. Train data and test data dataframes are combined onto a new one using rbind since variables are stored in the two files in the same order **Step 1 is done**
 
22. grep is used to detect the columns with "mean()" or "std()" in their names and the resulting list is used to subset the desired variables

23. The subsetted variables are stored in a new data frame **Step 2 is done**

24. Names for the activities are read from ./rawData/activity_labels.txt and stored into a dataframe (it is more convinient than using a list since you can use the data frame as a dictionary) 

25. Names in the activity names dataframe is converted to lowercase and underscores are removed from them

26. Using the activity names dataframe activity ids are substituted with its name 

27. Since the variable is containing ids no longer the name of the variable is changed to "activity" **Point 3 is done**
    
28. Variable names are processed using the following substitutions:  
    * Replace "BodyBody" with "Body" to solve a Typo in the original data
    * Replace leading "t" with  "timedomain" 
    * Replace leading "f" with "frecuencydomain"
    * Replace "Body" with "body"
    * Replace "Gravity" with "gravity"
    * Replace "ACC" with "acceleration"
    * Replace "Gyro" with "angularvelocity"
    * Replace "Jerk" with "jerk"
    * Replace "Mag" with "magnitude"
    * Replace "-mean()" with "mean"
    * Replace "-std()" with "standarddeviation"
    * Replace "-X" with "xaxis"
    * Replace "-Y" with "yaxis"
    * Replace "-Z" with "zaxis"

29. **Point 4 is done** (I would have suggested using dashes to improve readibility, but those names were done as instructed in the assigment)

30. Use ddply from plyr library to summarize the resulting  dataset using the activity and subject columns to split in groups the data set, and average of all other numerical variables. This produces a table with the average of all measurements we selected divided by subject and activity name.

31. The resulting dataset is tidy, so **P5 is done**

32. Finally, the resulting data frame is stored in ./procData/finalData.txt using write.table and the resulting dataframe is returned as was instructed

33. Thaks to everyone that has readen this whole readme for the attention 