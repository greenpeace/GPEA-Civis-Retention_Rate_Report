---Monthcount import: https://platform.civisanalytics.com/spa/#/imports/23588454


----Report_RetentionReport1
CREATE TEMP TABLE supporter_count_newdonor AS 
select * from
(select a.rgid,a.region,a.contactid,c.constituentid,a.signupyear,a.signupmonth,a.signupdate,a.firstpaymentdate,d.monthcount,b.programme,b.resource,b.team,b.name,a.recruiter,c.agebandrgsignup as AgeGroup, a.paymentmethod,a.rgstatus,d.active,a.fixeddonationperiod,a.delaydonation,a.bothfixeddelay from 
gpea_analytics.extract_regulargiving a
left join gpea_analytics.extract_campaign b on a.campaignid=b.campaignid
inner join gpea_analytics.extract_contact c on a.contactid=c.contactid
cross join
(select * from gpea_staging.monthcount where active=1) d
where a.signupyear>=2014);