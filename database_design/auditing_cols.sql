--add in auditing columns
ALTER TABLE SFM_METADATA
ADD "LAST_MOD_DTM" DATE;
ALTER TABLE SFM_METADATA
ADD "LAST_MOD_BY" VARCHAR2(20 BYTE);
ALTER TABLE SFM_METADATA
ADD "CREATE_DTM" DATE;
ALTER TABLE SFM_METADATA
ADD "CREATED_BY" VARCHAR2(20 BYTE);

COMMIT;

--add trigger
CREATE TRIGGER "SFM_METADATA_BRIU" 
/*
Set audit column values w/ user and sysdate on insert and/or update.
NOTE: If these columns are displayed but not updated in a form, the USER will 
get a message saying that the record was changed by another user. Actually, 
the record was changed by this trigger. If the form updates the columns, this 
trigger code detects that and doesn't update again. NOTE: do not use the version
of thei trigger which operates from dsc.dsc_table_audit_pkg.stamp_row as this 
package will not be present in the field. */

BEFORE INSERT OR UPDATE 
  ON gisdat.SFM_METADATA
  REFERENCING OLD AS OLD NEW AS NEW 
  FOR EACH ROW 
BEGIN 
  IF INSERTING AND :new.LAST_MOD_DTM IS NULL THEN 
    :new.CREATE_DTM := SYSDATE;
    :new.created_by := NVL(V('APP_USER'), USER);
    :new.LAST_MOD_DTM := SYSDATE;
    :new.last_mod_by := NVL(V('APP_USER'), USER);

  ELSIF UPDATING AND NVL(:new.LAST_MOD_DTM, SYSDATE) = NVL(:old.LAST_MOD_DTM, SYSDATE) THEN 
    :new.LAST_MOD_DTM := SYSDATE;
    :new.last_mod_by := NVL(V('APP_USER'), USER);
  END IF; 
END SFM_METADATA_BRIU ;



