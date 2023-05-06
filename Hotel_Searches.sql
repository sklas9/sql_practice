/*Find the total number of searches for each room type (apartments, private, shared)
Source - https://www.youtube.com/watch?v=PE5MZW1CxOI&list=PLBTZqjSKn0IfuIqbMIqzS-waofsPHMS0E&index=6
*/

create table Hotel_Searches 
(
User_ID int,
Search_Date date,
Room_Type_Filter varchar(200)
);
insert into Hotel_Searches values
(1,'2022-01-01','entire home,private room, shared room')
,(2,'2022-01-02','entire home,shared room')
,(3,'2022-01-02','private room,shared room')
,(4,'2022-01-03','private room')
;

