BEGIN
    
        update SFM_METADATA
        set QC = v('APP_USER')
        where SFMMETAID = :P208_SFMMETAID;
    
end;




---old below----------
declare

    vQC varchar2(50);

begin

    select qc into vQC from sfm_metadata where sitevisitid = :P208_SITEVISIT;

       
        update sfm_metadata
        set qc = v('app_user')
        where sitevisitid = :P208_SITEVISIT;

end;

---testing below----

DECLARE
    v_sitevisitid
    sfm_metadata.sitevisitid%TYPE:= v(':P208_SITEVISIT');

BEGIN
    UPDATE SFM_METADATA
    SET qc = v('APP_USER')
    where sitevisitid = v_sitevisitid;

   commit;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;
