-- Завдання №5 - знайти проєкт з найбільшою тривалістю
-- Створи файл find_longest_project.sql. У ньому напиши SQL, який виведе проєкт з найбільшою тривалістю в місяцях. Якщо таких проєктів декілька - потрібно вивести всі ці проєкти.

with project_months as (
    select
        p.name,
        (
            extract(year from age(p.finish_date, p.start_date))::int * 12
                + extract(month from age(p.finish_date, p.start_date))::int
            ) as month_count
    from project p
)
select name, month_count
from project_months
where month_count = (select max(month_count) from project_months)
order by name;
