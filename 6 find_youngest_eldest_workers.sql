-- Завдання №6 - знайти найстаршого та наймолодшого працівника
-- Створи файл find_youngest_eldest_workers.sql. У ньому напиши SQL, який вибере наймолодшого та найстаршого працівників, та виведе їх у форматі таблиці з наступними полями:
--
-- TYPE - тип (може бути YOUNGEST або OLDEST)
-- NAME - ім'я працівника
-- BIRTHDAY - дата народження працівника
-- Якщо є декілька наймолодших/найстарших працівників - то необхідно вивести їх всіх.

select 'YOUNGEST' as type, w.name, w.birthday
from worker w
where w.birthday = (select max(birthday) from worker)

union all

select 'OLDEST' as type, w.name, w.birthday
from worker w
where w.birthday = (select min(birthday) from worker)

order by type, name, birthday;
