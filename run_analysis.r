#R Data Cleaning Project

#load libraries
library('data.table')
library('reshape2')

#set rootfile path
rpath <- "./UCI HAR Dataset/"

#import features
features <- read.table(paste(rpath,'features.txt',sep=""))
#only second column of features file has feature names
features <- features[,2]
relv_features <- grep('mean|std',features,value=TRUE)

#import activity labels
act_labels <- read.table(paste(rpath,'activity_labels.txt',sep=""))
act_col_names <- c("Activity_Number","Activity_Label")

#function to import x and y sets and attach labels
importdata <- function(type){
  fpath<-paste(rpath,type,"/",sep="")
  
  ## Import X data (read in as data table for faster processing)
  x_data <- data.table(read.table(paste(fpath,"X_",type,".txt",sep="")))
  
  #set x names to features
  #names(x_data) <- as.character(features)
  setnames(x_data,names(x_data),as.character(features))
  
  #subset x_data for relevant features
  x_relv <- x_data[,relv_features,with=FALSE]
  
  ## Import Y Data
  y_data <- data.table(read.table(paste(fpath,"Y_",type,".txt",sep="")))
  #Merge with labels
  y_data <- merge(y_data,act_labels,by=c('V1'))
  #names(y_data) <- act_col_names
  setnames(y_data,names(y_data),act_col_names)
  y_data <- y_data[,"Activity_Label",with=FALSE]
  
  ## Import Subject Data
  s_data <- data.table(read.table(paste(fpath,"subject_",type,".txt",sep="")))
  #names(s_data) <- c('Subject')
  setnames(s_data,names(s_data),c('Subject'))
  
  #bind data together...assume column order is correctly preserved
  form_data <- cbind(s_data,y_data,x_relv)
  return(form_data)
  
}
## Import training and test data
train <- importdata('train')
test <- importdata('test')

## Combine Training and Test Data
consol_data <- rbind(train,test)

### Tranpose data to long  form to assist aggrgation
melt_data  <- melt(consol_data,id.vars=c('Subject','Activity_Label'),
                   variable.name="Variable",
                   value.name="Measurement")
## Calculate mean of each variable by subject and activity
agg_data <- melt_data[,list(mean(Measurement)),
                      by=c('Subject','Activity_Label','Variable')]
setnames(agg_data,'V1','Mean_of_Variable')

#Export data as a text file
write.table(agg_data, file = "./tidy_data.txt",row.name=FALSE)
