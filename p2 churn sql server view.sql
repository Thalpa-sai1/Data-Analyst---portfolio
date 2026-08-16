USE [Project_2_Customer_Churn_Analysis];
GO

-- Delete the old view if it already exists
IF OBJECT_ID('dbo.vw_CustomerChurnAnalysis', 'V') IS NOT NULL
    DROP VIEW dbo.vw_CustomerChurnAnalysis;
GO

-- Create the new view
CREATE VIEW dbo.vw_CustomerChurnAnalysis
AS

SELECT

       /*CUSTOMER INFORMATION8*/

    C.CustomerID,
    C.Count AS Customer_Count,

    -- Customer demographics available in main customer table
    C.Gender,
    C.Senior_Citizen,
    C.Partner,
    C.Dependents,
    C.Tenure_Months,

    /* DEMOGRAPHICS*/

    D.Age,
    D.Under_30,
    D.Married,
    D.Number_of_Dependents,

    /* LOCATION */

    L.Country,
    L.State,
    L.City,
    L.Zip_Code,
    L.Lat_Long,
    L.Latitude,
    L.Longitude,

    /* SERVICES */

    S.Quarter,
    S.Referred_a_Friend,
    S.Number_of_Referrals,
    S.Offer,

    S.Phone_Service,
    S.Multiple_Lines,
    S.Internet_Service,
    S.Internet_Type,

    S.Avg_Monthly_Long_Distance_Charges,
    S.Avg_Monthly_GB_Download,

    S.Online_Security,
    S.Online_Backup,
    S.Device_Protection_Plan,
    S.Premium_Tech_Support,

    S.Streaming_TV,
    S.Streaming_Movies,
    S.Streaming_Music,
    S.Unlimited_Data,

    S.Contract,
    S.Paperless_Billing,
    S.Payment_Method,

    S.Monthly_Charge,
    S.Total_Charges,
    S.Total_Refunds,
    S.Total_Extra_Data_Charges,
    S.Total_Long_Distance_Charges,
    S.Total_Revenue,

    /* CUSTOMER STATUS / CHURN */

    ST.Satisfaction_Score,
    ST.Customer_Status,
    ST.Churn_Label,
    ST.Churn_Value,
    ST.Churn_Score,
    ST.CLTV,
    ST.Churn_Category,
    ST.Churn_Reason

FROM dbo.Telco_customer_churn AS C

LEFT JOIN dbo.Telco_customer_churn_demographics AS D
    ON C.CustomerID = D.Customer_ID

LEFT JOIN dbo.Telco_customer_churn_location AS L
    ON C.CustomerID = L.Customer_ID

LEFT JOIN dbo.Telco_customer_churn_services AS S
    ON C.CustomerID = S.Customer_ID

LEFT JOIN dbo.Telco_customer_churn_status AS ST
    ON C.CustomerID = ST.Customer_ID;

GO

-- Test the new view
SELECT TOP 100 *
FROM dbo.vw_CustomerChurnAnalysis;

GO