import pandas as pd

# Read only first 10,000 rows of the huge CSV
df = pd.read_csv('311_data.csv', nrows=10000)

# Save to a new smaller file
df.to_csv('311_sample_10k.csv', index=False)

print("Done! Saved 10,000 rows to 311_sample_10k.csv")