/*
================================================================================
Project: Marketing Campaign Performance Analysis
Script:  01_data_validation.sql
Author:  Nicole Beri 
================================================================================
*/

/*
1. Total Row Count
Description: Determine the total number of records in the dataset to establish its size.
Findings: The dataset contains 10,000 marketing campaign records.
*/

SELECT
  COUNT(*) AS total_rows
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`;


/*
2. Duplicate Campaign ID Check
Description: Verify that each CampaignID uniquely identifies a single marketing campaign.
Findings: No duplicate campaign IDs were detected. Each record represents a unique marketing campaign. 
*/

SELECT 
  CampaignID,
  COUNT(*) AS duplicate_id
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`
GROUP BY CampaignID
HAVING COUNT(*) > 1;


/*
3. Null Value Check
Description: Verify that all required fields contain complete data and identify any missing values. 
Findings: No null values were found across any of the dataset's columns. 
*/

SELECT
  COUNTIF(CampaignID IS NULL) AS null_campaign_id,
  COUNTIF(StartDate IS NULL) AS null_start_date,
  COUNTIF(EndDate IS NULL) AS null_end_date,
  COUNTIF(Channel IS NULL) AS null_channel,
  COUNTIF(Impressions IS NULL) AS null_impressions,
  COUNTIF(Clicks IS NULL) AS null_clicks,
  COUNTIF(Leads IS NULL) AS null_leads,
  COUNTIF(Conversions IS NULL) AS null_conversions,
  COUNTIF(Cost_USD IS NULL) AS null_cost,
  COUNTIF(Revenue_USD IS NULL) AS null_revenue,
  COUNTIF(ROI IS NULL) AS null_roi
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`; 


/*
4. Marketing Channel Validation
Description: Identify the marketing channels present in the dataset and ensure category consistency.
Findings: Five distinct marketing channels were identified: Display, Influencer, Email, Social, Search.
*/

SELECT
  Channel,
  COUNT(*) AS campaign_count
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`
GROUP BY Channel
ORDER BY campaign_count DESC;


/*
5. Campaign Date Range
Description: Determine the overall timeframe period covered by the dataset.
Findings: Campaigns begin as early as January 1, 2025 and extend through January 15, 2026.
*/

SELECT 
  MIN(StartDate) AS earliest_campaign,
  MAX(EndDate) AS latest_campaign
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`;


/*
6. Chronological Validation
Description: Verify that each campaign's EndDate occurs after its StartDate.
Findings: No chronological errors were identified.
*/

SELECT
COUNTIF(EndDate < StartDate) AS date_errors
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`;


/*
7. Negative Value Check
Description: Verify that numerical performance metrics do not contain invalid negative values.
Findings: No negative values were detected in any of the numerical fields.
*/

SELECT *
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`
WHERE
  Impressions < 0
  OR Clicks < 0
  OR Leads < 0
  OR Conversions < 0 
  OR Cost_USD < 0
  OR Revenue_USD < 0;


/*
8. Marketing Funnel Validation
Description: Validate that campaign performance follows the expected marketing funnel sequence:
Impressions ≥ Clicks ≥ Leads ≥ Conversions.
Findings: No violations of the marketing funnel were identified.
*/

SELECT *
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`
WHERE
  Clicks > Impressions
  OR Leads > Clicks
  OR Conversions > Leads;
