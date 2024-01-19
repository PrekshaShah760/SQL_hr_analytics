
#Employee Count:
select sum(emaployee_count) as emp_count from hrdata 

#Attrition Count:
select count(attrition) from hrdata where attrition='Yes';

#Attrition Rate:
select 
round (((select count(attrition) from hrdata where attrition='Yes')/ 
sum(employee_count)) * 100,2)
from hrdata;

#Active Employee:
select sum(employee_count) - (select count(attrition) from hrdata  where attrition='Yes') from hrdata;
#OR
select (select sum(employee_count) from hrdata) - count(attrition) as active_employee from hrdata
where attrition='Yes';

#Average Age:
select round(avg(age),0) from hrdata;

#Attrition by Gender:
select gender, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by gender
order by count(attrition) desc;

#Department wise Attrition:
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from hrdata where attrition= 'Yes')) * 100, 2) as pct from hrdata
where attrition='Yes'
group by department 
order by count(attrition) desc;

#No of Employee by Age Group:
SELECT age,  sum(employee_count) AS employee_count FROM hrdata
GROUP BY age
order by age;

#Education Field wise Attrition:
select education_field, count(attrition) as attrition_count from hrdata
where attrition='Yes'
group by education_field
order by count(attrition) desc;

#Attrition Rate by Gender for different Age Group:
select age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from hrdata where attrition = 'Yes')) * 100,2) as pct
from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender desc;

#Attrition by age_band based on power bi dashboard:
select age_band,gender,sum(employee_count) as total_emp from hrdata group by age_band,gender 
order by age_band,gender desc




--select sum(emaployee_count) as emp_count from hrdata 
--where education='High School' or education='Associates Degree'
--or education='Masters Degree' or education='Bachelors Degree'
--or education='Doctoral Degree'
--where department='R&D'
--where education_field='Medical' 

--select count(attrition) from hrdata
--where attrition='Yes' and education='Doctoral Degree'
--where attrition='Yes' and education='Doctoral Degree' 
--where attrition='Yes' and department='R&D' and education_field='Medical' 
-- and education='High School'

--select round(((select count(attrition) from hrdata where attrition='Yes' and  department='Sales')/
--sum(emaployee_count))*100,2) from hrdata 
--where department='Sales' 

--select sum(emaployee_count)-(select count(attrition) from hrdata where attrition='Yes' 
--							 and gender='Male')from hrdata where gender='Male'

--select round(avg(age),0) as avg_age from hrdata

--atrrtion by gender
--select gender,count(attrition) from hrdata where attrition='Yes' and education='High School' 
--group by gender order by count(attrition) desc;

--attrtion by department
--select department,count(attrition),round((cast(count(attrition) as numeric)/(select count(attrition) 
--from hrdata 
--where attrition='Yes' and gender='Female'))*100,2) 
--from hrdata
--where attrition='Yes' and gender='Female'
--group by department 
--order by count(attrition) desc


--attrition by age
--select age,sum(emaployee_count) from hrdata where department='R&D' group by age order by age

--attrition by education
--select education_field, count(attrition) from hrdata where attrition='Yes' 
--and department='Sales'
--group by education_field 
--order by count(attrition) desc


--attrition by age_band
select age_band,gender,count(attrition),round((cast(count(attrition)as numeric)/(select count(attrition) from hrdata 
where attrition='Yes'))*100,2)
from hrdata where attrition='Yes' group by age_band,gender
order by age_band,gender

--attrition by age_band based on power bi dashboard
select age_band,gender,sum(emaployee_count) as total_emp from hrdata group by age_band,gender 
order by age_band,gender desc
	
	
	
