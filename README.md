# Edmonton-Property-Assessment-Analysis

# Project Overview
This project is a data analytics exploration of Edmonton’s current-year property assessment data. The goal is to provide insights into property valuations, neighborhood trends, and property characteristics for the 2025 calendar year.

# Data Source
The dataset used in this project is publicly available from the City of Edmonton Open Data Portal

Columns in this dataset include:

  - ACCOUNT_NUMBER: Unique property identifier
  - LEGAL_DESC: Legal description of the property
  - PROPERTY_CLASS: Type of property (residential, commercial, etc.)
  - NEIGHBOURHOOD: Property location
  - ASSESSMENT_YEAR: Year of assessment
  - ASSESSED_VALUE: Property assessed value
  - LOT_AREA: Size of the lot (m²)
  - BUILT_YEAR: Year the property was built

# SQL Workflow:

# Data Cleaning (01_data_cleaning.sql)

  - Remove duplicates
  - Handle missing or inconsistent data
  - Standardize categorical fields
  - Ensure numeric fields are correctly formatted

# Analysis (02_analysis_queries.sql)

  - Average, median, and distribution of assessed values
  - Trends by neighborhood and property type
  - Correlations between lot size, year built, and assessed value
  - Outlier detection

# Visualization Queries (03_visualization_queries.sql)
  - Top neighborhoods by property value
  - Year-over-year assessment changes
  - Property type distribution

# SQL Analysis
SQL queries for this project are available in the [sql_queries.sql](./sql_queries.sql) file.  
