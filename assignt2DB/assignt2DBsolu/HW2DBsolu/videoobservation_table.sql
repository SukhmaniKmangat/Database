CREATE TABLE 
VideoObservation
( 
ID INTEGER, 
IDRace INTEGER, 
BibNumber INTEGER, 
IDObserver INTEGER, 
LOCAverage NUMERIC, 
LOC1 NUMERIC, 
LOC2 NUMERIC, 
LOC3 NUMERIC, 
LOC4 NUMERIC, 
KneeAngle NUMERIC, 
Comment TEXT, 
VideoFile TEXT, 
TOD TEXT, 
CONSTRAINT PrimaryKey PRIMARY KEY (ID), 
CONSTRAINT VideoObservation_fk1 FOREIGN KEY (IDRace, BibNumber) REFERENCES "Bib" ("IDRace" 
, "BibNumber"), 
CONSTRAINT VideoObservation_fk2 FOREIGN KEY (IDObserver) REFERENCES "Observer" 
("IDObserver") 
);