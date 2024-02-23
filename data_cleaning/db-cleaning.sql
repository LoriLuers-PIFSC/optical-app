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


     

UPDATE sfm_metadata t1
   SET (sitevisitid) = (SELECT t2.sitevisitid
                         FROM site_visit t2
                        WHERE t1.site = t2.OCC_SITEID
                        and to_char(t1.date_, 'DD-MON-YY') = TO_CHAR(t2.date_, 'DD-MON-YY')
                        and t2.roundid =185
                        and t1.sitevisitid is null)
 WHERE EXISTS (
    SELECT 1
      FROM site_visit t2
     WHERE t1.site = t2.OCC_SITEID
    and to_char(t1.date_, 'DD-MON-YY') = TO_CHAR(t2.date_, 'DD-MON-YY')
     and t2.roundid =185 and t1.sitevisitid is null)


DO ALSO FOR OCC SITE ID

UPDATE sfm_metadata t1
   SET (sitevisitid) = (SELECT t2.sitevisitid
                         FROM site_visit t2
                        WHERE t1.site = t2.OCC_SITEID
                        and t2.roundid >179 AND t2.photomosaic_yn = -1
                        and t1.sitevisitid is null)
 WHERE EXISTS (
    SELECT 1
      FROM site_visit t2
     WHERE t1.site = t2.OCC_SITEID
    and t2.photomosaic_yn = -1
     and t2.roundid >179 and t1.sitevisitid is null)

     --add new column to sfm_metadata with alt_site? sitevisitid pulls a different site name e.g. SIO-GUA-2166 is 'GUA-2166'
     --ADD QC reports for those that can't be matched
