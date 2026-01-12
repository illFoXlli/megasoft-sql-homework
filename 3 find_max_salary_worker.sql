-- Завдання №3 - знайти працівника з найбільшою заробітною платою
-- Створи файл find_max_salary_worker.sql. У ньому напиши SQL, який виведе працівника з найбільшою заробітною платою. Якщо таких працівників декілька - потрібно вивести всіх.

select w.name, w.salary
from worker w
where w.salary = (select max(salary) from worker)
order by w.name;
