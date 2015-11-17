#Mammal body size and extinction
library(tidyr)
library(dplyr)
mammal_sizes<-read.table("http://www.esapubs.org/archive/ecol/E084/094/MOMv3.3.txt", header=F, sep="\t",stringsAsFactors = FALSE, na.strings = "-999")
colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference") #rename col

mammal_sizes_red<-subset(mammal_sizes, !mammal_sizes$status=="historical", drop=TRUE) #drop historic ext.
mammal_sizes_red<-subset(mammal_sizes_red, !mammal_sizes_red$status=="introduction", drop=TRUE) #drop introduction ext.

mean_mass<-tapply(mammal_sizes_red$log_mass, mammal_sizes_red$status, mean, na.rm=TRUE) #calculate mean log_mass by status

mean_mass_con<-aggregate(log_mass ~ status + continent, data = mammal_sizes_red, FUN = mean)#calculate mean log_mass by status and con

write.table(spread(mean_mass_con, status,log_mass), "continent_mass_differences.csv", sep=",")



