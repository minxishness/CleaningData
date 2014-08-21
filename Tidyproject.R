Xtest<-read.table("UCI HAR Dataset//test//X_test.txt")
Ytest<-read.table("UCI HAR Dataset//test//Y_test.txt")
Xtrain<-read.table("UCI HAR Dataset//train//X_train.txt")
Ytrain<-read.table("UCI HAR Dataset//train//y_train.txt")
testSubj<-read.table("UCI HAR Dataset//test//subject_test.txt")
trainSubj<-read.table("UCI HAR Dataset//train//subject_train.txt")
columnames<-read.table("UCI HAR Dataset//features.txt",stringsAsFactors = F)
acLabels<-read.table("UCI HAR Dataset//activity_labels.txt",stringsAsFactors = F)
Xtest<- cbind(Xtest, Ytest, testSubj)
Xtrain<- cbind(Xtrain, Ytrain, trainSubj)
cn<-columnames[,2]
cn<-append(cn,c("activity","subject"))
rm(Xtest,Ytest,Ytrain,testSubj,trainSubj,columnames)
colnames(Xtrain)<-cn
meanPos<-grep("-mean",cn)
stPos<-grep("-std",cn)
validcol<-c(meanPos,stPos,562,563)
x1<-Xtrain[,validcol]
rm(Xtrain)
for (i in 1:6){
  x1$activity<-replace(acLabels[i,1],acLabels[i,2])
}
x1$activity<-as.factor(x1$activity)
x1$subject<-as.factor(x1$subject)
meltX<-melt(x1,id=c("subject","activity"))
TidySet<-cast(meltX,activity + subject~variable,mean)
write.table(TidySet,"TidySet.txt",row.name=F)