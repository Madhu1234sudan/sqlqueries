use MyDatabase
/* To create a new table */
create table persons (
    id int not null,
    person_name varchar(50) not null,
    birth_date date,
    phone varchar(15) not null,
    constraint pk_persons primary key (id)
)

/* to check the table data */

select * from persons 

/* add the new column in the existing table */

alter table persons 
add email varchar not null 

/* to drop a particular column from the table */

alter table persons 
drop column phone_number 


/* to drop the entire table from the database */
drop table persons


/* insert the data from one table to another table */

insert into persons(id, person_name, birth_date, phone)
select 
    id, 
    first_name, 
    null, 
    'unknown'  
from customers
 

select * from customers
/* update the existing table data  */

update customers
set score = 0
where id = 5

/* delete the data from the existing table */

delete from customers
where id > 5

/* delete the all data from the peresons */

