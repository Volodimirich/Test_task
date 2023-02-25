DROP TABLE IF EXISTS TEMP;
DROP TABLE IF EXISTS FULL_DATA;

CREATE TABLE FULL_DATA AS
    SELECT DISTINCT * FROM test.fer;

INSERT INTO FULL_DATA
SELECT 'Российская Федерация', SUM(FULL_DATA."Всего записей"), SUM(FULL_DATA."EПГУ"), SUM(FULL_DATA."РПГУ"),
        SUM(FULL_DATA."Регистратура"), SUM(FULL_DATA."Инфомат"), SUM(FULL_DATA."Call center"),
        SUM(FULL_DATA."АРМ медработника"), SUM(FULL_DATA."Прочие") FROM FULL_DATA;

UPDATE FULL_DATA SET "Субъект РФ" = translate(FULL_DATA."Субъект РФ", 'eEToOpPyaAHKxXcCBM','еЕТоОрРуаАНКхХсСВМ');

CREATE TABLE TEMP AS
SELECT DISTINCT FULL_DATA."Субъект РФ" AS subject,
       unnest(array['EПГУ', 'РПГУ', 'Регистратура', 'Инфомат', 'Call center', 'АРМ медработника', 'Прочие', 'Записей не через ЕПГУ', 'Всего записей']) AS name,
       unnest(array[FULL_DATA."EПГУ", FULL_DATA."РПГУ", FULL_DATA."Регистратура", FULL_DATA."Инфомат", FULL_DATA."Call center", FULL_DATA."АРМ медработника",
           FULL_DATA."Прочие", FULL_DATA."Всего записей" - FULL_DATA."EПГУ", FULL_DATA."Всего записей"]) AS val,
       FULL_DATA."Всего записей" AS all_data
FROM FULL_DATA
ORDER BY FULL_DATA."Субъект РФ";

SELECT * FROM TEMP;

SELECT TEMP.subject AS "Субъект РФ", TEMP.name AS "Вид обращения",
       NULLIF(TEMP.val, 0) AS "Количество записей",
       NULLIF(ROUND(CAST(TEMP.val/cast(TEMP.all_data as float)*100 AS numeric), 2), 0) AS "%"
FROM TEMP
ORDER BY CASE WHEN 'Субъект РФ' = 'Российская Федерация' THEN ''
    ELSE 'Субъект РФ'
        END COLLATE "ru-x-icu"
