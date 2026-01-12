-- Завдання №2 - наповнити БД
-- Створи файл populate_db.sql, у якому напиши SQL для заповнення таблиць. Після виконання SQL БД має бути приведена у наступний стан:
--
-- додано щонайменше 10 працівників, мінімальна зарплата має бути менше за 1000, максимальна - більше за 5 000, мають бути всі технічні рівні (Trainee, Junior, Middle, Senior)
-- додано щонайменше 5 клієнтів
-- додано щонайменше 10 проєктів. Тривалість кожного проєкту (різниця START_DATE та FINISH_DATE) має бути від 1 до 100 місяців.
-- назначені працівники на кожен проєкт. Над кожним проєктом має працювати від 1 до 5 працівників.
-- =========================

truncate table project_worker restart identity cascade;
truncate table project restart identity cascade;
truncate table worker restart identity cascade;
truncate table client restart identity cascade;

-- =========================
-- 1) WORKERS (10+)
-- all levels; min salary < 1000; max salary > 5000
-- =========================
insert into worker (name, birthday, level, salary) values
                                                       ('Alice Brown',   date '1998-03-12', 'Trainee', 650),
                                                       ('Hanna Miles',   date '1999-12-02', 'Trainee', 900),

                                                       ('Bob Stone',     date '1995-07-21', 'Junior', 1200),
                                                       ('Charlie Fox',   date '1992-11-05', 'Junior', 1800),
                                                       ('Laura White',   date '1996-08-10', 'Junior', 1600),

                                                       ('Diana Reed',    date '1989-01-19', 'Middle', 3200),
                                                       ('Ethan Cole',    date '1991-06-30', 'Middle', 4100),
                                                       ('Ivan Park',     date '1993-04-25', 'Middle', 5200),
                                                       ('Mark Adams',    date '1990-09-15', 'Middle', 4700),

                                                       ('Fiona Lane',    date '1986-09-14', 'Senior', 7500),
                                                       ('George King',   date '1984-02-08', 'Senior', 9800),
                                                       ('Julia Hart',    date '1990-10-11', 'Senior', 15000),
                                                       ('Robert Black',  date '1982-05-20', 'Senior', 11200);

-- =========================
-- 2) CLIENTS (5+)
-- =========================
insert into client (name) values
                              ('Nova Retail'),         -- id = 1
                              ('Orbit Finance'),       -- id = 2
                              ('Skyline Logistics'),   -- id = 3
                              ('Astra Health'),        -- id = 4
                              ('Helio Energy'),        -- id = 5
                              ('BlueSoft'),            -- id = 6
                              ('RedCloud');            -- id = 7

-- =========================
-- 3) PROJECTS (10+)
-- duration 1..100 months
-- Make max projects = 4 for Nova Retail and Orbit Finance
-- =========================
insert into project (name, client_id, start_date, finish_date) values
-- Nova Retail (4 projects)
('Retail Platform',        1, date '2020-01-10', date '2020-10-10'), -- 9m
('Mobile App',             1, date '2021-03-01', date '2022-02-01'), -- 11m
('POS Modernization',      1, date '2022-02-01', date '2022-12-01'), -- 10m
('Loyalty Program',        1, date '2023-01-15', date '2023-07-15'), -- 6m

-- Orbit Finance (4 projects)
('Banking Core',           2, date '2019-05-15', date '2020-05-15'), -- 12m
('Credit System',          2, date '2022-07-01', date '2023-01-01'), -- 6m
('Risk Scoring',           2, date '2020-06-01', date '2021-06-01'), -- 12m
('Fraud Detection',        2, date '2023-03-01', date '2023-09-01'), -- 6m

-- Skyline Logistics (2 projects)
('Logistics Tracker',      3, date '2018-09-20', date '2021-09-20'), -- 36m
('Delivery Optimizer',     3, date '2023-04-05', date '2023-06-05'), -- 2m

-- Astra Health (2 projects)
('Hospital CRM',           4, date '2020-11-01', date '2022-03-01'), -- 16m
('Patient Portal',         4, date '2021-08-12', date '2021-09-12'), -- 1m

-- Helio Energy (2 projects)
('Solar Control System',   5, date '2017-02-01', date '2024-02-01'), -- 84m
('Energy Analytics',       5, date '2024-03-01', date '2024-12-01'), -- 9m

-- BlueSoft (1 project)
('Cloud Migration',        6, date '2021-01-01', date '2022-07-01'), -- 18m

-- RedCloud (1 project)
('AI Monitoring',          7, date '2022-05-01', date '2023-11-01'); -- 18m

-- =========================
-- 4) PROJECT_WORKER (1..5 workers per project)
-- =========================
insert into project_worker (project_id, worker_id) values
-- 1 Retail Platform
(1,1),(1,3),(1,6),(1,10),

-- 2 Mobile App
(2,2),(2,4),(2,7),(2,12),

-- 3 POS Modernization
(3,3),(3,6),(3,8),

-- 4 Loyalty Program
(4,1),(4,5),(4,10),

-- 5 Banking Core
(5,6),(5,7),(5,10),(5,11),(5,13),

-- 6 Credit System
(6,3),(6,6),(6,8),(6,10),

-- 7 Risk Scoring
(7,4),(7,7),(7,11),(7,13),

-- 8 Fraud Detection
(8,2),(8,5),(8,9),(8,12),(8,13),

-- 9 Logistics Tracker
(9,4),(9,8),(9,9),(9,11),(9,12),

-- 10 Delivery Optimizer
(10,2),(10,5),(10,10),

-- 11 Hospital CRM
(11,3),(11,6),(11,11),(11,13),

-- 12 Patient Portal
(12,1),(12,4),

-- 13 Solar Control System
(13,2),(13,6),(13,7),(13,10),(13,11),

-- 14 Energy Analytics
(14,5),(14,8),(14,9),(14,12),

-- 15 Cloud Migration
(15,3),(15,4),(15,6),(15,11),(15,13),

-- 16 AI Monitoring
(16,2),(16,8),(16,9),(16,10),(16,12);
