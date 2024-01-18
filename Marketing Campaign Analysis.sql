                    
					                 -- ANALYSIS OF CAMPAIGNS PERFORMANCE --

  select *
  from marketing_campaign_dataset
  -----------------------------------------------------------------------------------------------------------------------
  -- Table Overview 
  select (Campaign_Type),avg(Durations_days) as avg_duration, avg(ROI) as avg_ROI, sum(Clicks) as total_clicks,sum(Impressions) as total_impression,  -- Campaign overview
  min(Engagement_Score) as min_engagement_score,
  max(Engagement_Score) as max_engagement_score,
  avg(Engagement_Score ) as avg_engagement_score
  from marketing_campaign_dataset
  group by Campaign_Type

  select distinct(Target_Audience)
  from marketing_campaign_dataset

  select distinct(Channel_Used)

  from marketing_campaign_dataset

  select distinct(location)
  from marketing_campaign_dataset 

  select distinct(Customer_Segment)
  from marketing_campaign_dataset


  select Campaign_Type ,count(Campaign_ID) as campaign_count
  from marketing_campaign_dataset 
  group by Campaign_Type
  order by campaign_count desc
  ------------------------------------------------------------------------------------

  
                                                                           -- FINDING FACTORS OF HIGH AND LOW PERFORMANCE CAMPAIGN  --


  -- Identify Top Performing Campaigns by Clicks
  select sum(clicks)
  from marketing_campaign_dataset

  select  Campaign_Type, sum(cast(Clicks as decimal)) / 109954406 as percentage_of_total_clicks
  from marketing_campaign_dataset
  group by Campaign_Type
  order by percentage_of_total_clicks desc
  -------------------------------------------------------------------------

  -- Calculate Average Engagement Score by Campaign Type:
  select Campaign_Type, AVG(Engagement_Score) AS avg_engagement_score
  from marketing_campaign_dataset
  group by Campaign_Type
  order by avg_engagement_score desc
  ----------------------------------------------------------------------------

  -- Explore Language Distribution in Campaigns:
  select Campaign_Type,
  COUNT(CASE WHEN Language = 'English' then 1 else  null end ) as English_destribution,
  COUNT(CASE WHEN Language = 'German' then 1 else  null end)as German_destribution,
  COUNT(CASE WHEN Language = 'Mandarin' then 1 else   null  end ) as Mandarin_destribution,
  COUNT(CASE WHEN Language = 'French' then 1 else  null   end    ) as French_destribution,
  COUNT(CASE WHEN Language = 'Spanish' then 1 else null   end ) as Spanish_destribution
  from marketing_campaign_dataset
  group by Campaign_Type
------------------------------------------------------------------------------------
 -- Evaluate Channel Performance by ROI

 select Channel_Used, min( ROI) as min_ROI,
 avg(ROI) as avg_ROI,
 max( ROI ) as max_ROI
 from marketing_campaign_dataset
 group by Channel_Used


                                                                                    -- Find factors of performance ( ROI, cost, Impression, clicks) --
select sum(Impressions)
from marketing_campaign_dataset -- 1101460304

select sum( Clicks)
from marketing_campaign_dataset -- 109954406

select Campaign_Type, avg(roi) as avg_roi,
avg(acquisition_cost) as avg_acquisition_cost,
sum(cast(Impressions as decimal)) / 1101460304 * 100 as impressions_percent_of_total,
sum(cast(clicks as decimal)) /  109954406 * 100 as clicks_percent_of_total
 from marketing_campaign_dataset
 group by Campaign_Type
 order by avg_roi desc
  -- Highhest ROI campain  - Influencer  
  -- Lowest  ROI  campaign - Social Media




--------------------------------------------------------------------------------------------------------------------
--number of camppaign by campaign type
 select Campaign_Type ,count(Campaign_ID) as campaign_count
  from marketing_campaign_dataset 
  group by Campaign_Type
  order by campaign_count desc

  select count(Campaign_ID) -- total count of campaigns 
  from marketing_campaign_dataset -- 200000


-- analysing which location has best performance 
select avg(ROI)
from marketing_campaign_dataset -- 5.00243784989715

select Location,  count(Location) as count_locations, avg(roi) as avg_roi
from marketing_campaign_dataset
group by location
having avg(ROI) >  5.00243784989715
order by  count_locations desc

select Location,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
group by Location
having avg(roi) >  5.00243784989715
order by  total_clicks desc


--count of campaign by locations
 select Location ,count(Campaign_ID) as count_campaign_by_locations
  from marketing_campaign_dataset 
  group by Location
  order by count_campaign_by_locations desc
-- Miami




-- analysing which Target_Audience  has best performance
select Target_Audience,  count(target_audience) as count_of_audience, avg(roi) as avg_roi
from marketing_campaign_dataset
group by Target_Audience
having avg(roi) > 5.00243784989715
order by  count_of_audience desc

select Target_Audience,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
group by Target_Audience
having avg(roi) >  5.00243784989715
  order by total_clicks desc

select
count(case when Target_Audience = 'Women 25-34' then 1 else null end ) as count_of_Women_25_34_,
count(case when Target_Audience = 'Men 25-34' then 1 else null end ) as count_of_men_25_34
from marketing_campaign_dataset

--count of campaign by Target_Audience
 select Target_Audience ,count(Campaign_ID) as count_campaign_by_Target_Audience
  from marketing_campaign_dataset 
  group by Target_Audience
  order by count_campaign_by_Target_Audience desc

--  based on 4 last tables - Men 25 -34





--analysing which Channel has best performance
select Channel_used ,   count(channel_used)  as count_of_channel , avg(roi) as avg_roi
from marketing_campaign_dataset
group by Channel_Used
having avg(roi) > 5.00243784989715
order by count_of_channel desc

 select channel_used,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
where channel_used ='Google Ads' 
group by Channel_Used
union
 select channel_used,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
where channel_used ='Website'
group by Channel_Used 

--count of campaign by Channel_Used
 select Channel_Used ,count(Campaign_ID) as count_campaign_by_Channel_Used
  from marketing_campaign_dataset 
  group by Channel_Used
  order by count_campaign_by_Channel_Used desc
-- based on 3 last tables - Website




--analysing which Customer_Segment has best performance
select Customer_Segment ,count(Customer_Segment) as count_segment  ,avg(ROI) as avg_roi
from marketing_campaign_dataset
group by customer_segment
having avg(roi) > 5.00243784989715
order by avg_roi desc

select Customer_Segment,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
group by Customer_Segment
having avg(roi) >  5.00243784989715
  order by total_clicks desc 

  --count of campaign by Customer_Segment
 select Customer_Segment ,count(Campaign_ID) as count_campaign_by_Customer_Segment
  from marketing_campaign_dataset 
  group by Customer_Segment
  order by count_campaign_by_Customer_Segment desc
  -- based on 2 last tables - Foodies



  --analysing which Company has best performance
 select Company, count(company ), avg(roi) as avg_roi
 from marketing_campaign_dataset
 group by Company
 having avg(roi) > 5.00243784989715
 order by avg_roi desc

 select Company,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
group by Company
having avg(roi) >  5.00243784989715
order by total_cost_ desc 
-- based on 2 last tables - TechCorp




select Durations_days, count(Durations_days) ,avg(ROI) as avg_roi
from marketing_campaign_dataset
group by Durations_days
having avg(roi) >  5.00243784989715
order by avg_roi desc

 select Durations_days,  sum(Clicks) as total_clicks, sum( Impressions) as total_impressions, sum(Acquisition_Cost) as total_cost_, avg(Engagement_Score) as avg_engmnt_score
from marketing_campaign_dataset
group by Durations_days
having avg(roi) >  5.00243784989715
order by total_cost_ desc 
--last 2 tables reveales that 30 days durations of campaign tend to perform best among other duration days 
--------------------------------------------------------------------------------------------------------------------

-- comparing best performace of ( Location, Target_Audience, Channel_used, Customer_Segment, Company, Durations_days )
-- to compare contribution of to total clicks
select sum(Clicks)
from marketing_campaign_dataset -- 109954406

select 
sum( case when  
from marketing_campaign_dataset


select
( select  sum(cast(clicks as decimal)) / 109954406 * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Location = 'Miami' ) as percent_Of_total_clicks_Miami,
(select  sum(cast(clicks as decimal)) / 109954406  * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Target_Audience = 'Men 25-34') as percent_Of_total_clicks_Men_25_34,
(select  sum(cast(clicks as decimal)) / 109954406  * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Channel_used = 'Website') as percent_Of_total_clicks_Website,
(select  sum(cast(clicks as decimal)) / 109954406  * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Customer_Segment = 'Foodies') as percent_Of_total_clicks_Foodies,
(select  sum(cast(clicks as decimal)) / 109954406  * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Company = 'TechCorp') as percent_Of_total_clicks_TechCorp,
(select  sum(cast(clicks as decimal)) / 109954406  * 100 as percent_Of_total_clicks
from marketing_campaign_dataset
where Durations_days = 30 ) as percent_Of_total_clicks_Durations_days_30
-- Top factors that made the most commitment to total clicks 
-- percent_Of_total_clicks Durations_days_30    - 25.147500  the highest
-- percent_Of_total_clicks Miami                - 20.059900  the lowest


-- Now I will be running same table use another column ( Impresssion )

select sum(Impressions)
from marketing_campaign_dataset -- 1101460304

select
( select  sum(cast(Impressions as decimal)) / 1101460304 * 100 as percent_Of_total_Impressions
from marketing_campaign_dataset
where Location = 'Miami' ) as percent_Of_total_clicks_Miami,
(select  sum(cast(Impressions as decimal)) / 1101460304  * 100 as percent_Of_Miami
from marketing_campaign_dataset
where Target_Audience = 'Men 25-34') as percent_Of_total_clicks_Men_25_34,
(select  sum(cast(Impressions as decimal)) / 1101460304  * 100 as percent_Of_Men_25_34
from marketing_campaign_dataset
where Channel_used = 'Website') as percent_Of_total_clicks_Website,
(select  sum(cast(Impressions as decimal)) / 1101460304  * 100 as percent_Of_Website
from marketing_campaign_dataset
where Customer_Segment = 'Foodies') as percent_Of_total_clicks_Foodies,
(select  sum(cast(Impressions as decimal)) / 1101460304  * 100 as percent_Of_Foodies
from marketing_campaign_dataset
where Company = 'TechCorp') as percent_Of_total_clicks_TechCorp,
(select  sum(cast(Impressions as decimal)) / 1101460304  * 100 as percent_Of_TechCorp
from marketing_campaign_dataset
where Durations_days = 30 ) as percent_Of_total_clicks_Durations_days_30
-- Results for total impressions
-- percent_Of_total_clicks Durations_days_30    - 25.070700 the highest
-- percent_Of_total_clicks Website              - 16.687500  the lowest

-- comparing to find the highest avg ROI
select 
( select avg(ROI) 
from marketing_campaign_dataset
where Location = 'Miami' ) as avg_roi_Miami_Location,
( select avg(ROI) 
from marketing_campaign_dataset
where Target_Audience = 'Men 25-34' ) as avg_roi_Men_25_34_Target_Audience_,
( select avg(ROI) 
from marketing_campaign_dataset
where Channel_used = 'Website' ) as avg_roi_Website_Channel_used_,
( select avg(ROI) 
from marketing_campaign_dataset
where Customer_Segment = 'Foodies' ) as avg_roi_Foodies_Customer_Segment_,
( select avg(ROI) 
from marketing_campaign_dataset
where Company = 'TechCorp' ) as avg_roi_TechCorp_Company_,
( select avg(ROI) 
from marketing_campaign_dataset
where Durations_days = 30 ) as avg_roi_duration_30_days_Durations_days_
-- avg_roi_Men_25_34_Target_Audience   -  5.02062713860113 the highest
-- avg_roi_Foodies_Customer_Segment    -  5.00437574594371 the lowest


-- comparing aquisition cost 
select 
( select sum(Acquisition_Cost) / 2500878608.00
from marketing_campaign_dataset
where Location = 'Miami' ) as cost_by_Miami_Location,
( select sum(Acquisition_Cost) 
from marketing_campaign_dataset
where Target_Audience = 'Men 25-34' ) as cost_Men_25_34_Target_Audience,
( select sum(Acquisition_Cost) 
from marketing_campaign_dataset
where Channel_used = 'Website' ) as cost_Website_Channel_used_,
( select sum(Acquisition_Cost)  
from marketing_campaign_dataset
where Customer_Segment = 'Foodies' ) as cost_Foodies_Customer_Segment_,
( select sum(Acquisition_Cost) 
from marketing_campaign_dataset
where Company = 'TechCorp' ) as cost_TechCorp_Company_,
( select sum(Acquisition_Cost) 
from marketing_campaign_dataset
where Durations_days = 30 ) as cost_duration_30_days_
-- cost_Website_Channel_used_    - 416593500.00 the lowest
-- cost_duration_30_days_        - 627695470.00 the highest
-------------------------------------------------------------------------------
--Total Clicks percent of total
--  percent_Of_total_clicks Durations_days_30    - 25.1 %  the highest
--  percent_Of_total_clicks Miami                - 20 %  the lowest

--Total impression Percent of total
--  percent_Of_total_clicks Durations_days_30    - 25 % the highest
--  percent_Of_total_clicks Website              - 16.6 %  the lowest

--Avg(ROI)
--  Men_25_34_Target_Audience   -  5.020 % the highest
--  Foodies_Customer_Segment    -  5.004 % the lowest

-- Total cost
--  cost_Website_Channel_used_    - 416593500.00 the lowest
--  cost_duration_30_days_        - 627695470.00 the highest
---------------------------------------------------------------------------------




-- comparing campaign performance by ROI, cost, impression, clicks 
select Campaign_Type, avg(roi) as avg_roi,
avg(acquisition_cost) as avg_acquisition_cost,
sum(cast(Impressions as decimal)) / 1101460304 * 100 as impressions_percent_of_total,
sum(cast(clicks as decimal)) /  109954406 * 100 as clicks_percent_of_total
 from marketing_campaign_dataset
 group by Campaign_Type
 order by avg_roi desc
  -- Highhest ROI campain  - Influencer  
  -- Lowest  ROI  campaign - Social Media



-- creating table with avg ROI for each campaign by month
select month(Date) as month_,
avg(case when Campaign_Type = 'Influencer' then ROI else null end ) as Influencer_avg_roi_by_month,
avg(case when Campaign_Type = 'Search' then ROI else null end ) as Search_avg_roi_by_month,
avg(case when Campaign_Type = 'Display' then ROI else null end ) as Display_avg_roi_by_month,
avg(case when Campaign_Type = 'Email' then ROI else null end ) as Email_avg_roi_by_month,
avg(case when Campaign_Type = 'Social Media' then ROI else null end ) as Social_Media_avg_roi_by_month
into dbo.avg_roi
from marketing_campaign_dataset
group by month(Date)

--in which month each campaign has the lowest avg ROI ?
select top 1 month_ , min(Influencer_avg_roi_by_month) as min_Influencer_avg_roi_by_month
from avg_roi
group by month_
order by min_Influencer_avg_roi_by_month
------------------------------------------------------------------------------------
select top 1 month_ , min(Search_avg_roi_by_month) as min_Search_avg_roi_by_month
from avg_roi
group by month_
order by min_Search_avg_roi_by_month
------------------------------------------------------------------------------------
select top 1 month_ , min(Display_avg_roi_by_month) as min_Display_avg_roi_by_month
from avg_roi
group by month_
order by min_Display_avg_roi_by_month
------------------------------------------------------------------------------------
select top 1 month_ , min(Email_avg_roi_by_month) as min_Email_avg_roi_by_month
from avg_roi
group by month_
order by  min_Email_avg_roi_by_month
------------------------------------------------------------------------------------
select top 1 month_ , min(Social_Media_avg_roi_by_month) as min_Social_Media_avg_roi_by_month
from avg_roi
group by month_
order by  min_Social_Media_avg_roi_by_month

  -- Same process can be done for Clicks and Impressions, costs
 

















 









