UPDATE sfm_metadata t1
   SET (sitevisitid) = (SELECT t2.sitevisitid
                         FROM site_visit t2
                        WHERE t1.site = t2.site
                        and to_char(t1.date_, 'DD-MON-YY') = TO_CHAR(t2.date_, 'DD-MON-YY')
                        and t2.roundid >179
                        and t2.photomosaic_yn = -1)
 WHERE EXISTS (
    SELECT 1
      FROM site_visit t2
     WHERE t1.site = t2.site 
    and to_char(t1.date_, 'DD-MON-YY') = TO_CHAR(t2.date_, 'DD-MON-YY')
     and t2.roundid > 179 and t2.photomosaic_yn = -1)
