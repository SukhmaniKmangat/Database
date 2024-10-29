-- Q_1A) Sql for Athlete deserving Red card  
-------------------------------------------
select  A.Firstname,A.Lastname, VO.BibNumber
from videoobservation VO 
Inner join bib B on VO.BibNumber = B.BibNumber
Inner Join Athlete A on B.IDAthlete = A.IDAthlete
where VO.Idrace=1 and  VO.LOCAverage >= 60
Group by A.Lastname, A.Firstname
order by A.lastname, A.firstname;

-- Q_1B) Sql for Athlete deserving Red card, with Max value for LOCAvg (MAX Loss of Contact)  
-----------------------------------------------------------------------------------------
select  A.Firstname,A.Lastname, VO.BibNumber,
MAX(VO.LOCAverage) AS MAXLoc
from videoobservation VO 
Inner join bib B on VO.BibNumber = B.BibNumber
Inner Join Athlete A on B.IDAthlete = A.IDAthlete
where VO.Idrace=1 and  VO.LOCAverage >= 60
Group by A.Lastname, A.Firstname
order by VO.LOCAverage desc,A.lastname, A.firstname;

-- Q_2) Sql for Athlete deserving Red card for Bent Knee Race(3)
----------------------------------------------------------------
SELECT A.FirstName,A.LastName,MIN(VO.KneeAngle) AS BentDegrees,VO.BibNumber
FROM VideoObservation VO
INNER JOIN Bib B ON (VO.BibNUmber = B.BibNumber) 
Inner Join Athlete A on B.IDAthlete = A.IDAthlete
where VO.Idrace=3 and VO.kneeAngle NOT NULL AND VO.kneeAngle > 0
GROUP By Vo.BibNumber
ORDER By VO.KneeAngle ,A.LastName,A.FirstName;

-- Q_3) Sql for Athlete Participated in More than one race
----------------------------------------------------------------
SELECT a.FirstName, a.LastName, 
       COUNT(b.IDRace) AS NbrRaces,
       MAX(r.RaceDate) AS lastRace,
       MIN(r.RaceDate) AS firstRace
FROM Athlete a
JOIN Bib b ON a.IDAthlete = b.IDAthlete
JOIN Race r ON b.IDRace = r.IDRace
GROUP BY a.IDAthlete, a.FirstName, a.LastName
HAVING COUNT(b.IDRace) > 1
ORDER BY NbrRaces, a.Lastname, a.FirstName;

-- Q_4) List of Athlete Received a red card from a judge from their own country
------------------------------------------------------------------------------
SELECT 
    Athlete.FirstName as AthleteFirstName, Athlete.LastName as AthleteLastName, 
    Judge.FirstName as JudgeFirstName, Judge.LastName as JudgeLastName,
    Race.RaceDate,Event.Event, 
    Event.Country, JudgeCall.Color, JudgeCall.Infraction, Event.City
FROM JudgeCall 
INNER JOIN Judge ON (JudgeCall.IDJudge = Judge.IDJudge) 
INNER JOIN Bib ON (JudgeCall.IDRace = Bib.IDRace) 
AND (JudgeCall.BibNumber = Bib.BibNumber) 
INNER JOIN Athlete ON (Bib.IDAthlete = Athlete.IDAthlete) 
INNER JOIN Race ON (Bib.IDRace = Race.IDRace) 
INNER JOIN Event ON (Race.IDEvent = Event.IDEvent)
INNER JOIN VideoObservation ON (Bib.IDrace = VideoObservation.IDRace)
where VideoObservation.LOCAverage >= 60 and athlete.countrycode= judge.countrycode
Group BY AthleteLastname,JudgeCall.Color,Judgecall.Infraction;          

--Q_5) Returns average loss of contact observed by an Observer    
----------------------------------------------------------------
SELECT IDObserver, FirstName, LastName, Round(Avg(LOCAverage),1) As Average from (
SELECT O.FirstName, O.LastName,V.LOCAverage, V.IDObserver, MAX(V.LOCAverage)  
FROM VideoObservation as V
INNER JOIN Observer as O ON (V.IDObserver = O.IDObserver)
where V.LOCAverage <=28.0 AND V.IDRace=1);

