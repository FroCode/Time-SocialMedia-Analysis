import pandas as pd
import os

# Directory where your CSV files are stored
input_directory = 'D:/Programming/issues/Time-SocialMedia-Analysis/Results'
output_directory = 'D:/Programming/issues/Time-SocialMedia-Analysis/ProcessedCSVs'

# Ensure the output directory exists
os.makedirs(output_directory, exist_ok=True)

# List all CSV files in the directory
csv_files = [f for f in os.listdir(input_directory) if f.endswith('.csv')]

for file in csv_files:
    # Construct the full file path
    file_path = os.path.join(input_directory, file)
    
    # Load the CSV file
    df = pd.read_csv(file_path)
    
    # pre-processing steps:
    
    # Save the processed DataFrame to a new CSV file

print("Pre-processing completed. Processed files are saved in:", output_directory)
