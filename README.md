CleaningData
============
The steps to create the clean data set were:

1. Reading all files
2. Adding activity (from ytrain and yTest files) to  Test and Training Sets (from Xtrain and Xtest files)
3. Adding subject (from subjecttrain and subjecttest files)
4. Merging rows from test and training sets
5. Adding Column names from Features file
6. Subestting only the columns which have "-mean" or "-std" in the name
7. Renaming activities using a little for loop 
8. Melting and then casting the new subset to et means by activity/subject

I occasionally removed variables I was no longer using to free up memory
