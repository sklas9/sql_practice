/* Source - https://www.youtube.com/watch?v=dOLBRfwzYcU&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E 
Find number of gold medals won by swimmers who only won Gold */

CREATE TABLE Olypmic_Events (
ID int,
Event varchar(255),
Year INt,
Gold varchar(255),
Silver varchar(255),
Bronze varchar(255)
);

INSERT INTO Olympic_Events VALUES (1,'100m',2016, 'Amthhew Mcgarray','donald','barbara');
INSERT INTO Olympic_Events VALUES (2,'200m',2016, 'Nichole','Alvaro Eaton','janet Smith');
INSERT INTO Olympic_Events VALUES (3,'500m',2016, 'Charles','Nichole','Susana');
INSERT INTO Olympic_Events VALUES (4,'100m',2016, 'Ronald','maria','paula');
INSERT INTO Olympic_Events VALUES (5,'200m',2016, 'Alfred','carol','Steven');
INSERT INTO Olympic_Events VALUES (6,'500m',2016, 'Nichole','Alfred','Brandon');
INSERT INTO Olympic_Events VALUES (7,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO Olympic_Events VALUES (8,'200m',2016, 'Thomas','Dawn','catherine');
INSERT INTO Olympic_Events VALUES (9,'500m',2016, 'Thomas','Dennis','paula');
INSERT INTO Olympic_Events VALUES (10,'100m',2016, 'Charles','Dennis','Susana');
INSERT INTO Olympic_Events VALUES (11,'200m',2016, 'jessica','Donald','Stefeney');
INSERT INTO Olympic_Events VALUES (12,'500m',2016,'Thomas','Steven','Catherine');


select Year, Gold as Athlete_Name, count(1) as Gold_Medal_Count
from Olympic_Events 
where Gold not in 
(
  select Silver from Olympic_Events
	union
	select Bronze from Olympic_Events
 )
group by Year, Athlete_Name
order by Year, Gold_Medal_Count;



with pivot_down_data as 
(
    select ID, Event, Year, Gold as Athlete_Name, 'Gold' as Medal from Olympic_Events
    union
    select ID, Event, Year, Silver as Athlete_Name, 'Silver' as Medal from Olympic_Events
    union
    select ID, Event, Year, Bronze as Athlete_Name, 'Bronze' as Medal from Olympic_Events
)
select Year, Athlete_Name, count(1) as Gold_Medal_Count
from pivot_down_data
group by Year, Athlete_Name
/*distinct medal ensures that the athlete only has single type of medal, min or max will give same result since the disctinct filter makes sure that only single medal is present*/
having count(distinct Medal)=1 and min(Medal) = 'Gold'
order by Year, Gold_Medal_Count;




