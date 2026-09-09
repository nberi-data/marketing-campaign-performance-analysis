# Marketing Campaign Performance Analysis
## Project Overview
This project analyzes the performance of 10,000 marketing campaigns across five advertising channels (Display, Email, Influencer, Search, and Social). The analysis evaluates campaign profitability, return on investment (ROI), return on ad spend (ROAS), conversion efficiency, and performance throughout the marketing funnel, from impressions and clicks to leads and conversions. The goal is to identify high-performing channels, uncover optimization opportunities, and translate campaign performance data into actionable business recommendations. 
- **Tableau Public Dashboard:** [View Interactive Dashboard](https://public.tableau.com/app/profile/nicole.beri/viz/Marketing_Campaign_Performance_Analysis/MainDashboard)

## Business Objective
The analysis aims to maximize capital efficiency and optimize funnel performance by identifying which channels deliver the strongest returns and conversion performance, pinpointing underperformance, and assessing where improvements can be made across the marketing funnel.

## Data
The dataset contains marketing campaign performance data across the following advertising channels:
- Display
- Email
- Influencer
- Search
- Social

Key metrics include impressions, clicks, leads, conversions, cost, revenue, and ROI.

The original dataset was obtained from Kaggle. The original Kaggle listing is no longer available; a copy of the original dataset used for this analysis is included in the [Data](https://github.com/nberi-data/marketing-campaign-performance-analysis/tree/main/data) folder of this repository. 
- **Data Source:** [View Dataset](https://raw.githubusercontent.com/nberi-data/marketing-campaign-performance-analysis/refs/heads/main/data/marketing_campaign_dataset.csv)

## Tools & Skills Used
- **SQL:** Data validation, cleaning, transformation, feature engineering, and analysis.
- **Tableau:** Interactive dashboard design, data visualization, calculated fields, dynamic filters, and data storytelling.

## Data Validation 
The dataset was validated using SQL prior to analysis. 

Data quality checks confirmed:
- 10,000 unique campaign records (no duplicates)
- No null values
- No negative values in numerical performance metrics
- No chronological errors between campaign start and end dates
- No violations in the expected marketing funnel sequence

View the data validation and quality check queries here: [sql/01_data_validation.sql](sql/01_data_validation.sql)

