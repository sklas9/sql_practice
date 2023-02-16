#Question source - https://www.youtube.com/watch?v=qyAgWL066Vo&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=1

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('IN','SL','IN');
INSERT INTO icc_world_cup values('SL','AT','AT');
INSERT INTO icc_world_cup values('SA','GB','GB');
INSERT INTO icc_world_cup values('GB','NZ','NZ');
INSERT INTO icc_world_cup values('AT','IN','IN');
INSERT INTO icc_world_cup values('IN','NZ','IN')

select team_name, count(1) as matches_played, sum(win_flag) as no_of_wins, count(1) - sum(win_flag) as no_of_losses
from
(
    select team_1 as team_name,
    case when winner = team_1 then 1 else 0 end as win_flag
    from icc_world_cup

    union all 

    select team_2 as team_name,
    case when winner = team_2 then 1 else 0 end as win_flag
    from icc_world_cup
) a
group by team_name
order by sum(win_flag) desc;

