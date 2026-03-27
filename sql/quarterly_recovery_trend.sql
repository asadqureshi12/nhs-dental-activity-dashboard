WITH QuarterlyTotals AS (
    SELECT 
        FINANCIAL_QUARTER, 
        SUM(UDA) AS Total_UDA
    FROM dtable_cleaned
    GROUP BY FINANCIAL_QUARTER
)
SELECT 
    FINANCIAL_QUARTER,
    Total_UDA,
    -- 'LAG' reaches back to the previous row to get the last quarter's data
    LAG(Total_UDA) OVER (ORDER BY FINANCIAL_QUARTER) AS Previous_Quarter_UDA,
    -- Calculate the growth percentage
    ROUND(100.0 * (Total_UDA - LAG(Total_UDA) OVER (ORDER BY FINANCIAL_QUARTER)) / 
          LAG(Total_UDA) OVER (ORDER BY FINANCIAL_QUARTER), 2) AS Growth_Pct
FROM 
    QuarterlyTotals;
