select * from titles;


--Table Joins
--1. Join the publishers and pub_info and show the publisher name and the first 40 characters of the pr_info information.
select p.pub_name, substring(p2.pr_info, 1, 40) 
from publishers p 
join pub_info p2 on p.pub_id = p2.pub_id;


--2. Join the publishers and titles tables to show all titles published by each publisher. Display the pub_id, pub_name and and title_id.
select p.pub_id, p.pub_name, t.title_id 
from publishers p 
right outer join titles t on p.pub_id = t.pub_id;


--3. For each title_id in the table titles, rollup the corresponding qty in sales and show: title_id, title, ord_num and the rolled-up value as a column aggregate called Total Sold
select t.title_id, t.title, s.ord_num, sum(qty) as "Total Sold" 
from titles t 
join sales s on t.title_id = s.title_id 
group by t.title_id ,t.title,s.ord_num ;

select t.title_id, sum(s.qty) as "Total Sold" 
from titles t 
join sales s on t.title_id=s.title_id 
group by t.title_id;


--4. For each stor_id in stores, show the corresponding ord_num in sales and the discount type from table discounts. 
--The output should consist of three columns: ord_num, discount and discounttype and should be sorted on ord_num
select s.ord_num, d.discount, d.discounttype 
from sales s 
inner join discounts d on s.stor_id = d.stor_id 
group by ord_num, discount, discounttype;


--5. Show au_lname from authors, and pub_name from publishers when both publisher and author live in the same city.
select a.au_lname, p.pub_name, a.city 
from authors a 
inner join publishers p on a.city = p.city;


--6. Refine 5 so that for each author you show all publishers who live in the same city and have published one of the authors titles.



--7. Refine 1 so that an outer join is performed. All of the publishers from the first table should be shown, not just those with pr_info information in pub_info.
--You should use the ANSI SQL92 syntax.
select p.pub_name, substring(p2.pr_info, 1, 40) 
from publishers p 
right outer join pub_info p2 on p.pub_id = p2.pub_id;


--8. List each publisher's name, the title of each book they have sold and the total quantity of that title.
select p.pub_name, t.title, sum(s.qty) 
from publishers p 
inner join titles t on p.pub_id = t.pub_id 
inner join sales s on t.title_id = s.title_id 
group by p.pub_name, t.title;


--Business Queries

--1. How many books have been published by each publisher?
select p.pub_name, count(t.title) books 
from publishers p inner join titles t on p.pub_id = t.pub_id group by p.pub_name;


--2. How many different types of book has each publisher published?
select p.pub_name, count(t.title) books 
from publishers p inner join titles t on p.pub_id = t.pub_id group by p.pub_name;


--3. What is the average royalty percentage payed to each author?




