import pandas as pd

# Read your sampled CSV
print("Reading CSV...")
df = pd.read_csv('311_sample_10k.csv')

# Convert date columns to PostgreSQL-friendly format
print("Converting dates...")
df['Created Date'] = pd.to_datetime(df['Created Date'])
df['Closed Date'] = pd.to_datetime(df['Closed Date'])

# Save to new CSV (PostgreSQL will understand this format)
df.to_csv('311_clean.csv', index=False)

print("Done! Saved to 311_clean.csv")
print(f"Total rows: {len(df)}")