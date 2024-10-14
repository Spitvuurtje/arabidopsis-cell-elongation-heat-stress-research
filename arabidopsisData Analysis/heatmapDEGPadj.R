# Load the data from a CSV file (adjust the file path as needed)
data <- read.csv(file = "~/Downloads/Padj_heatmap_noNA_noDUB_dot.csv",sep=";", row.names = 1)

# If the file is tab-separated, use read.table
# data <- read.table("path/to/your_data.tsv", header = TRUE, sep = "\t", row.names = 1)

# Install if not already installed
install.packages("pheatmap")

# Load the package
library(pheatmap)

# Generate a heatmap with default settings
pheatmap(data)

# If you'd like to scale the data by rows (genes), use:
pheatmap(data, scale = "row")

# You can also customize the heatmap, e.g., clustering, colors, etc.
pheatmap(data, 
         color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
         cluster_rows = TRUE, 
         cluster_cols = TRUE)

# Example of adding annotations
annotation_col <- data.frame(
  Condition = factor(c("Control", "Control", "Treated", "Treated", "Control", "Treated", "Control", "Treated")),
  row.names = colnames(data)
)

pheatmap(data, 
         color = colorRampPalette(c("navy", "white", "firebrick3"))(50),
         cluster_rows = TRUE, 
         cluster_cols = TRUE,
         annotation_col = annotation_col)

