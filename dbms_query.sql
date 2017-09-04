use HospitalSysmexDB2;

-- 1 How many people have been referred for surgery?
select count(*) as SurgeryReferees
from reference2;

-- 2 What is the average time taken to see a Surgeon by Department?

Select depName,Avg(DateDiff(FSA,refDate))as AvgTime from reference2 as r
join Surgeonss on  surgeonss.empID = r.empID
join Department on  Department.depID = surgeonss.depID
group by depName;

-- 3 Who has each Surgeon had on their list and how long have they been waiting or did they wait?
select refDate,concat(surgeonFirstName," ",surgeonLastName) as 'surgeonName',datediff(FSA,refDate) as Waitingtime from reference2
join patient on patient.patientID = reference2.patientID
join surgeonss on surgeonss.empID = reference2.empID
group by surgeonName;


-- concat(patientFirstName," ",patientLastName) as 'Patient Name' from patient


-- 4 Assuming that all patients under 18 need to be seen by Paediatric Surgery, are there any patients who need to be reassigned?

select dob,concat(patientFirstName," ",patientLastName) as 'PatientName' from Patient
join Reference2 on reference2.patientID = patient.patientID
join Surgeonss on Reference2.empID = surgeonss.empID
where dob>'2000' and Surgeonss.depID <> 5
group by dob;

-- 5 What percentage of patient were seen within the target of 80 days by department?

select depName,datediff((WLD,refdate)*80/100)as percentage from Reference2 
join surgeonss on Surgeonss.empID = Reference2.empID
-- join reference2 on reference2.empID = surgeonss.empID
join department on department.depID = surgeonss.depID
-- join surgeonss on surgeonss.empID = reference2.empID
-- join patient on reference2.patientID = patient.patientID
-- join reference2 on reference2.patientID = patient.patientID
group by department

-- join waitlistpatients on waitlistpatients.waitListPatientID = Reference2.waitListPatientID
