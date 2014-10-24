Raw data description
====================
The original data contains signal data for the Samsung Galaxy Cellphone extracted from its accelerometer and gyroscope, analyzing the signals from the device when test subjects between 19 and 48 years old were performing certain activities. This data was then transformed into different signal measures.A full description of the data is avaiblable on the original files in the rawData directory.

The data can be accesed from  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, and for this course is avalaible also from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Data used in this exercice was obtained from the second link at 22/10/2014 16:03 (GTM+1)

Transformations performed
===========================

1. Subject identification for test set extracted from /test/subject_test.txt

2. Measurement data for test set extracted from /test/X_test.txt 
3. Activity code for test set extracted from /test/Y_test.txt 
4. Names for measurements in X_test extracted from features.txt are applyed to the variables readen from X_test
5. Subject, activity code and measurements binded into a data frame

6. Subject identification for training set extracted from /training/subject_test.txt

7. Measurement data for training set extracted from /trainingt/X_training.txt 
8. Activity code for training set extracted from /training/Y_training.txt 
9. Names for measurements in X_training extracted from features.txt are applyed to the variables readen from X_training
10. The two data sets are binded one after another since measurement variables are in the same order in both data frames
11. Variables with "mean()" or "std()" in their names are subsetd and saved into a new data frame, discarding the old one
12. Names for activities extractes from activity_labels.txt
13. Names for activities formated to lowercase and underscores removed
14. Activity codes substituted for the  correspondig value
15. "BodyBody" changed in variable names to "Body" to correct a typo
16. Names of variables cleaned aplying the following transformations
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
17. Summary dataset created, calculating the mean of te variables in the dataset, subsetting by the subject and the activity. The resulting set has a row for every combination of subject and activity and records the mean of the refered variables  

18. Summary dataset saved to /procData/finalData.txt with a first row including variable names


Variable description
====================

The resulting dataset contains 180 rows and 68 columns. It can be easily readed to a data frame using read.table(output1,header = T) 

Each row represents the means of all the observations refered to means or standard deviations on the original Data from siemens for each combination of subject and activity. Test and training data were merged, and considered the same for the creation of this dataset. 
All columns, except Activity and Subject, are signal data normalized between [-1,1], so all those values are adimensional.
Activity records the id of the subject of this measurement so it has no units
The activity been performed are recorded in a literal for. 

Names of variables should be shelf explained, but for reference they are now listed


1. "activity" : Description of the activity being carried

2. "subject"  : Numeric ID for the studied subject 

3. "timedomainbodyaccelerationmeanxaxis" : Mean of means of body accelerations along X axis measured in time domain 

4. "timedomainbodyaccelerationmeanyaxis" : Mean of means of body accelerations along Y axis measured in time domain

5. "timedomainbodyaccelerationmeanzaxis" : Mean of means of body accelerations along Z axis measured in time domain

6. "timedomainbodyaccelerationstandarddeviationxaxis" : Mean of standard deviations of body accelerations along X axis measured in time domain

7. "timedomainbodyaccelerationstandarddeviationyaxis" : Mean of standard deviations of body accelerations along Y axis measured in time domain 

8. "timedomainbodyaccelerationstandarddeviationzaxis" : Mean of standard deviations of body accelerations along Z axis measured in time domain 

9. "timedomaingravityaccelerationmeanxaxis" : Mean of means of gravity acceleration along X axis measured in time domain 

10. "timedomaingravityaccelerationmeanyaxis" : Mean of means of gravity acceleration along Y axis measured in time domain  

11. "timedomaingravityaccelerationmeanzaxis" : Mean of means of gravity acceleration along Z axis measured in time domain

12. "timedomaingravityaccelerationstandarddeviationxaxis" : Mean of standard deviations of gravity acceleration along X axis measured in time domain 

13. "timedomaingravityaccelerationstandarddeviationyaxis" : Mean of standard deviations of gravity acceleration along Y axis measured in time domain  

14. "timedomaingravityaccelerationstandarddeviationzaxis" : Mean of standard deviations of gravity acceleration along Z axis measured in time domain

15. "timedomainbodyaccelerationjerkmeanxaxis" : Mean of means of body accelerations jerk along X axis measured in time domain 

16. "timedomainbodyaccelerationjerkmeanyaxis" : Mean of means of body accelerations jerk along Y axis measured in time domain 

17. "timedomainbodyaccelerationjerkmeanzaxis" : Mean of means of body accelerations jerk along Z axis measured in time domain 

18. "timedomainbodyaccelerationjerkstandarddeviationxaxis" : Mean of standard deviations of body accelerations jerk along X axis measured in time domain 

19. "timedomainbodyaccelerationjerkstandarddeviationyaxis" : Mean of standard deviations of body accelerations jerk along Y axis measured in time domain 

20. "timedomainbodyaccelerationjerkstandarddeviationzaxis" : Mean of standard deviations of body accelerations jerk along Z axis measured in time domain

21. "timedomainbodyangularvelocitymeanxaxis" : Mean of means of body angular velocity along X axis measured in time domain 

22. "timedomainbodyangularvelocitymeanyaxis" : Mean of means of body angular velocity along Y axis measured in time domain  

23. "timedomainbodyangularvelocitymeanzaxis" : Mean of means of body angular velocity along Z axis measured in time domain 

24. "timedomainbodyangularvelocitystandarddeviationxaxis" : Mean of standard deviations of body angular velocity along X axis measured in time domain   

25. "timedomainbodyangularvelocitystandarddeviationyaxis" : Mean of standard deviations of body angular velocity along Y axis measured in time domain 

26. "timedomainbodyangularvelocitystandarddeviationzaxis" : Mean of standard deviations of body angular velocity along Z axis measured in time domain 

27. "timedomainbodyangularvelocityjerkmeanxaxis" : Mean of means of body angular velocity jerk along X axis measured in time domain  

28. "timedomainbodyangularvelocityjerkmeanyaxis" : Mean of means of body angular velocity jerk along Y axis measured in time domain

29. "timedomainbodyangularvelocityjerkmeanzaxis" : Mean of means of body angular velocity jerk along Z axis measured in time domain 

30. "timedomainbodyangularvelocityjerkstandarddeviationxaxis" : Mean of standard deviations of body angular velocity jerk along X axis measured in time domain

31. "timedomainbodyangularvelocityjerkstandarddeviationyaxis" : Mean of standard deviations of body angular velocity jerk along Y axis measured in time domain 

32. "timedomainbodyangularvelocityjerkstandarddeviationzaxis" : Mean of standard deviations of  body angular velocity jerk along Z axis measured in time domain

33. "timedomainbodyaccelerationmagnitudemean" : Mean of means of body accelerations magnitude measured in time domain 

34. "timedomainbodyaccelerationmagnitudestandarddeviation" : Mean of standard deviations of body accelerations magnitude measured in time domain 

35. "timedomaingravityaccelerationmagnitudemean" : Mean of means of gravity acceleration magnitude measured in time domain 

36. "timedomaingravityaccelerationmagnitudestandarddeviation" : Mean of standard deviations of gravity acceleration magnitude measured in time domain   

37. "timedomainbodyaccelerationjerkmagnitudemean" : Mean of means of body accelerations jerk magnitude measured in time domain

38. "timedomainbodyaccelerationjerkmagnitudestandarddeviation" : Mean of standard deviations of body accelerations jerk magnitude measured in time domain       

39. "timedomainbodyangularvelocitymagnitudemean" : Mean of means of body angular velocity magnitude measured in time domain  

40. "timedomainbodyangularvelocitymagnitudestandarddeviation" : Mean of standard deviations of body angular velocity magnitude measured in time domain       

41. "timedomainbodyangularvelocityjerkmagnitudemean" : Mean of means of body angular velocity jerk magnitude measured in time domain 

42. "timedomainbodyangularvelocityjerkmagnitudestandarddeviation" : Mean of standard deviations of body angular velocity magnitude measured in time domain 

43. "frecuencydomainbodyaccelerationmeanxaxis" : Mean of means of body accelerations along X axis transformed to frecuency domain 

44. "frecuencydomainbodyaccelerationmeanyaxis" : Mean of means of body accelerations along Y axis transformed to frecuency domain 

45. "frecuencydomainbodyaccelerationmeanzaxis" : Mean of means of body accelerations along Z axis transformed to frecuency domain  

46. "frecuencydomainbodyaccelerationstandarddeviationxaxis" : Mean of standard deviations of body accelerations along X axis transformed to frecuency domain  

47. "frecuencydomainbodyaccelerationstandarddeviationyaxis" : Mean of standard deviations of body accelerations along Y axis transformed to frecuency domain 

48. "frecuencydomainbodyaccelerationstandarddeviationzaxis" : Mean of standard deviations of body accelerations along Z axis transformed to frecuency domain 

49. "frecuencydomainbodyaccelerationjerkmeanxaxis" : Mean of means of body accelerations jerk along X axis transformed to frecuency domain

50. "frecuencydomainbodyaccelerationjerkmeanyaxis" : Mean of means of body accelerations jerk along Y axis transformed to frecuency domain 

51. "frecuencydomainbodyaccelerationjerkmeanzaxis" : Mean of means of body accelerations jerk along Z axis transformed to frecuency domain

52. "frecuencydomainbodyaccelerationjerkstandarddeviationxaxis" : Mean of standard deviations of body accelerations jerk along X axis transformed to frecuency domain   

53. "frecuencydomainbodyaccelerationjerkstandarddeviationyaxis" : Mean of standard deviations of body accelerations jerk along Y axis transformed to frecuency domain 

54. "frecuencydomainbodyaccelerationjerkstandarddeviationzaxis" : Mean of standard deviations of body accelerations jerk along Z axis transformed to frecuency domain   

55. "frecuencydomainbodyangularvelocitymeanxaxis" : Mean of means of body angular velocity along X axis transformed to frecuency domain

56. "frecuencydomainbodyangularvelocitymeanyaxis" : Mean of means of body angular velocity along Y axis  transformed to frecuency domain 

57. "frecuencydomainbodyangularvelocitymeanzaxis" : Mean of means of body angular velocity along Z axis transformed to frecuency domain 

58. "frecuencydomainbodyangularvelocitystandarddeviationxaxis"  : Mean of standard deviations of body angular velocity along X axis transformed to frecuency domain  

59. "frecuencydomainbodyangularvelocitystandarddeviationyaxis"  : Mean of standard deviations of body angular velocity along Y axis transformed to frecuency domain  

60. "frecuencydomainbodyangularvelocitystandarddeviationzaxis"  : Mean of standard deviations of body angular velocity along Z axis transformed to frecuency domain 

61. "frecuencydomainbodyaccelerationmagnitudemean" : Mean of means of body accelerations magnitude transformed to frecuency domain 

62. "frecuencydomainbodyaccelerationmagnitudestandarddeviation" : Mean of standard deviations of body accelerations magnitude transformed to frecuency domain   

63. "frecuencydomainbodyaccelerationjerkmagnitudemean" : Mean of means of body accelerations jerk magnitude transformed to frecuency domain

64. "frecuencydomainbodyaccelerationjerkmagnitudestandarddeviation" : Mean of standard deviations of body accelerations jerk magnitude transformed to frecuency domain      

65. "frecuencydomainbodyangularvelocitymagnitudemean" : Mean of means of body angular velocity magnitude transformed to frecuency domain  

66. "frecuencydomainbodyangularvelocitymagnitudestandarddeviation" : Mean of standard deviations of body angular velocity magnitude transformed to frecuency domain 

67. "frecuencydomainbodyangularvelocityjerkmagnitudemean" : Mean of means of body angular velocity jerk magnitude transformed to frecuency domain 

68. "frecuencydomainbodyangularvelocityjerkmagnitudestandarddeviation" : Mean of standard deviations of body angular velocity jerk magnitude transformed to frecuency domain

