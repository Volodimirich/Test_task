DROP TABLE IF EXISTS TEMP;
DROP TABLE IF EXISTS FULL_DATA;
DROP TABLE IF EXISTS RESULT;
DROP TABLE IF EXISTS ORDER_TABLE;


CREATE TEMPORARY TABLE FULL_DATA AS
    SELECT DISTINCT * FROM test.fer;

INSERT INTO FULL_DATA
SELECT 'Российская Федерация',
       SUM(FULL_DATA."Всего записей"),
       SUM(FULL_DATA."EПГУ"),
       SUM(FULL_DATA."РПГУ"),
       SUM(FULL_DATA."Регистратура"),
       SUM(FULL_DATA."Инфомат"),
       SUM(FULL_DATA."Call center"),
       SUM(FULL_DATA."АРМ медработника"),
       SUM(FULL_DATA."Прочие")
  FROM FULL_DATA;

UPDATE FULL_DATA
   SET "Субъект РФ" = translate(FULL_DATA."Субъект РФ", 'eEToOpPyaAHKxXcCBM', 'еЕТоОрРуаАНКхХсСВМ')
 WHERE 1 = 1;

CREATE TEMPORARY TABLE TEMP AS
SELECT FULL_DATA."Субъект РФ" AS subject,
       unnest(array['EПГУ', 'РПГУ', 'Регистратура', 'Инфомат', 'Call center', 'АРМ медработника', 'Прочие', 'Записей не через ЕПГУ', 'Всего записей']) AS name,
       unnest(array[FULL_DATA."EПГУ", FULL_DATA."РПГУ", FULL_DATA."Регистратура", FULL_DATA."Инфомат", FULL_DATA."Call center", FULL_DATA."АРМ медработника", FULL_DATA."Прочие", FULL_DATA."Всего записей" - FULL_DATA."EПГУ", FULL_DATA."Всего записей"]) AS val,
       FULL_DATA."Всего записей" AS all_data
FROM FULL_DATA
ORDER BY FULL_DATA."Субъект РФ";

CREATE TEMPORARY TABLE ORDER_TABLE("name", "order_val") AS
    VALUES
      ('EПГУ', 1),
      ('РПГУ', 2),
      ('Регистратура', 3),
      ('Инфомат', 4),
      ('Call center', 5),
      ('АРМ медработника', 6),
      ('Прочие', 7),
      ('Записей не через ЕПГУ', 8),
      ('Всего записей', 9)
;

CREATE TEMPORARY TABLE RESULT AS
    SELECT TEMP.subject
        , TEMP.name
        , NULLIF(TEMP.val, 0) AS "Количество записей"
        , ROUND(NULLIF(CAST(TEMP.val/cast(TEMP.all_data as float)*100 AS numeric), 0), 2) AS "%"
    FROM TEMP
    LEFT JOIN ORDER_TABLE on TEMP.name = ORDER_TABLE.name

    ORDER BY
        CASE
            WHEN subject = 'Российская Федерация' THEN ''
            ELSE subject
        END,
        ORDER_TABLE.order_val
;

ALTER TABLE RESULT
    RENAME COLUMN subject TO "Субъект РФ";
ALTER TABLE RESULT
    RENAME COLUMN name TO "Вид обращения";
--

COPY RESULT
TO '/var/lib/postgresql/test/result.csv' DELIMITER ';' CSV HEADER;

DROP TABLE IF EXISTS TEMP;
DROP TABLE IF EXISTS FULL_DATA;
DROP TABLE IF EXISTS RESULT;
DROP TABLE IF EXISTS ORDER_TABLE;