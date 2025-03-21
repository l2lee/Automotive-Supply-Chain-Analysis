# get all the csv files in the current directory
import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# get all the csv files in the current directory
# do this in ascending order
# make sure the csv files are in this correct directory (same as this file), or edit the code to change argument to os.listdir)
csv_files = [f for f in os.listdir(".") if f.endswith(".csv")]
csv_files.sort()


# combine all the csv files
def read_csv_file(file_name):
    df = pd.read_csv(file_name, encoding_errors="replace")
    # add a column to the dataframe with the file name
    df["product"] = file_name[:-4].lower()  # remove .csv
    return df


# concat row wise
df = pd.concat([read_csv_file(file) for file in csv_files], axis=0)

df = df.drop_duplicates()

# Create a new column called trade_volume and have it be randomized uniformly between 100 and 1000, should be integer
df["trade_volume"] = np.random.randint(100, 1000, len(df))

# save the combined csv file
df.to_csv("combined_preprocessed.csv", index=False)
