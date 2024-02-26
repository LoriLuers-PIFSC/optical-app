--SET UP AUTO-POPULATE DATA FILL -- 
--FOR SURVEY_SIZE, set default for column in form in apex as

SELECT
CASE
 when sfmmetaid in (select a.sfmmetaid from sfm_metadata a, site_visit b, list_of_sites c where a.sitevisitid = b.sitevisitid and b.site = c.site and c.depth_bin = 'Deep'
and b.type in ('Benthic', 'Fish')) then '3x15m'
 when sfmmetaid in (select a.sfmmetaid from sfm_metadata a, site_visit b, list_of_sites c where a.sitevisitid = b.sitevisitid and b.site = c.site and c.depth_bin in ('Shallow', 'Mid')
and b.type in ('Benthic', 'Fish')) then '3x20m'
 when  sfmmetaid in (select a.sfmmetaid from sfm_metadata a, site_visit b where a.sitevisitid = b.sitevisitid AND b.type = 'Oceanography') then '12m'
else null
END AS survey_size
FROM SFM_METADATA
WHERE SFMMETAID = :P206_SFMMETAID


---AUTO-POPULATE SURVEY TYPE

SELECT
CASE
 when sfmmetaid in (select a.sfmmetaid from sfm_metadata a, site_visit b where a.sitevisitid = b.sitevisitid and b.type in ('Benthic', 'Fish')) then 'belt'
 when  sfmmetaid in (select a.sfmmetaid from sfm_metadata a, site_visit b where a.sitevisitid = b.sitevisitid AND b.type = 'Oceanography') then 'spiral'
else null
END AS SURVEY_TYPE
FROM SFM_METADATA
WHERE SFMMETAID = :P206_SFMMETAID
