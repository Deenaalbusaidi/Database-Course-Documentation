CREATE DATABASE AI
USE AI

CREATE TABLE SERVERS ( 
server_id INT PRIMARY KEY, 
server_name VARCHAR(50), 
region VARCHAR(50) 
);

INSERT INTO SERVERS VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west');
SELECT * FROM SERVERS




CREATE TABLE ALERTS ( 
alert_id INT PRIMARY KEY, 
server_id INT, 
alert_type VARCHAR(50), 
severity VARCHAR(20) 
); 

INSERT INTO ALERTS VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case)
SELECT * FROM ALERTS





CREATE TABLE AI_MODELS ( 
model_id INT PRIMARY KEY, 
model_name VARCHAR(50), 
use_case VARCHAR(50) 
);

INSERT INTO AI_MODELS VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis');
SELECT * FROM AI_MODELS





CREATE TABLE MODELDEPLOYMENTS ( 
deployment_id INT PRIMARY KEY, 
server_id INT, 
model_id INT, 
deployed_on DATE 
);

INSERT INTO MODELDEPLOYMENTS VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12');
SELECT * FROM MODELDEPLOYMENTS


-----------------------------------------------------------------
--1
SELECT ALERTS.alert_id, ALERTS.alert_type,ALERTS.severity,SERVERS.server_name, SERVERS.region
FROM ALERTS
INNER JOIN SERVERS ON ALERTS.server_id = SERVERS.server_id;
--2
SELECT SERVERS.server_name, SERVERS.region, ALERTS.alert_id, ALERTS.alert_type,ALERTS.severity
FROM SERVERS
LEFT JOIN ALERTS ON SERVERS.server_id = ALERTS.server_id;
--3
SELECT ALERTS.alert_id, ALERTS.alert_type,ALERTS.severity,SERVERS.server_name, SERVERS.region
FROM SERVERS
RIGHT JOIN ALERTS ON ALERTS.server_id = SERVERS.server_id;
--4
SELECT SERVERS.server_name, SERVERS.region, ALERTS.alert_id, ALERTS.alert_type,ALERTS.severity
FROM SERVERS
FULL OUTER JOIN ALERTS ON SERVERS.server_id = ALERTS.server_id;
--5
SELECT AI_MODELS.model_name, SERVERS.server_name
FROM AI_MODELS
CROSS JOIN SERVERS;
