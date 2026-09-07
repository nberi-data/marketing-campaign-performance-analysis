/*
=======================================================================================================
Project: Marketing Campaign Performance Analysis
Script:  02_data_cleaning_transformation.sql
Author:  Nicole Beri 
=======================================================================================================
*/

/*
Description: Prepare the validated marketing campaign dataset for analysis through data cleaning
and feature transformation. This script creates an analysis-ready table by generating derived 
date fields and key marketing performance metrics for SQL analysis and Tableau dashboard development.
*/

CREATE OR REPLACE TABLE `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned` AS
SELECT 
  CampaignID,
  StartDate,
  EndDate,
  Channel,
  Impressions,
  Clicks,
  Leads,
  Conversions,
  Cost_USD,
  Revenue_USD,
  ROI,
  DATE_DIFF(EndDate, StartDate, DAY) AS campaign_duration_days, -- Campaign duration in days
  EXTRACT(MONTH FROM StartDate) AS campaign_month_number, -- Used for chronological month sorting in Tableau
  FORMAT_DATE('%B', StartDate) AS campaign_month, -- Full month name
  CONCAT('Q', CAST(EXTRACT(QUARTER FROM StartDate) AS STRING)) AS campaign_quarter, -- Campaign quarter
  SAFE_DIVIDE(Clicks, Impressions) AS click_through_rate, -- Percentage of impressions resulting in clicks
  SAFE_DIVIDE(Leads, Clicks) AS lead_conversion_rate, -- Percentage of clicks generating leads
  SAFE_DIVIDE(Conversions, Leads) AS sales_conversion_rate, -- Percentage of leads resulting in conversions
  SAFE_DIVIDE(Cost_USD, Leads) AS cost_per_lead, -- Average cost to acquire one lead
  SAFE_DIVIDE(Cost_USD, Conversions) AS cost_per_conversion, -- Average cost to acquire one conversion
  SAFE_DIVIDE(Revenue_USD, Cost_USD) AS return_on_ad_spend, -- Revenue generated per advertising dollar spent
  Revenue_USD - Cost_USD AS profit -- Net profit per campaign
  FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_data`;
