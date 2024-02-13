--had to update site_visit because photomosaic was not flagged for those that were in the sfm process tracking spreadsheet
    
update site_visit t1
SET (t1.photomosaic_yn) = -1
where t1.sitevisitid in (SELECT t2.sitevisitid
                         FROM sfm_metadata t2
                        WHERE t1.site = t2.site
                        and to_char(t1.date_, 'DD-MON-YY') = TO_CHAR(t2.date_, 'DD-MON-YY')
                        and t1.roundid >179
                        and t1.photomosaic_yn = 0)
