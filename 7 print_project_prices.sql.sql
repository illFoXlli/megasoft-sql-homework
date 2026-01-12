-- Завдання №7 - вивести вартість кожного проєкту
-- Створи файл print_project_prices.sql. У ньому напиши SQL, який виведе список проєктів та вартість кожного проєкту.
--
-- Вартість проєкту - це сума заробітних плат працівників, що працюють над цим проєктом, помножених на тривалість у місяцях проєкту.
--
-- Наприклад, над проєктом Project A працюють працівники Max (заробітна плата 1000) та Joe (заробітна плата 1500). Проєкт триває 17 місяців. Тоді вартість проєкту Project A = 17 * (1000 + 1500) = 42500


with project_months as (
    select
        p.id,
        p.name,
        (
            extract(year from age(p.finish_date, p.start_date))::int * 12
                + extract(month from age(p.finish_date, p.start_date))::int
            ) as month_count
    from project p
),
     project_salary as (
         select
             pw.project_id,
             sum(w.salary) as total_salary
         from project_worker pw
                  join worker w on w.id = pw.worker_id
         group by pw.project_id
     )
select
    pm.name,
    (pm.month_count * ps.total_salary) as price
from project_months pm
         join project_salary ps on ps.project_id = pm.id
order by price desc, pm.name;

