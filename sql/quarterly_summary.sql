-- Purpose: Evaluate if NHS dental activity is increasing or decreasing over the year.
-- This query aggregates total UDA and COT by Financial Quarter.

SELECT 
    FINANCIAL_QUARTER, 
    SUM(UDA) AS Total_UDA_Delivered, 
    SUM(COT) AS Total_Courses_of_Treatment
FROM 
    dtable_cleaned
GROUP BY 
    FINANCIAL_QUARTER
ORDER BY 
    FINANCIAL_QUARTER;
