# This describes how /what to run.
#### Set things up
here::i_am("R_code/stataR_wrapper.R")
library(here)
my_projdir<-here()

#this reads in paths and libraries
# Be careful, there may be few masked objects (packages with commands with the same name)

source(file.path(my_projdir,"R_code","project_logistics","R_paths_libraries.R"))


dofile<-"test1.do"
#dofile<-"test2.do"

full.path.dofile<-file.path(stata_codedir,"analysis",dofile)
cmd<-paste0('"',stataexe, '" /e do "',full.path.dofile,'"')



#  stata needs to save a log file, it will do so in the "active directory"
getwd()

system(cmd, wait=TRUE)

# If this has run properly, R should return "0", you should have
#  1.  a file called "test1.log" in the getwd() folder, 
#  2.  a "scatterplot.png" in the images folder, 
#  3.  a regression_table.tex in the tables folder