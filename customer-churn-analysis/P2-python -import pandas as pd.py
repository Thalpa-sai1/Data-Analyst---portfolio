import pandas as pd
import pyodbc

# Connect to SQL Server
conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=DESKTOP-VBCT4TU\\SQLEXPRESS;"
    "DATABASE=Project_2_Customer_Churn_Analysis;"
    "Trusted_Connection=yes;"
)

# Load the customer churn view
query = "SELECT * FROM dbo.vw_CustomerChurnAnalysis"

df = pd.read_sql(query, conn)

# Check the first few records
print(df.head())

# Check the size of the dataset
print("Dataset shape:", df.shape)

# Check column names
print(df.columns.tolist())

# Check data types and missing values
print(df.info())

# Check null values
print("\nMissing values:")
print(df.isnull().sum())

# Check duplicate rows
print("\nDuplicate rows:", df.duplicated().sum())

# Check whether missing Churn Reason values are expected
print("\nChurn label vs missing churn reason:")
print(pd.crosstab(
    df["Churn_Label"],
    df["Churn_Reason"].isna()
))

# Check important categorical columns
print("\nGender:")
print(df["Gender"].value_counts())

print("\nChurn Label:")
print(df["Churn_Label"].value_counts())

print("\nCustomer Status:")
print(df["Customer_Status"].value_counts())

print("\nContract:")
print(df["Contract"].value_counts())

print("\nInternet Service:")
print(df["Internet_Service"].value_counts())

print("\nPayment Method:")
print(df["Payment_Method"].value_counts())

# Basic statistics for numerical columns
print("\nNumerical summary:")
print(df[[
    "Age",
    "Tenure_Months",
    "Monthly_Charge",
    "Total_Charges"
]].describe())

# Check for values that should not be negative
print("\nNegative Age values:")
print(df[df["Age"] < 0])

print("\nNegative Tenure values:")
print(df[df["Tenure_Months"] < 0])

print("\nNegative Monthly Charges:")
print(df[df["Monthly_Charge"] < 0])

# Close the SQL connection
conn.close()