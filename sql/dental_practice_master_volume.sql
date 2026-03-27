SELECT 
    PRACTICE_CODE, 
    PRACTICE_POSTCODE,
    
    -- 1. GLOBAL TOTALS
    SUM(COT) AS total_cot_volume,            
    SUM(UDA) AS total_uda_value,            
    
    -- 2. CLINICAL INTENSITY (Workload Weight)
    -- Average UDA per Course of Treatment
    SUM(UDA) / NULLIF(SUM(COT), 0) AS avg_workload_intensity,

    -- 3. PATIENT TYPE VOLUMES (Multiplying by COT for actual activity)
    SUM(CASE WHEN PATIENT_TYPE = 'CHILD' THEN COT ELSE 0 END) AS child_cot_vol,
    SUM(CASE WHEN PATIENT_TYPE = 'NON-PAYING ADULT' THEN COT ELSE 0 END) AS nonpaying_adult_cot_vol,
    SUM(CASE WHEN PATIENT_TYPE = 'PAYING ADULT' THEN COT ELSE 0 END) AS paying_adult_cot_vol,

    -- 4. TREATMENT BAND VOLUMES (The "Service Mix")
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'BAND 1' THEN COT ELSE 0 END) AS band1_vol,
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'BAND 2A' THEN COT ELSE 0 END) AS band2a_vol,
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'BAND 2B' THEN COT ELSE 0 END) AS band2b_vol,
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'BAND 2C' THEN COT ELSE 0 END) AS band2c_vol,
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'BAND 3' THEN COT ELSE 0 END) AS band3_vol,
    
    -- 5. EMERGENCY & ADMIN LOAD
    SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'URGENT TREATMENT' THEN COT ELSE 0 END) AS urgent_cot_vol,
    -- Grouping smaller admin bands into one "Other" category for cleaner reporting
    SUM(CASE WHEN DENTAL_TREATMENT_BAND IN ('FREE', 'REGULATION 11 REPLACEMENT APPLIANCE') THEN COT ELSE 0 END) AS admin_other_vol,

    -- 6. SERVICE PRESSURE RATIO (Built-in Analytics)
    -- What % of this practice's total work is Urgent?
    ROUND(100.0 * SUM(CASE WHEN DENTAL_TREATMENT_BAND = 'URGENT TREATMENT' THEN COT ELSE 0 END) / NULLIF(SUM(COT), 0), 2) AS pressure_index_pct

FROM dtable_cleaned

GROUP BY 
    PRACTICE_CODE, 
    PRACTICE_POSTCODE;
