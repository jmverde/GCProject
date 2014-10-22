clean<-function(){

    
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
 

    #Now we subset the columns that have values for means and for standar deviations
     
    
    columnas_sel<-grep("mean\\(\\)|std\\(\\)",names(all_data))
    sel_data<-all_data[,columnas_sel] 
    
    #here sel_data is the data as wanted in P2
}