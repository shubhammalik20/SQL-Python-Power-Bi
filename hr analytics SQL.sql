-- Employee Count
select sum(employee_count) as employee_count from hrdata;

-- Attrition Count
select count(attrition) as attrition_count from hrdata where attrition='Yes';

-- Attrition Rate
select round(count(case when attrition='Yes' then 1 end)*100/count(*),2) as attrition_rate
from hrdata;

-- Active Employee
select sum(active_employee) as active_employee from hrdata;

-- Average Age
select round(avg(age),0) as average_age from hrdata;

-- Attrition by Gender
select gender,count(attrition) as attrition_count 
from hrdata
where attrition='Yes'
group by gender
order by 2 desc;

-- Department wise Attrition
select department,count(attrition) as attrition_count,
       round(count(case when attrition='Yes' then 1 end)*100/(select count(*) from hrdata where attrition='Yes'),2) as attrition_rate
from hrdata
where attrition='Yes'
group by department
order by 2 desc;

-- No of Employee by Age Group and gender
select age_band,gender, sum(employee_count) as employee_count
from hrdata
group by 1,2
order by 1,2;

-- Education Field wise Attrition
select education_field,count(attrition) as attrition_count 
from hrdata
where attrition='Yes'
group by 1
order by 2 desc;

-- Attrition Rate by Gender for different Age Group
select age_band,gender,
	   round(count(case when attrition='Yes' then 1 end)*100/(select count(*) from hrdata where attrition='Yes'),2) as attrition_rate
from hrdata
group by 1,2
order by 1,2 desc;       

-- Job Satisfaction Rating
select job_role,
       count(case when job_satisfaction=1 then employee_count end) as '1',
       count(case when job_satisfaction=2 then employee_count end) as '2',
       count(case when job_satisfaction=3 then employee_count end) as '3',
       count(case when job_satisfaction=4 then employee_count end) as '4'
from hrdata
group by 1
order by 1;       
