clean<-function(){

    #Load  packages 
    library(plyr)
    
    #lets start loading test files and putting them into a df with their variable names
    
    file_subject_test<-"./rawData/test/subject_test.txt"
    file_X_test<-"./rawData/test/X_test.txt" 
    file_Y_test<-"./rawData/test/Y_test.txt"
    
    subject_test<-read.table(file_subject_test)
    X_test<-read.table(file_X_test)
    Y_test<-read.table(file_Y_test) 
    
    #lets adress variable names (just temporal names before adressing ponts 3 and 4)
    names(subject_test)<-"subject"
    names(Y_test)<-"activityLabel"
    
    #variable names for X_test are recorded in the file features.txt
    
    file_names<-"./rawData/features.txt"
    varnames<-read.table(file_names)
    names(X_test)<-varnames[,2]    

    #now we combine all training data into a data frame and free some memory
    
    test_data<-cbind(subject_test,Y_test,X_test) 
    
    rm(list=setdiff(ls(), "test_data")) 
    
    #Finally we add a column to keep track of wich set the data came from
    
    test_data$set<-"test"
    
    # now we can repeat the process with the test data (we could do it
    # altogether but in two steps we save some memory)
    
    file_subject_train<-"./rawData/train/subject_train.txt"
    file_X_train<-"./rawData/train/X_train.txt" 
    file_Y_train<-"./rawData/train/Y_train.txt"
    
    subject_train<-read.table(file_subject_train)
    X_train<-read.table(file_X_train)
    Y_train<-read.table(file_Y_train) 
    
    #lets adress variable names (just temporal names before adressing ponts 3 and 4)
    names(subject_train)<-"subject"
    names(Y_train)<-"activityLabel"
    
    #variable names for X_test are recorded in the file features.txt
    
    file_names<-"./rawData/features.txt"
    varnames<-read.table(file_names)
    names(X_train)<-varnames[,2]    
    
    #now we combine all training data into a data frame and free some memory
    
    training_data<-cbind(subject_train,Y_train,X_train) 
    
    rm(list=setdiff(ls(), c("test_data","training_data")))
    #Finally we add a column to keep track of wich set the data came from
    
    training_data$set<-"training"
    
    # we merge all data into a dataframe, and point 1 is done (maybe not
    # necessary but we could write this data to a file ) 
    
    all_data<-rbind(test_data,training_data)
    rm(list=setdiff(ls(),"all_data"))

#    if(!file.exists("procData")){
#        dir.create("procData")
#    }
#    
#    output1<-"./procData/P1.txt"
#    write.table(all_data,file=output1,row.names=F)
 

    #Now we subset the columns that have values for means and for standar  deviations
     # we also mantain columns one and two since those are testsubject and test
    
    columnas_sel<-grep("mean\\(\\)|std\\(\\)",names(all_data))
    sel_data<-all_data[,c(1,2,columnas_sel)] 
    
    #here sel_data is the data as wanted in P2
    
    #For P3 we have just to change the labels for a correct name for the
    #activity we read them from the file where stored
    
    activity_names_file<-"./rawData/activity_labels.txt"
    activity_names<-read.table(activity_names_file)
    
    #we convert those names to the asked format, transforming to lower case and
    #removing underscores
    
    activity_names$V2<-tolower(activity_names$V2)
    activity_names$V2<-gsub("_","",activity_names$V2)
    
    #its realy easy to change the names 
    
    
    sel_data$activityLabel<-activity_names[sel_data$activityLabel,2] 
    
    #since those are codes no more we change the name of the variable
    names(sel_data)[2]<-"activity"
    
    
    #Now we start adressing the fourth point, dataset labeling
    #first of all we adress the typo of "BodyBody" 
    
    names(sel_data)<-gsub("BodyBody","Body",names(sel_data))
    
    #then we change the t or f for time domain and frecuency domain, no
    #separator character is included as instructed

    names(sel_data)<-gsub("^t","timedomain",names(sel_data))
    names(sel_data)<-gsub("^f","frecuencydomain",names(sel_data))
    
    # Body and gravity components are shelf explainable, so we just change them
    # for their lowercased counterparts
    
    names(sel_data)<-gsub("Body","body",names(sel_data))
    names(sel_data)<-gsub("Gravity","gravity",names(sel_data))
    
    # Acc is changed for "acceleration" and "Gyro" for angularvelocity since
    # those are the magnitudes measured
    
    names(sel_data)<-gsub("Acc","acceleration",names(sel_data))
    names(sel_data)<-gsub("Gyro","angularvelocity",names(sel_data))
    
    # Jerk is self explanatory and changed for jerk, 
    
    names(sel_data)<-gsub("Jerk","jerk",names(sel_data))
    
    # Mag stands for magnitude an so is changed 
    
    names(sel_data)<-gsub("Mag","magnitude",names(sel_data))
    
    #change "-mean()" for "mean" and "-std()" for standarddeviation 
    
    names(sel_data)<-gsub("\\-mean\\(\\)","mean",names(sel_data))
    names(sel_data)<-gsub("\\-std\\(\\)","standarddeviation",names(sel_data))
    
    #finaly we change the axis of measure X Y Z for xyzaxis
    
    names(sel_data)<-gsub("\\-X","xaxis",names(sel_data))
    names(sel_data)<-gsub("\\-Y","yaxis",names(sel_data))
    names(sel_data)<-gsub("\\-Z","zaxis",names(sel_data)) 
    
    # and we have the point 4 done (personally y would have prefered underscores
    # of dashes for readibility but rules for variables dont allow for them)
    
    # lets start the P5, is trivial using ddply from plyr
    
    final_data<-ddply(sel_data, .(activity,subject),numcolwise(mean))
    
    # we save to a file the final data 
    
       if(!file.exists("procData")){
           dir.create("procData")
       }
       
       output1<-"./procData/finalData.txt"
       write.table(final_data,file=output1,row.names=F)
    
    final_data
    
}