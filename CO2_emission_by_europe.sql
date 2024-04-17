select * from FuelConsumption;





select make , length(make) from FuelConsumption;

select * from FuelConsumption;

select concat(make,'',model) ,make,model from FuelConsumption;


select * from FuelConsumption;

select sum(co2emissions) from FuelConsumption;

select max(co2emissions) from FuelConsumption;

select min(co2emissions) from FuelConsumption;


select round(avg(co2emissions),3) from FuelConsumption;

-- Q 1 large co2emisson by car brand 

select make,  max(co2emissions) as max_co2_by_company 
from  FuelConsumption 
group by (make)
order by max_co2_by_company desc
;


-- Q 2 large co2emisson by enginesize 

select enginesize ,round(avg(co2emissions),2) as co2_emission_by_enginesize
from FuelConsumption 
group by enginesize 
order by co2_emission_by_enginesize desc ;


select make , max(enginesize) as max_engine_by_brand 
from FuelConsumption
group by make 
order by max_engine_by_brand desc ;


-- Q3 which car brand makin more than avg co2_emission 
select make , avg(co2emissions) as max_co2_emission_by_brand 
from FuelConsumption
group by make 
having  avg(co2emissions) > 256 
order by  max_co2_emission_by_brand  desc ;
-- "LAMBORGHINI"



-- Q4 whiach brand is makin max co2emission 
select make , max(co2emissions) as max_co2_emission_by_brand 
from FuelConsumption
group by make 
having  avg(co2emissions) > 256 
order by  max_co2_emission_by_brand  desc ;

-- ford 


-- Q5 which car makin max co2genaration 
select model , max(co2emissions) as max_co2_emission_by_brand 
from FuelConsumption
group by model
order by  max_co2_emission_by_brand  desc ;
-- "E350 WAGON"

select avg(co2emissions) as max_co2_emission_by_brand 

select * from FuelConsumption



-- Q6 how nuch special-purpose-vechicle makin co2emision ? 

select make, model,enginesize ,vehicleclass , co2emissions
from fuelconsumption 
where vehicleclass in ('SPECIAL PURPOSE VEHICLE')
order by co2emissions desc



-- What are the top 5 car brands with the highest average number of cylinders? 

SELECT MAKE, AVG(CYLINDERS) AS AVG_CYLINDERS
FROM FuelConsumption
GROUP BY MAKE
ORDER BY AVG_CYLINDERS DESC
LIMIT 5;


-- Which car brands produce vehicles with the highest average fuel consumption on highways, and what is the average fuel consumption for each brand?

SELECT MAKE, AVG(FUELCONSUMPTION_HWY) AS AVG_HWY_CONSUMPTION
FROM FuelConsumption
GROUP BY MAKE
ORDER BY AVG_HWY_CONSUMPTION DESC;  


-- How many vehicles have more than 6 cylinders and an engine size greater than 3.5?

SELECT COUNT(*) AS NUM_VEHICLES
FROM FuelConsumption
WHERE CYLINDERS > 6 AND ENGINESIZE > 3.5;


-- Which transmission type has the highest average CO2 emissions, and what is the average CO2 emission for that transmission type?

SELECT TRANSMISSION, AVG(CO2EMISSIONS) AS AVG_CO2_EMISSIONS
FROM FuelConsumption
GROUP BY TRANSMISSION
ORDER BY AVG_CO2_EMISSIONS DESC
LIMIT 1;



-- Which car models have the lowest CO2 emissions per engine size (in liters), and what are the CO2 emissions per engine size for those models?
SELECT MODEL, ROUND(MIN(CO2EMISSIONS / ENGINESIZE), 2) AS MIN_CO2_PER_ENGINE_SIZE
FROM FuelConsumption
GROUP BY MODEL
ORDER BY MIN_CO2_PER_ENGINE_SIZE ASC;


-- What is the average CO2 emission per cylinder for vehicles produced by car brands that have a fuel consumption greater than 11 liters per 100 km in the city?

SELECT ROUND(AVG(CO2EMISSIONS / CYLINDERS), 2) AS AVG_CO2_PER_CYLINDER
FROM FuelConsumption
WHERE MAKE IN (SELECT MAKE
               FROM FuelConsumption
               WHERE FUELCONSUMPTION_CITY > 11);


-- How many vehicles have a fuel consumption (combined) greater than the average fuel consumption of vehicles with 6 cylinders?

SELECT COUNT(*) AS NUM_VEHICLES
FROM FuelConsumption
WHERE FUELCONSUMPTION_COMB > (
    SELECT AVG(FUELCONSUMPTION_COMB)
    FROM FuelConsumption
    WHERE CYLINDERS = 6
);



















