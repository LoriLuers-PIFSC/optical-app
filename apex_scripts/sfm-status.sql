--query to pull up count of sfm metadata that needs to be entered, as well as needs to be sorted, and needs to be qc'd all in a single table to present it in the application 

select count (c.site) count, 'No Metadata' as status
from site_visit c, round d, occ_list_of_sites d
where c.roundid = d.roundid
and c.site = d.ASSOC_REA_SITE(+)
and c.photomosaic_yn = -1
and d.active = -1 and
c.sitevisitid not in (select m.sitevisitid from sfm_metadata m, site_visit sv, round rd
where m.sitevisitid = sv.sitevisitid and sv.roundid = rd.roundid and rd.active = -1)
union
select count(sm.sitevisitid) count,  'Unsorted' as status
from site_visit sv, sfm_metadata sm, occ_list_of_sites o
where sv.sitevisitid = sm.sitevisitid
and sv.site = o.assoc_rea_site (+)
and sm.SORTED_IMAGES is null
union
select count (a.sitevisitid) count, 'Needs QC' as status
from sfm_metadata a, site_visit c, round d
where a.site = c.site
and c.roundid = d.roundid
and c.photomosaic_yn = -1
and d.active = -1
and a.qc is null
union
select count (a.sitevisitid) count, 'Complete' as status
from sfm_metadata a
where a.qc is not null and a.sorted_images is not null
