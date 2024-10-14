# Load necessary libraries
library(dplyr)


# Load your CSV files
table1gib <- read.csv("~/Downloads/GibData.csv",sep=";")
table2gib <- read.csv("~/Downloads/deg_values_DESeq_Suberin3.csv",sep=";")

# Assuming both tables have a common column called 'id'
merged_table <- table2gib %>% semi_join(table1gib)

# Load the data from a CSV file (adjust the file path as needed)
dataGib <- merged_table

rownames(dataGib) <- dataGib$gene

dataGib <- dataGib %>% select(-gene)
# If the file is tab-separated, use read.table
# data <- read.table("path/to/your_data.tsv", header = TRUE, sep = "\t", row.names = 1)
