CREATE TABLE 
JudgeCall
( 
IDRace INTEGER NOT NULL, 
IDJudge INTEGER NOT NULL, 
Color TEXT NOT NULL, 
Infraction TEXT NOT NULL, 
TOD TEXT NOT NULL, 
BibNumber INTEGER NOT NULL, 
CONSTRAINT PrimaryKey PRIMARY KEY (IDRace, IDJudge, Color, Infraction, BibNumber), 
CONSTRAINT JudgeCall_fk1 FOREIGN KEY (IDRace, BibNumber) REFERENCES "Bib" ("IDRace", 
"BibNumber"), 
CONSTRAINT JudgeCall_fk2 FOREIGN KEY (IDJudge) REFERENCES "Judge" ("IDJudge") 
);