use results;

show tables;

select * from results.sem_ii;
select * from results.sem_iii;
select * from results.sem_iv;
select * from results.sem_v;
select * from results.sem_vi;
select * from results.sem_vii;
select * from results.sem_viii;

-- Top 12 students from semester IV having SGPA > 12
 
SELECT 
    *
FROM
    results.sem_iv
WHERE
    SGPA > 9.5
ORDER BY SGPA DESC
LIMIT 12;

-- Top 10 Students by Row Number, rank and dense rank functions

SELECT Roll_No, SGPA, ROW_NUMBER() OVER(order by SGPA DESC) AS TOP_10_Students_by_RowNumber,
RANK() OVER(order by SGPA DESC) AS TOP_10_Students_by_Rank,
DENSE_RANK() OVER(order by SGPA DESC) AS TOP_10_Students_by_DenseRank
from results.sem_vi
limit 10;

-- Show the SGPA of all Regular students from semester I to VIII and also CGPA.

SELECT 
    sem1.Roll_No,
    sem1.SGPA AS SGPA_1,
    sem2.SGPA AS SGPA_2,
	sem3.SGPA AS SGPA_3,
    sem4.SGPA AS SGPA_4,
    sem5.SGPA AS SGPA_5,
    sem6.SGPA AS SGPA_6,
    sem7.SGPA AS SGPA_7,
    sem8.SGPA AS SGPA_8,
    ROUND((sem1.SGPA + sem2.SGPA + SEM3.SGPA + SEM4.SGPA + SEM5.SGPA + SEM6.SGPA + SEM7.SGPA + SEM8.SGPA) / 8,
            2) AS CGPA
FROM
    results.sem_i AS sem1
        JOIN
    results.sem_ii AS sem2 ON sem1.Roll_No = sem2.Roll_No
        JOIN
    results.sem_iii AS sem3 ON sem1.Roll_No = sem3.Roll_No
        JOIN
    results.sem_iv AS sem4 ON sem1.Roll_No = sem4.Roll_No
        JOIN
    results.sem_v AS sem5 ON sem1.Roll_No = sem5.Roll_No
        JOIN
    results.sem_vi AS sem6 ON sem1.Roll_No = sem6.Roll_No
        JOIN
    results.sem_vii AS sem7 ON sem1.Roll_No = sem7.Roll_No
        JOIN
    results.sem_viii AS sem8 ON sem1.Roll_No = sem8.Roll_No
WHERE
    sem1.Roll_No LIKE 'a01%%'
ORDER BY CGPA DESC;

-- Show the CGPA in terms of Percentage of all the Regular students from sem I to VIII

SELECT 
    sem.Roll_No,
    sem.CGPA,
    ROUND((sem.CGPA - 0.7) * 10, 2) AS percentage
FROM
    (SELECT 
        sem1.Roll_No,
            sem1.SGPA AS SGPA_1,
            sem2.SGPA AS SGPA_2,
            sem3.SGPA AS SGPA_3,
            sem4.SGPA AS SGPA_4,
            sem5.SGPA AS SGPA_5,
            sem6.SGPA AS SGPA_6,
            sem7.SGPA AS SGPA_7,
            sem8.SGPA AS SGPA_8,
            ROUND((sem1.SGPA + sem2.SGPA + SEM3.SGPA + SEM4.SGPA + SEM5.SGPA + SEM6.SGPA + SEM7.SGPA + SEM8.SGPA) / 8, 2) AS CGPA
    FROM
        results.sem_i AS sem1
    JOIN results.sem_ii AS sem2 ON sem1.Roll_No = sem2.Roll_No
    JOIN results.sem_iii AS sem3 ON sem1.Roll_No = sem3.Roll_No
    JOIN results.sem_iv AS sem4 ON sem1.Roll_No = sem4.Roll_No
    JOIN results.sem_v AS sem5 ON sem1.Roll_No = sem5.Roll_No
    JOIN results.sem_vi AS sem6 ON sem1.Roll_No = sem6.Roll_No
    JOIN results.sem_vii AS sem7 ON sem1.Roll_No = sem7.Roll_No
    JOIN results.sem_viii AS sem8 ON sem1.Roll_No = sem8.Roll_No
    WHERE
        sem1.Roll_No LIKE 'a01%%'
    ORDER BY CGPA DESC) SEM;
    
-- Show the SGPA of all Lateral Entry students from semester III to VIII and also CGPA.

    SELECT 
    sem3.Roll_No,
    sem3.SGPA AS SGPA_3,
    sem4.SGPA AS SGPA_4,
    sem5.SGPA AS SGPA_5,
    sem6.SGPA AS SGPA_6,
    sem7.SGPA AS SGPA_7,
    sem8.SGPA AS SGPA_8,
    ROUND((SEM3.SGPA + SEM4.SGPA + SEM5.SGPA + SEM6.SGPA + SEM7.SGPA + SEM8.SGPA) / 6,
            2) AS CGPA
FROM
    results.sem_iii AS sem3
        JOIN
    results.sem_iv AS sem4 ON sem3.Roll_No = sem4.Roll_No
        JOIN
    results.sem_v AS sem5 ON sem3.Roll_No = sem5.Roll_No
        JOIN
    results.sem_vi AS sem6 ON sem3.Roll_No = sem6.Roll_No
        JOIN
    results.sem_vii AS sem7 ON sem3.Roll_No = sem7.Roll_No
        JOIN
    results.sem_viii AS sem8 ON sem3.Roll_No = sem8.Roll_No
WHERE
    sem3.Roll_No LIKE 'b01%%'
ORDER BY CGPA DESC;
    
-- Show the CGPA in terms of Percentage of all the Lateral entry students from sem III to VIII
SELECT 
    sem.Roll_No,
    sem.CGPA,
    ROUND((sem.CGPA - 0.7) * 10, 2) AS percentage
FROM
    (SELECT 
        sem3.Roll_No,
            sem3.SGPA AS SGPA_3,
            sem4.SGPA AS SGPA_4,
            sem5.SGPA AS SGPA_5,
            sem6.SGPA AS SGPA_6,
            sem7.SGPA AS SGPA_7,
            sem8.SGPA AS SGPA_8,
            ROUND((SEM3.SGPA + SEM4.SGPA + SEM5.SGPA + SEM6.SGPA + SEM7.SGPA + SEM8.SGPA) / 6, 2) AS CGPA
    FROM
        results.sem_iii AS sem3
    JOIN results.sem_iv AS sem4 ON sem3.Roll_No = sem4.Roll_No
    JOIN results.sem_v AS sem5 ON sem3.Roll_No = sem5.Roll_No
    JOIN results.sem_vi AS sem6 ON sem3.Roll_No = sem6.Roll_No
    JOIN results.sem_vii AS sem7 ON sem3.Roll_No = sem7.Roll_No
    JOIN results.sem_viii AS sem8 ON sem3.Roll_No = sem8.Roll_No
    WHERE
        sem3.Roll_No LIKE 'b01%%'
    ORDER BY CGPA DESC) sem;
    
    -- Create View of all the students showing Percentage 
    
    CREATE VIEW Results_With_Percentage AS
    SELECT 
        sem.Roll_No, ROUND((sem.CGPA - 0.7) * 10, 2) AS percentage
    FROM
        (SELECT 
            sem1.Roll_No,
                sem1.SGPA AS SGPA_1,
                sem2.SGPA AS SGPA_2,
                sem3.SGPA AS SGPA_3,
                ROUND((sem1.SGPA + sem2.SGPA + SEM3.SGPA) / 3, 2) AS CGPA
        FROM
            results.sem_i AS sem1
        JOIN results.sem_ii AS sem2 ON sem1.Roll_No = sem2.Roll_No
        JOIN results.sem_iii AS sem3 ON sem1.Roll_No = sem3.Roll_No
        ORDER BY CGPA DESC) sem;

-- Show the results of Lateral entry students from sem III 

SELECT 
    *
FROM
    results.sem_iii
WHERE
    Roll_No BETWEEN 'B0101' AND 'B0124';

select * from results.sem_iii;

-- As Mathematical subjects (M_I, M_II, P&S) have more impact on Engg Students,
-- Check the SGPA of all the studnets in sem III having SGPA > 9 and Probability and Statistics got 'O' grade   

SELECT 
    SEM1.Roll_No, SEM1.M_I, SEM2.M_II, SEM3.P_S, SEM3.SGPA
FROM
    results.sem_i AS SEM1
        JOIN
    results.sem_ii AS SEM2 ON SEM1.Roll_No = SEM2.Roll_No
        JOIN
    results.sem_iii AS SEM3 ON SEM1.Roll_No = SEM3.Roll_No
WHERE
    SEM3.SGPA > 9 AND SEM3.P_S = 'O';
 
-- Check the SGPA of all the studnets in sem III having Probability and Statistics got 'F' grade   

 SELECT 
    SEM1.Roll_No, SEM1.M_I, SEM2.M_II, SEM3.P_S, SEM3.SGPA
FROM
    results.sem_i AS SEM1
        JOIN
    results.sem_ii AS SEM2 ON SEM1.Roll_No = SEM2.Roll_No
        JOIN
    results.sem_iii AS SEM3 ON SEM1.Roll_No = SEM3.Roll_No
WHERE
    SEM3.P_S = 'F';
 
 -- As the Strength of Materials I subjects is basic fundamental subject
 -- check the No. of failed students in SM_I in sem III
 
 SELECT 
    COUNT(SM_I)
FROM
    results.sem_iii
WHERE
    SM_I = 'F'
GROUP BY SM_I;

-- Show the Top 10 students with 'A+' or 'O' grade in FM, SM_I
 
 SELECT 
    Roll_No, FM, SM_I, SGPA
FROM
    results.sem_iii
WHERE
    FM = 'A+' OR 'O' AND SM_I = 'A+' OR 'O'
ORDER BY SGPA DESC
LIMIT 10;

-- Count the no. of failed students in OCF&HM.

 SELECT 
    COUNT(OCF_HM)
FROM
    results.sem_iv
WHERE
    OCF_HM = 'F';

-- Create a Case statement 

SELECT 
    sem3.Roll_No,
    sem3.SGPA,
    sem4.SGPA,
    ROUND((sem4.SGPA - sem3.SGPA), 2) AS Performance,
    CASE
        WHEN ROUND((sem4.SGPA - sem3.SGPA), 2) > 0.5 THEN 'Performace Increased'
        WHEN ROUND((sem4.SGPA - sem3.SGPA), 2) < 0 THEN 'Performace Decreased'
        ELSE 'Prformance Neutral'
    END AS 'Performance of students'
FROM
    results.sem_iii AS sem3
        JOIN
    results.sem_iv AS sem4 ON sem3.Roll_No = sem4.Roll_No;

-- Use Window functions for Ranking the Top 10 CGPA Performance students
SELECT sem.Roll_No, sem.CGPA,
    RANK() OVER(ORDER BY SEM.CGPA DESC) AS Top_10_Performance_by_Rank,
    dense_rank() OVER(ORDER BY SEM.CGPA DESC) AS Top_10_Performance_by_Rank
FROM
    (SELECT 
    sem1.Roll_No,
    sem1.SGPA AS SGPA_1,
    sem2.SGPA AS SGPA_2,
    sem3.SGPA AS SGPA_3,
    sem4.SGPA AS SGPA_4,
    sem5.SGPA AS SGPA_5,
    sem6.SGPA AS SGPA_6,
    sem7.SGPA AS SGPA_7,
    sem8.SGPA AS SGPA_8,
    ROUND((sem1.SGPA + sem2.SGPA + SEM3.SGPA + SEM4.SGPA + SEM5.SGPA + SEM6.SGPA + SEM7.SGPA + SEM8.SGPA) / 8,
            2) AS CGPA
FROM
    results.sem_i AS sem1
        JOIN
    results.sem_ii AS sem2 ON sem1.Roll_No = sem2.Roll_No
        JOIN
    results.sem_iii AS sem3 ON sem1.Roll_No = sem3.Roll_No
        JOIN
    results.sem_iv AS sem4 ON sem1.Roll_No = sem4.Roll_No
        JOIN
    results.sem_v AS sem5 ON sem1.Roll_No = sem5.Roll_No
        JOIN
    results.sem_vi AS sem6 ON sem1.Roll_No = sem6.Roll_No
        JOIN
    results.sem_vii AS sem7 ON sem1.Roll_No = sem7.Roll_No
        JOIN
    results.sem_viii AS sem8 ON sem1.Roll_No = sem8.Roll_No
WHERE
    sem1.Roll_No LIKE 'a01%%'
ORDER BY CGPA DESC) SEM LIMIT 10;
    
    -- FM, OCF&HM are the Important subjects from sem III and IV
    -- Show the performance studnets based on these two subjects.
    
    SELECT 
    SEM3.Roll_No, SEM3.FM, SEM3.SGPA, SEM4.OCF_HM, SEM4.SGPA
FROM
    results.sem_iii AS SEM3
        JOIN
    results.sem_iv AS SEM4 ON SEM3.Roll_No = SEM4.Roll_No
WHERE
    SEM3.FM = 'O' OR SEM4.OCF_HM = 'O';