/*
event_id	Event_date			Event_type	Agent_Id	Login_Session
1000	2018-12-06 03:00:00.000		5		1000		abc
1001	2018-12-06 03:05:00.000		5		1001		cde
1002	2018-12-06 03:10:00.000		6		1000		abc
1003	2018-12-06 03:15:00.000		5		1002		efg
1004	2018-12-06 03:20:00.000		6		1002		efg
1006	2018-12-06 03:25:00.000		6		1001		cde
1007	2018-12-06 03:30:00.000		5		1000		abc
1008	2018-12-06 03:35:00.000		6		1000		abc

As per given Table fetch the record of each Agent_ID and Total Login Duration In Minutes
*/

with CTE
As(
Select Agent_ID,Event_type,Event_Date,
(Case 
	When Event_type = 5 and Lead(Event_type) over(order by Agent_ID,Event_date) = 6
	Then Lead(Event_date,1,0) over(order by Agent_ID,Event_date) 
End) as Event_End_Date
from Agent
)

Select Agent_ID, Sum(DateDiff(MINUTE,Event_date,Event_End_Date)) as Duration_In_Minutes
From CTE
Group by Agent_ID
--order by Agent_ID,Event_date

