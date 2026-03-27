-- Purpose: Identify which patient groups (e.g., Children vs. Adults) 
-- are most affected by emergency/urgent dental demand.

SELECT 
    PATIENT_TYPE, 
    DENTAL_TREATMENT_BAND, 
    SUM(COT) AS Case_Volume
FROM 
    dtable_cleaned
WHERE 
    DENTAL_TREATMENT_BAND IN ('BAND 1', 'URGENT TREATMENT')
GROUP BY 
    PATIENT_TYPE, 
    DENTAL_TREATMENT_BAND
ORDER BY 
    PATIENT_TYPE, 
    Case_Volume DESC;
