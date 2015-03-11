--2011
Select 
distinct
decode(a.agency_name,'Southeast Region', 'TN Valley', 'Hamilton Region', 'TN Valley',a.agency_name )  Case_Region,
initcap(lower(cal.county_code)) Case_County, 
lb.case_id   Case_Id, 
pe.child_id  Child_Id,
p1.last_name||','||p1.first_name Child_Name,
p1.birth_date Date_of_Birth,
nvl(tcp.deceased_date, p1.deceased_date)  Date_Of_Death,
p1.cause_of_death Cause_of_Death, 
decode (ad.adjudication_type_code,'DEPENDENTNEGLECT', 'Dependent/Neglect', 'DELINQUENT', 'Delinquent', 'UNRULY', 'Unruly') Adjudication,
pe.removed_date Custody_Date,
pe.discharge_date Custody_End_Date,
decode(pe.discharge_reason_code,'DEATHOFCHILD', 'Death of Child') Custody_Termination_Reason  
from tfacts_core.placement_episode pe,
	 tfacts_core.agency a,  
	 tfacts_core.case_agency_link cal,  
	 tfacts_core.person p1, 
	 tfacts_core.legal_status_info lsi, 
	 tfacts_core.legal_base lb, 
	 tfacts_core.adjudication_disposition ad,
	 tfacts_fixs.temp_chd_person tcp  
where 
pe.legal_status_info_id = lsi.legal_status_info_id
and lsi.legal_base_id = lb.legal_base_id
and lb.case_id = cal.case_id
and cal.end_eff_date is null
and cal.local_agency_id =  a.agency_id
and pe.child_id = p1.person_id
and pe.child_id = tcp.person_id(+)
and pe.discharge_date is not null
and pe.child_id = p1.person_id
and pe.discharge_reason_code  = 'DEATHOFCHILD'
and ad.person_id = pe.child_id 
and ad.court_finding_date = 
(select max(ad2.court_finding_date)
 from  tfacts_core.adjudication_disposition ad2
 where ad2.adjudication_type_code in ('DEPENDENTNEGLECT', 'DELINQUENT','UNRULY')
 and ad2.person_id = pe.child_id)   
 and pe.discharge_date between to_date('12/31/2010','mm/dd/yyyy') and to_date('01/01/2012','mm/dd/yyyy')
-- and pe.discharge_date between To_Date(Add_months(TRUNC(sysdate, 'MM'),- 2)) and trunc(sysdate -1)     
union 
Select 
distinct
decode(a.agency_name,'Southeast Region', 'TN Valley', 'Hamilton Region', 'TN Valley',a.agency_name )  Case_Region,
initcap(lower(cal.county_code)) Case_County, 
lb.case_id   Case_Id, 
pe.child_id  Child_Id,
p1.last_name||','||p1.first_name Child_Name,
p1.birth_date Child_Dob,
nvl(tcp.deceased_date, p1.deceased_date)  Date_Of_Death,
p1.cause_of_death Cause_of_Death, 
'No Adjudication',  
pe.removed_date Custody_Date,
pe.discharge_date Custody_End_Date,
decode(pe.discharge_reason_code,'DEATHOFCHILD', 'Death of Child') Custody_Termination_Reason  
from tfacts_core.placement_episode pe,
	 tfacts_core.agency a,  
	 tfacts_core.case_agency_link cal,  
	 tfacts_core.person p1, 
	 tfacts_core.legal_status_info lsi, 
	 tfacts_core.legal_base lb,
	 tfacts_fixs.temp_chd_person tcp  
where 
pe.legal_status_info_id = lsi.legal_status_info_id
and lsi.legal_base_id = lb.legal_base_id
and lb.case_id = cal.case_id
and cal.end_eff_date is null
and cal.local_agency_id =  a.agency_id
and pe.child_id = p1.person_id
and pe.child_id = tcp.person_id(+)
and pe.discharge_date is not null
and pe.child_id = p1.person_id
and pe.discharge_reason_code  = 'DEATHOFCHILD'
and not exists 
(select 1 
 from tfacts_core.adjudication_disposition ad
 where ad.adjudication_type_code in ('DEPENDENTNEGLECT', 'DELINQUENT','UNRULY')
 and  ad.person_id = pe.child_id)
-- and pe.discharge_date between To_Date(Add_months(TRUNC(sysdate, 'MM'),- 2)) and trunc(sysdate -1)
and pe.discharge_date between to_date('12/31/2010','mm/dd/yyyy') and to_date('01/01/2012','mm/dd/yyyy')
order by 1,2
/

--2012
Select 
distinct
decode(a.agency_name,'Southeast Region', 'TN Valley', 'Hamilton Region', 'TN Valley',a.agency_name )  Case_Region,
initcap(lower(cal.county_code)) Case_County, 
lb.case_id   Case_Id, 
pe.child_id  Child_Id,
p1.last_name||','||p1.first_name Child_Name,
p1.birth_date Date_of_Birth,
nvl(tcp.deceased_date, p1.deceased_date)  Date_Of_Death,
p1.cause_of_death Cause_of_Death, 
decode (ad.adjudication_type_code,'DEPENDENTNEGLECT', 'Dependent/Neglect', 'DELINQUENT', 'Delinquent', 'UNRULY', 'Unruly') Adjudication,
pe.removed_date Custody_Date,
pe.discharge_date Custody_End_Date,
decode(pe.discharge_reason_code,'DEATHOFCHILD', 'Death of Child') Custody_Termination_Reason  
from tfacts_core.placement_episode pe,
	 tfacts_core.agency a,  
	 tfacts_core.case_agency_link cal,  
	 tfacts_core.person p1, 
	 tfacts_core.legal_status_info lsi, 
	 tfacts_core.legal_base lb, 
	 tfacts_core.adjudication_disposition ad,
	 tfacts_fixs.temp_chd_person tcp  
where 
pe.legal_status_info_id = lsi.legal_status_info_id
and lsi.legal_base_id = lb.legal_base_id
and lb.case_id = cal.case_id
and cal.end_eff_date is null
and cal.local_agency_id =  a.agency_id
and pe.child_id = p1.person_id
and pe.child_id = tcp.person_id(+)
and pe.discharge_date is not null
and pe.child_id = p1.person_id
and pe.discharge_reason_code  = 'DEATHOFCHILD'
and ad.person_id = pe.child_id 
and ad.court_finding_date = 
(select max(ad2.court_finding_date)
 from  tfacts_core.adjudication_disposition ad2
 where ad2.adjudication_type_code in ('DEPENDENTNEGLECT', 'DELINQUENT','UNRULY')
 and ad2.person_id = pe.child_id)   
 and pe.discharge_date between to_date('12/31/2011','mm/dd/yyyy') and to_date('01/01/2013','mm/dd/yyyy')
-- and pe.discharge_date between To_Date(Add_months(TRUNC(sysdate, 'MM'),- 2)) and trunc(sysdate -1)     
union 
Select 
distinct
decode(a.agency_name,'Southeast Region', 'TN Valley', 'Hamilton Region', 'TN Valley',a.agency_name )  Case_Region,
initcap(lower(cal.county_code)) Case_County, 
lb.case_id   Case_Id, 
pe.child_id  Child_Id,
p1.last_name||','||p1.first_name Child_Name,
p1.birth_date Child_Dob,
nvl(tcp.deceased_date, p1.deceased_date)  Date_Of_Death,
p1.cause_of_death Cause_of_Death, 
'No Adjudication',  
pe.removed_date Custody_Date,
pe.discharge_date Custody_End_Date,
decode(pe.discharge_reason_code,'DEATHOFCHILD', 'Death of Child') Custody_Termination_Reason  
from tfacts_core.placement_episode pe,
	 tfacts_core.agency a,  
	 tfacts_core.case_agency_link cal,  
	 tfacts_core.person p1, 
	 tfacts_core.legal_status_info lsi, 
	 tfacts_core.legal_base lb,
	 tfacts_fixs.temp_chd_person tcp  
where 
pe.legal_status_info_id = lsi.legal_status_info_id
and lsi.legal_base_id = lb.legal_base_id
and lb.case_id = cal.case_id
and cal.end_eff_date is null
and cal.local_agency_id =  a.agency_id
and pe.child_id = p1.person_id
and pe.child_id = tcp.person_id(+)
and pe.discharge_date is not null
and pe.child_id = p1.person_id
and pe.discharge_reason_code  = 'DEATHOFCHILD'
and not exists 
(select 1 
 from tfacts_core.adjudication_disposition ad
 where ad.adjudication_type_code in ('DEPENDENTNEGLECT', 'DELINQUENT','UNRULY')
 and  ad.person_id = pe.child_id)
-- and pe.discharge_date between To_Date(Add_months(TRUNC(sysdate, 'MM'),- 2)) and trunc(sysdate -1)
and pe.discharge_date between to_date('12/31/2011','mm/dd/yyyy') and to_date('01/01/2013','mm/dd/yyyy')
order by 1,2
/
