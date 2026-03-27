-- Purpose: Identify geographic "hotspots" where urgent dental demand is highest.
-- High urgent volume often indicates poor access to routine/preventative care.

SELECT 
    PRACTICE_POSTCODE, 
    SUM(COT) AS Urgent_Treatments_Total,
    SUM(UDA) AS Urgent_UDA_Value
FROM 
    dtable_cleaned
WHERE 
    DENTAL_TREATMENT_BAND = 'URGENT TREATMENT'
GROUP BY 
    PRACTICE_POSTCODE
ORDER BY 
    Urgent_Treatments_Total DESC
LIMIT 10;
