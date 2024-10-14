# Load necessary libraries
library(dplyr)

# Load your CSV files
table1tpm <- read.csv("~/Downloads/Padj_heatmap_noNA_noDUB_dot.csv",sep=";")
table2tpm <- read.csv("~/Downloads/TAIR10-TPM_final.csv",sep=";")

# Assuming both tables have a common column called 'id'
merged_table <- table2tpm %>% semi_join(table1tpm, by = c( "gene" = "ensembl_ID"))

#changes all commas in our table with a dot
table_cleaned <- merged_table %>%
  mutate(across(where(is.character), ~ gsub(",", ".", .)))

#changes all values in our table from character to numeric
table_numeric <- table_cleaned%>%
  mutate(across(-1, ~ suppressWarnings(as.numeric(.))))


# Load the data from a CSV file (adjust the file path as needed)
dataTPM <- table_numeric
    
rownames(dataTPM) <- dataTPM$gene

dataTPM <- dataTPM %>% select(-gene)
# If the file is tab-separated, use read.table
# data <- read.table("path/to/your_data.tsv", header = TRUE, sep = "\t", row.names = 1)

# Install if not already installed
install.packages("pheatmap")

# Load the package
library(pheatmap)

# Generate a heatmap with default settings
pheatmap(dataTPM)

# If you'd like to scale the data by rows (genes), use:
pheatmap(dataTPM, scale = "row")

# You can also customize the heatmap, e.g., clustering, colors, etc.
pheatmap(dataTPM, 
         color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
         cluster_rows = TRUE, 
         cluster_cols = TRUE)

# Example of adding annotations
annotation_col <- data.frame(
  Condition = factor(c("Control", "Control", "Treated", "Treated", "Control", "Treated", "Control", "Treated")),
  row.names = colnames(data)
)

pheatmap(dataTPM, 
         color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
         cluster_rows = TRUE, 
         cluster_cols = TRUE,
         annotation_col = annotation_col)

