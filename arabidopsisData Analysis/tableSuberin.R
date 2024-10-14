# Load necessary libraries
library(dplyr)


# Load your CSV files
table1sub <- read.csv("~/Downloads/SuberinDataNoDub.csv",sep=";")
table2sub <- read.csv("~/Downloads/deg_values_DESeq_Suberin3.csv",sep=";")

# Assuming both tables have a common column called 'id'
merged_table <- table2sub %>% semi_join(table1sub)

# Load the data from a CSV file (adjust the file path as needed)
dataSub <- merged_table

rownames(dataSub) <- dataSub$gene

dataSub <- dataSub %>% select(-gene)
# If the file is tab-separated, use read.table
# data <- read.table("path/to/your_data.tsv", header = TRUE, sep = "\t", row.names = 1)
