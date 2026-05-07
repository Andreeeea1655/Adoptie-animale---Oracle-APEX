-- ------------------------------------------------------------
-- SECTION 1: DROP EXISTING TABLES
-- ------------------------------------------------------------

DROP TABLE aAnimal CASCADE CONSTRAINTS;
DROP TABLE aTip CASCADE CONSTRAINTS;
DROP TABLE aListaVaccin CASCADE CONSTRAINTS;
DROP TABLE aCerereAdoptie CASCADE CONSTRAINTS;

-- ------------------------------------------------------------
-- SECTION 2: CREATE TABLES
-- ------------------------------------------------------------

CREATE TABLE aTip (
    tip             CHAR(1)      NOT NULL,
    denumire        VARCHAR2(10),
    necesarAvizM    CHAR(2)      CHECK (necesarAvizM IN ('da', 'nu')),

    CONSTRAINT tip_pk PRIMARY KEY (tip)
);

CREATE TABLE aAnimal (
    codA        NUMBER(3)    NOT NULL,
    tip         CHAR(1)      NOT NULL,
    rasa        VARCHAR2(20),
    nume        VARCHAR2(20),
    varsta      NUMBER(2),
    descriere   VARCHAR2(50),
    poza        BLOB,

    CONSTRAINT animal_pk PRIMARY KEY (codA),
    CONSTRAINT animal_fk FOREIGN KEY (tip) REFERENCES aTip(tip) ON DELETE CASCADE
);

CREATE TABLE aListaVaccin (
    codA    NUMBER(3)    NOT NULL,
    vaccin  VARCHAR2(20) NOT NULL,
    dataV   DATE         NOT NULL,

    CONSTRAINT listaVaccin_pk PRIMARY KEY (vaccin, codA, dataV),
    CONSTRAINT listaVaccin_fk FOREIGN KEY (codA) REFERENCES aAnimal(codA) ON DELETE CASCADE
);

CREATE TABLE aCerereAdoptie (
    cID     CHAR(5)      NOT NULL,
    codA    NUMBER(3)    NOT NULL,
    dataC   DATE,
    cnp     VARCHAR2(13),
    nume    VARCHAR2(20),
    tel     VARCHAR2(10),

    CONSTRAINT cerereAdoptie_pk PRIMARY KEY (cID),
    CONSTRAINT cerereAdoptie_fk FOREIGN KEY (codA) REFERENCES aAnimal(codA) ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- SECTION 3: POPULATE TABLES
-- ------------------------------------------------------------

DELETE FROM aCerereAdoptie;
DELETE FROM aListaVaccin;
DELETE FROM aAnimal;
DELETE FROM aTip;

-- Tip
INSERT INTO aTip VALUES ('c', 'caine',  'da');
INSERT INTO aTip VALUES ('p', 'pisica', 'da');
INSERT INTO aTip VALUES ('i', 'iepure', 'nu');

-- Animal (caini)
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (403, 'c', 'Dalmatian',        'Dante',    3,  'jucaus, ii place sa alerge');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (404, 'c', 'Poodle',           'Zara',     1,  'energica, jucausa');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (405, 'c', 'Bichon',           'Kira',     8,  'cuminte, somnoroasa');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (406, 'c', 'Ciobanesc german', 'Rex',      5,  'jucaus, adora mingile');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (407, 'c', 'Golden retriever', 'Pufi',     2,  'protector, ideal pentru paza');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (408, 'c', 'Husky',            'Patrocle', 10, 'prietenos, ii plac copiii');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (409, 'c', 'Bulldog',          'Max',      9,  'curajos, nu se teme de nimic');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (410, 'c', 'Chihuahua',        'Bella',    4,  'fricoasa, geloasa');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (411, 'c', 'Beagle',           'Bobita',   3,  'vioi si mereu alert');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (412, 'c', 'Pomeranian',       'Buburuza', 7,  'adorabila, cuminte');

-- Animal (pisici)
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (303, 'p', 'Siameza',          'Luna',       3,  'blanda si linistita');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (304, 'p', 'British short-hair','Kitty',     1,  'prietenoasa cu oamenii');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (305, 'p', 'Balineza',         'Cappuccino', 2,  'bland, potrivit pentru copii');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (306, 'p', 'Bengaleza',        'Norocel',    5,  'activ si curios');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (307, 'p', 'Birmaneza',        'Garfield',   7,  'ii place lasagna');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (308, 'p', 'Sfinx',            'Cleopatra',  9,  'eleganta si nobila');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (309, 'p', 'Chinchilla',       'Pookie',     12, 'jucausa si prietenoasa');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (310, 'p', 'Munchkin',         'Pisi',       4,  'sperioasa si curioasa');

-- Animal (iepuri)
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (201, 'i', 'Angora',          'Bugs bunny', 3, 'amuzant si sportiv');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (202, 'i', 'Pitic',           'Lola bunny', 2, 'o diva');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (203, 'i', 'Minilop',         'Thumper',    1, 'bland si cuminte');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (204, 'i', 'Pitic olandez',   'Bulgaras',   1, 'curios, exploreaza totul in jur');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (205, 'i', 'Pestrit',         'Oreo',       3, 'foarte linistit si tacut');
INSERT INTO aAnimal (codA, tip, rasa, nume, varsta, descriere) VALUES (206, 'i', 'Cap de leu',      'Ingeras',    1, 'obisnuit cu oameni si alte animale');

-- Vaccin
INSERT INTO aListaVaccin VALUES (403, 'Leptospiroza',       TO_DATE('01/24/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (404, 'Parvoviroza',        TO_DATE('12/02/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (405, 'Hepatita infectioasa', TO_DATE('05/03/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (408, 'Distemper',          TO_DATE('01/04/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (408, 'Rabie canina',       TO_DATE('02/20/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (408, 'DHP',                TO_DATE('01/29/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (406, 'DHPPL',              TO_DATE('05/31/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (411, 'Parainfluenta',      TO_DATE('04/15/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (411, 'Adenovirus',         TO_DATE('03/21/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (403, 'CHV',                TO_DATE('09/01/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (303, 'Panleucopenie',      TO_DATE('05/05/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (307, 'Hepesvirus',         TO_DATE('09/05/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (303, 'Calcivirus',         TO_DATE('10/01/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (206, 'Rabie',              TO_DATE('04/18/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (304, 'Rabie felina',       TO_DATE('02/16/2024', 'MM/DD/YYYY'));
INSERT INTO aListaVaccin VALUES (201, 'Mixomatoza',         TO_DATE('03/23/2024', 'MM/DD/YYYY'));

-- Cerere adoptie
INSERT INTO aCerereAdoptie VALUES ('C1342', 403, TO_DATE('04/24/2025', 'MM/DD/YYYY'), '5010101123456', 'Andrei Pop',    '0712345678');
INSERT INTO aCerereAdoptie VALUES ('C1234', 407, TO_DATE('03/21/2025', 'MM/DD/YYYY'), '6020318223344', 'Maria Ionescu', '0787665432');
INSERT INTO aCerereAdoptie VALUES ('C4321', 306, TO_DATE('09/05/2025', 'MM/DD/YYYY'), '5020202123456', 'Vlad Mihai',    '0702030405');
INSERT INTO aCerereAdoptie VALUES ('C1367', 411, TO_DATE('10/03/2025', 'MM/DD/YYYY'), '6041208123457', 'Alina Radu',    '0777777771');
INSERT INTO aCerereAdoptie VALUES ('C1346', 412, TO_DATE('11/04/2025', 'MM/DD/YYYY'), '6041208123457', 'Alina Radu',    '0777777771');
INSERT INTO aCerereAdoptie VALUES ('C1323', 403, TO_DATE('01/18/2025', 'MM/DD/YYYY'), '5020225145671', 'Razvan Enache', '0711111444');
INSERT INTO aCerereAdoptie VALUES ('C8973', 206, TO_DATE('02/18/2025', 'MM/DD/YYYY'), '6011119223444', 'Taylor Swift',  '0789673216');
INSERT INTO aCerereAdoptie VALUES ('C4212', 410, TO_DATE('08/02/2025', 'MM/DD/YYYY'), '5030303123456', 'Pitbull',       '0728467390');

-- ------------------------------------------------------------
-- SECTION 4: APEX PAGE QUERIES
-- ------------------------------------------------------------

-- Displays all adoption requests (Report / Interactive Report)
SELECT
    cID,
    codA,
    dataC,
    cnp,
    nume,
    tel
FROM aCerereAdoptie
ORDER BY cID;

-- Filtered by animal code (e.g. :P5_CODA is the APEX page item)
SELECT
    codA,
    vaccin,
    dataV
FROM aListaVaccin
WHERE codA = :P5_CODA
ORDER BY vaccin;

-- For each animal: code, name, age, and number of adoption requests
SELECT
    a.codA,
    a.nume,
    a.varsta,
    COUNT(c.cID) AS numar_cereri
FROM aAnimal a
LEFT JOIN aCerereAdoptie c ON a.codA = c.codA
GROUP BY a.codA, a.nume, a.varsta
ORDER BY numar_cereri DESC, a.codA;

-- Displays all animals with their type name
SELECT
    a.codA,
    t.denumire AS tip,
    a.rasa,
    a.nume,
    a.varsta,
    a.descriere
FROM aAnimal a
JOIN aTip t ON a.tip = t.tip
ORDER BY a.codA;

-- Groups animals by type
SELECT
    t.denumire AS tip,
    a.codA,
    a.rasa,
    a.nume,
    a.varsta,
    a.descriere
FROM aAnimal a
JOIN aTip t ON a.tip = t.tip
ORDER BY t.denumire, a.codA;

-- Animals ordered by age
SELECT
    a.codA,
    t.denumire AS tip,
    a.rasa,
    a.nume,
    a.varsta,
    a.descriere
FROM aAnimal a
JOIN aTip t ON a.tip = t.tip
ORDER BY a.varsta;

-- For each type: type code, name, count of animals, average age
SELECT
    t.tip,
    t.denumire,
    COUNT(a.codA)       AS numar_animale,
    ROUND(AVG(a.varsta), 2) AS varsta_medie
FROM aTip t
LEFT JOIN aAnimal a ON t.tip = a.tip
GROUP BY t.tip, t.denumire
ORDER BY t.denumire;
