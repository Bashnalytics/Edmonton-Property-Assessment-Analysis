-- 1. Remove Duplicates
DELETE FROM property_assessment
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM property_assessment
    GROUP BY ACCOUNT_NUMBER
);

-- 2. Handle Missing Values
-- Check for missing critical fields
SELECT
    COUNT(*) AS missing_values,
    SUM(CASE WHEN ASSESSED_VALUE IS NULL THEN 1 ELSE 0 END) AS missing_assessed_value,
    SUM(CASE WHEN NEIGHBOURHOOD IS NULL THEN 1 ELSE 0 END) AS missing_neighbourhood,
    SUM(CASE WHEN PROPERTY_CLASS IS NULL THEN 1 ELSE 0 END) AS missing_property_class
FROM property_assessment;

-- 3. Standardize Property Type
UPDATE property_assessment
SET PROPERTY_CLASS = UPPER(TRIM(PROPERTY_CLASS));

-- 4. Convert ASSESSED_VALUE to Numeric
ALTER TABLE property_assessment
ALTER COLUMN ASSESSED_VALUE TYPE NUMERIC;

-- 5. Average Assessment by Neighborhood
SELECT NEIGHBOURHOOD,
       ROUND(AVG(ASSESSED_VALUE), 2) AS avg_assessed_value,
       COUNT(*) AS total_properties
FROM property_assessment
GROUP BY NEIGHBOURHOOD
ORDER BY avg_assessed_value DESC
LIMIT 5;

-- 6. Assessment Trend by Property Class
SELECT PROPERTY_CLASS,
       ROUND(AVG(ASSESSED_VALUE), 2) AS avg_value
FROM property_assessment
GROUP BY PROPERTY_CLASS
ORDER BY avg_value DESC;

-- 7. Outlier Detection (High Assessment)
SELECT ACCOUNT_NUMBER, NEIGHBOURHOOD, ASSESSED_VALUE
FROM property_assessment
WHERE ASSESSED_VALUE > (SELECT AVG(ASSESSED_VALUE) + 2*STDDEV(ASSESSED_VALUE) FROM property_assessment)
ORDER BY ASSESSED_VALUE DESC
LIMIT 5;

-- 8. Top 5 Neighborhoods by Total Assessed Value
SELECT NEIGHBOURHOOD,
       SUM(ASSESSED_VALUE) AS total_value
FROM property_assessment
GROUP BY NEIGHBOURHOOD
ORDER BY total_value DESC
LIMIT 5;

-- 9. Year Built Distribution
SELECT BUILT_YEAR, COUNT(*) AS property_count
FROM property_assessment
GROUP BY BUILT_YEAR
ORDER BY BUILT_YEAR;

