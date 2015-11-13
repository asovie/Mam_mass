mammal_sizes<-read.table("http://www.esapubs.org/archive/ecol/E084/094/MOMv3.3.txt", header=F, sep="\t",stringsAsFactors = FALSE, na.strings = "-999")
colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")
mammal_sizes_red<-subset(mammal_sizes, !mammal_sizes$status=="historical", drop=TRUE)
mean_mass<-tapply(mammal_sizes_red$log_mass, mammal_sizes_red$status, mean, na.rm=TRUE)
