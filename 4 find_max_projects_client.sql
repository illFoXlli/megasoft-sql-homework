-- Завдання №4 - знайти клієнта з найбільшою кількістю проєктів
-- Створи файл find_max_projects_client.sql. У ньому напиши SQL, який виведе клієнта з найбільшою кількістю проєктів. Якщо таких клієнтів декілька - потрібно вивести всіх.


with client_projects as (
    select
        c.id,
        c.name,
        count(p.id) as project_count
    from client c
             left join project p on p.client_id = c.id
    group by c.id, c.name
)
select name, project_count
from client_projects
where project_count = (select max(project_count) from client_projects)
order by name;

