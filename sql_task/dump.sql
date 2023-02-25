--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1


--
-- TOC entry 17 (class 2615 OID 214191)
-- Name: test; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA IF NOT EXISTS test;


--
-- TOC entry 385 (class 1259 OID 214192)
-- Name: fer; Type: TABLE; Schema: test; Owner: -
--

DROP TABLE IF EXISTS test.fer;

CREATE TABLE test.fer (
    "Субъект РФ" character varying,
    "Всего записей" integer,
    "EПГУ" integer,
    "РПГУ" integer,
    "Регистратура" integer,
    "Инфомат" integer,
    "Call center" integer,
    "АРМ медработника" integer,
    "Прочие" integer
);



--
-- TOC entry 3945 (class 0 OID 214192)
-- Dependencies: 385
-- Data for Name: fer; Type: TABLE DATA; Schema: test; Owner: -
--

INSERT INTO test.fer VALUES ('Алтайский край', 67047, 67047, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Алтайский край', 67047, 67047, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Амурская область', 6707, 6707, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Архангельская область', 35458, 33836, 62, 38, 13, 1035, 474, 0);
INSERT INTO test.fer VALUES ('Астраханская область', 8698, 5036, 167, 3208, 3, 284, 0, 0);
INSERT INTO test.fer VALUES ('Белгородская область', 28429, 28429, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Брянская область', 17723, 17723, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Владимирская область', 27145, 17016, 201, 7279, 60, 615, 24, 1950);
INSERT INTO test.fer VALUES ('Волгоградская область', 30783, 30783, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Вологодская область', 36179, 13886, 15, 20078, 75, 418, 1107, 600);
INSERT INTO test.fer VALUES ('Воронежская область', 52829, 32563, 336, 6395, 1299, 7900, 4336, 0);
INSERT INTO test.fer VALUES ('Забайкальский край', 16516, 11676, 6, 42, 0, 4700, 92, 0);
INSERT INTO test.fer VALUES ('Ивановская область', 21430, 8993, 0, 7464, 0, 4973, 0, 0);
INSERT INTO test.fer VALUES ('Иркутская область', 152374, 47400, 16957, 60197, 550, 27201, 69, 0);
INSERT INTO test.fer VALUES ('Кабардино-Балкарская Республика', 587, 15, 9, 228, 0, 335, 0, 0);
INSERT INTO test.fer VALUES ('Калининградская область', 366212, 29302, 8647, 173897, 9, 19766, 134591, 0);
INSERT INTO test.fer VALUES ('Калужская область', 67270, 9090, 1986, 14198, 0, 40212, 259, 1525);
INSERT INTO test.fer VALUES ('Камчатский край', 12286, 7776, 251, 4259, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Карачаево-Черкесская Республика', 835, 835, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Кемеровская область', 90851, 27155, 4248, 12127, 402, 46626, 0, 293);
INSERT INTO test.fer VALUES ('Кировская область', 136794, 18254, 16113, 2452, 14, 4082, 95879, 0);
INSERT INTO test.fer VALUES ('Костромская область', 26790, 11632, 208, 8020, 24, 6874, 32, 0);
INSERT INTO test.fer VALUES ('Краснодарский край', 94428, 24756, 3022, 2541, 3, 5963, 58143, 0);
INSERT INTO test.fer VALUES ('Красноярский край', 33530, 28231, 1, 4448, 0, 555, 212, 83);
INSERT INTO test.fer VALUES ('Курганская область', 46474, 9785, 4131, 28827, 701, 2840, 175, 15);
INSERT INTO test.fer VALUES ('Курская область', 15565, 12336, 10, 184, 577, 2458, 0, 0);
INSERT INTO test.fer VALUES ('Ленинградская область', 252564, 25244, 3756, 21551, 74821, 111862, 15330, 0);
INSERT INTO test.fer VALUES ('Липецкая область', 14332, 14322, 10, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Магаданская область', 4758, 3323, 24, 1410, 0, 1, 0, 0);
INSERT INTO test.fer VALUES ('Московская область', 342620, 342023, 287, 0, 12, 0, 298, 0);
INSERT INTO test.fer VALUES ('Мурманская область', 73085, 28033, 7539, 17357, 792, 10409, 8579, 376);
INSERT INTO test.fer VALUES ('Ненецкий автономный округ', 3547, 1098, 169, 508, 16, 1569, 187, 0);
INSERT INTO test.fer VALUES ('Нижегородская область', 158883, 34501, 29617, 85578, 2706, 1693, 449, 4339);
INSERT INTO test.fer VALUES ('Новгородская область', 13125, 13125, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Новосибирская область', 343829, 104361, 3013, 106504, 0, 56221, 73730, 0);
INSERT INTO test.fer VALUES ('Омская область', 150820, 40475, 8926, 89698, 5649, 0, 880, 5192);
INSERT INTO test.fer VALUES ('Оренбургская область', 59580, 16277, 3441, 10365, 18, 29248, 231, 0);
INSERT INTO test.fer VALUES ('Орловская область', 18498, 18498, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Пензенская область', 59148, 29399, 43, 24717, 59, 1747, 983, 2200);
INSERT INTO test.fer VALUES ('Пермский край', 531625, 108944, 41933, 351511, 14632, 1575, 4043, 8987);
INSERT INTO test.fer VALUES ('Приморский край', 100321, 27632, 0, 11723, 2904, 57989, 0, 73);
INSERT INTO test.fer VALUES ('Псковская область', 9174, 3796, 12, 5358, 8, 0, 0, 0);
INSERT INTO test.fer VALUES ('Республика Адыгея', 10436, 2124, 963, 7017, 218, 0, 0, 114);
INSERT INTO test.fer VALUES ('Республика Алтай', 919, 113, 112, 227, 15, 399, 53, 0);
INSERT INTO test.fer VALUES ('Республика Башкортостан', 176517, 60652, 4798, 102831, 253, 4349, 780, 2854);
INSERT INTO test.fer VALUES ('Республика Бурятия', 35097, 10532, 29, 920, 1, 22476, 1, 1138);
INSERT INTO test.fer VALUES ('Республика Дагестан', 2073, 959, 6, 17, 1089, 0, 1, 1);
INSERT INTO test.fer VALUES ('Республика Ингушетия', 97, 92, 0, 5, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Республика Калмыкия', 6868, 3110, 224, 15, 0, 2516, 1003, 0);
INSERT INTO test.fer VALUES ('Республика Карелия', 50471, 15358, 3441, 28882, 63, 37, 1222, 1468);
INSERT INTO test.fer VALUES ('Республика Коми', 68205, 15919, 3567, 38832, 522, 7846, 1382, 137);
INSERT INTO test.fer VALUES ('Республика Крым', 129790, 24278, 162, 104948, 1, 70, 2, 329);
INSERT INTO test.fer VALUES ('Республика Марий Эл', 32660, 5638, 4955, 19008, 451, 599, 84, 1925);
INSERT INTO test.fer VALUES ('Республика Мордовия', 10869, 10869, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Республика Саха (Якутия)', 6498, 3440, 0, 946, 0, 132, 536, 1444);
INSERT INTO test.fer VALUES ('Республика Северная Осетия - Алания', 2786, 2701, 0, 85, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Республика Татарстан', 87226, 53211, 10365, 20117, 2631, 408, 494, 0);
INSERT INTO test.fer VALUES ('Республика Тыва', 5387, 5387, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Республика Хакасия', 21235, 10055, 7, 10293, 3, 0, 0, 877);
INSERT INTO test.fer VALUES ('Ростовская область', 102653, 38645, 1665, 33407, 24, 15800, 13112, 0);
INSERT INTO test.fer VALUES ('Рязанская область', 32638, 25174, 0, 5280, 382, 14, 1788, 0);
INSERT INTO test.fer VALUES ('Самарская область', 248339, 79224, 2656, 27352, 1, 101618, 37488, 0);
INSERT INTO test.fer VALUES ('Саратовская область', 195960, 36763, 753, 74210, 0, 32744, 51490, 0);
INSERT INTO test.fer VALUES ('Сахалинская область', 50589, 3474, 4711, 2474, 31157, 117, 8656, 0);
INSERT INTO test.fer VALUES ('Свердловская область', 245367, 126818, 5225, 75797, 5665, 14627, 17235, 0);
INSERT INTO test.fer VALUES ('Смоленская область', 8850, 8850, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Ставропольский край', 3654, 1741, 71, 1842, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Тамбовская область', 104516, 9923, 3003, 6389, 107, 51806, 32539, 749);
INSERT INTO test.fer VALUES ('Тверская область', 142412, 17637, 1692, 23463, 0, 62000, 37620, 0);
INSERT INTO test.fer VALUES ('Томская область', 34986, 28090, 20, 6868, 0, 7, 1, 0);
INSERT INTO test.fer VALUES ('Тульская область', 354663, 32568, 5497, 51816, 27355, 8593, 0, 228834);
INSERT INTO test.fer VALUES ('Тюменская область', 75375, 34046, 1, 14743, 0, 26580, 0, 5);
INSERT INTO test.fer VALUES ('Удмуртская Республика', 33894, 28764, 45, 3442, 65, 0, 0, 1578);
INSERT INTO test.fer VALUES ('Ульяновская область', 30940, 17689, 212, 7529, 4259, 1249, 2, 0);
INSERT INTO test.fer VALUES ('Хабаровский край', 8995, 8995, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Ханты-Мансийский автономный округ - Югра', 55051, 55051, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Челябинская область', 626771, 65158, 9594, 130862, 131, 148224, 272802, 0);
INSERT INTO test.fer VALUES ('Чеченская Республика', 1253, 42, 0, 911, 0, 76, 224, 0);
INSERT INTO test.fer VALUES ('Чувашская Республика', 32806, 31053, 0, 646, 0, 856, 0, 251);
INSERT INTO test.fer VALUES ('Чукотский автономный округ', 22, 22, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Ямало-Ненецкий автономный округ', 51447, 16230, 3793, 8916, 262, 250, 18948, 3048);
INSERT INTO test.fer VALUES ('Ярославская область', 210988, 24761, 163069, 10111, 8461, 4586, 0, 0);
INSERT INTO test.fer VALUES ('Mосква', 110136, 110136, 0, 0, 0, 0, 0, 0);
INSERT INTO test.fer VALUES ('Cанкт-Петербург', 1319543, 250839, 238408, 265987, 23898, 201240, 339171, 0);
INSERT INTO test.fer VALUES ('Cевастополь', 53099, 20296, 76, 30096, 3, 578, 2050, 0);

--
-- PostgreSQL database dump complete
--

