create table person(
    PersonID varchar(10),
    Name varchar(25),
    Email varchar(25),
    Score int 
    );

create table friend(
    PersonID varchar(10),
    FriendID varchar(10)
    );

# Q) Find personID, name, number of friends, sum of marks of person who has friends with total score greater than 100
# source - https://www.youtube.com/watch?v=SfzbR69LquU&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=6

with friends_score as 
(
    select distinct f.PersonID, f.FriendID, p.Score 
    from friend f join person p
    on f.FriendID = p.PersonID;
)

select p.PersonID, p.Name, count(distinct fs.FriendID), sum(p.score) as my_score, sum(fs.score) as friends_score
from person p join friends_score fs
on p.PersonID = fs.PersonID
group by p.PersonID, p.Name
having sum(fs.score) > 100
