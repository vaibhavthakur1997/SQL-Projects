select * from awesome chocolates;
show tables;
desc sales;
select * from sales




select * from sales;

select saledate, amount, customers from sales;
select amount, customers, geoid from sales;

select saledate, amount, BOXES, AMOUNT/BOXES from sales;
select saledate, amount, BOXES, AMOUNT/BOXES 'AMOUNT PER BOX' from sales;

select * from sales
where amount > 10000 and boxes>500;

select * from sales
where amount > 10000
order by amount desc;

select * from sales
where geoid='g1'
order by pid, amount desc;

select * from sales
where amount>10000 and saledate >= '2022-01-01';


select saledate, amount from sales
where amount>10000 and year(saledate) = 2022
order by amount desc;

select * from sales
where boxes>0 and boxes <=50;

select * from sales
where boxes between 1 and 50;



select saledate, amount, boxes, weekday(saledate) as 'day of week'
from sales
where weekday(saledate) = 4;

select * from people
where team= 'delish' or team= 'jucies';

select * from people
where team in ('delish', 'jucies');

select * from people
where salesperson like '%b%';

select saledate, amount,
case when amount < 1000 then 'under 1k'
	 when amount <5000 then 'under 5k'
     when amount<10000 then 'under 10k'
     else '10k or more'
     end as 'amount category'
     from sales;
     
     
     select * from sales;
     select * from people;
     select s. saledate, s.amount, p. salesperson, s.spid, p. spid
     from sales s
     join people p on p.spid = s.spid;
     
     
     
select * from sales;







select s.saledate, s.amount, pr.product, p.salesperson, p.team
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where s.Amount < 500
and p.team= '';


select geoid, sum(amount), avg(amount), sum(boxes)
from sales
group by geoid;

show databases;
show tables;
show table status;
select * from data1;

select name, avg(salary) as
average_salary from data1
group by name;

describe data1;

create table sales
;





















     
     
     
     
     
     
     
     


















