mammal_sizes<-read.table("http://www.esapubs.org/archive/ecol/E084/094/MOMv3.3.txt", header=F, sep="\t",stringsAsFactors = FALSE, na.strings = "-999")
colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")