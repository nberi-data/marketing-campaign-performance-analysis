/*
=======================================================================================================
Project: Marketing Campaign Performance Analysis
Script:  03_data_analysis.sql
Author:  Nicole Beri 
=======================================================================================================
*/

/*
Description: Analyze the cleaned marketing campaign dataset to answer key business questions,
evaluate campaign performance across marketing channels, and identify trends that 
support data-driven marketing decisions and dashboard development. 
*/


-- 1. Overall Campaign Performance
SELECT
  COUNT(*) AS total_campaigns,
  SUM(Cost_USD) AS total_ad_spend,
  SUM(Revenue_USD) AS total_revenue,
  SUM(profit) AS total_profit,
  AVG(ROI) AS average_roi,
  AVG(return_on_ad_spend) AS average_roas,
  AVG(click_through_rate) AS average_ctr
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`;


-- 2. Marketing Channel Performance 
SELECT
  Channel,
  COUNT(*) AS campaigns,
  SUM(Cost_USD) AS total_cost,
  SUM(Revenue_USD) AS total_revenue,
  SUM(profit) AS total_profit,
  AVG(ROI) AS average_roi,
  AVG(return_on_ad_spend) AS average_roas
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY Channel
ORDER BY total_profit DESC;


-- 3. Customer Engagement by Channel
SELECT
  Channel,
  AVG(click_through_rate) AS average_ctr,
  AVG(lead_conversion_rate) AS average_lead_conversion_rate,
  AVG(sales_conversion_rate) AS average_sales_conversion_rate
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY Channel
ORDER BY average_ctr DESC;


--4. Cost Efficiency by Channel
SELECT
  Channel,
  AVG(cost_per_lead) AS average_cost_per_lead,
  AVG(cost_per_conversion) AS average_cost_per_conversion
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY Channel
ORDER BY average_cost_per_conversion;


-- 5. Monthly Campaign Performance
SELECT
  campaign_month_number,
  campaign_month,
  COUNT(*) AS campaigns,
  SUM(Revenue_USD) AS revenue,
  SUM(profit) AS total_profit,
  AVG(ROI) AS average_roi,
  AVG(return_on_ad_spend) AS average_roas
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY
campaign_month_number,
campaign_month
ORDER BY campaign_month_number;


-- 6. Quarterly Performance
SELECT
  campaign_quarter,
  SUM(Revenue_USD) AS revenue,
  SUM(profit) AS total_profit,
  AVG(ROI) AS average_roi
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY campaign_quarter
ORDER BY campaign_quarter;


-- 7. Top 10 Campaigns by Profit
SELECT
  CampaignID,
  Channel,
  Revenue_USD,
  Cost_USD,
  profit,
  ROI
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
ORDER BY profit DESC
LIMIT 10;


-- 8. Campaign Performance by Duration 
SELECT
  CASE
    WHEN campaign_duration_days <= 5 THEN 'Short-Term (<=5 Days)'
    WHEN campaign_duration_days BETWEEN 6 AND 10 THEN 'Mid-Term (6-10 Days)'
    ELSE 'Long-Term (>10 Days)'
  END AS duration_bucket,
  COUNT(*) AS campaign_count,
  SUM(profit) AS total_profit,
  AVG(return_on_ad_spend) AS average_roas,
  AVG(sales_conversion_rate) AS average_sales_conversion_rate
FROM `marketing-campaign-analysis7.marketing_analytics.marketing_campaign_cleaned`
GROUP BY duration_bucket
ORDER BY total_profit DESC;
