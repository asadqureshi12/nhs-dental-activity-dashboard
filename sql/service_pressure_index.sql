Purpose: Calculate the "Urgent Care Burden." In the NHS, a high volume of urgent cases often indicates a lack of preventative care in that area. This query identifies practices where urgent cases make up a disproportionate percentage of their total workload.
SELECT 
    PRACTICE_POSTCODE,
    -- 1. Count only the Urgent Cases
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'URGENT TREATMENT' THEN COT ELSE 0 END) AS Urgent_Count,
    -- 2. Count All Cases
    SUM(COT) AS Total_Count,
    -- 3. Calculate the % (The Index)
    ROUND(100.0 * SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'URGENT TREATMENT' THEN COT ELSE 0 END) / SUM(COT), 2) AS Pressure_Index_Pct
FROM 
    dtable_cleaned
GROUP BY 
    PRACTICE_POSTCODE
HAVING 
    SUM(COT) > 100 -- Filters out tiny practices to ensure statistical reliability
ORDER BY 
    Pressure_Index_Pct DESC;
