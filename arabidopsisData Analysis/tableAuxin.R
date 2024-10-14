# Load necessary libraries
library(dplyr)


# Load your CSV files
table1aux <- read.csv("~/Downloads/AuxinDatagene.csv",sep=";")
table2aux <- read.csv("~/Downloads/deg_values_DESeq_Suberin3.csv",sep=";")

# Assuming both tables have a common column called 'id'
merged_table <- table2aux %>% semi_join(table1aux)

# Load the data from a CSV file (adjust the file path as needed)
dataAux <- merged_table

rownames(dataAux) <- dataAux$gene

dataAux <- dataAux %>% select(-gene)
# If the file is tab-separated, use read.table
# data <- read.table("path/to/your_data.tsv", header = TRUE, sep = "\t", row.names = 1)
