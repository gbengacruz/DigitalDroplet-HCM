--------------------------------------------------------
--  DDL for Trigger TR_20_HM_EMP_TP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TR_20_HM_EMP_TP" 
   BEFORE INSERT OR UPDATE ON t_20_hm_emp_tp
   FOR EACH ROW 
 BEGIN 
   IF :new.r_k IS NULL THEN 
    -- SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') INTO :new.r_k FROM dual; 
    SELECT s_20_hm_emp_tp.NEXTVAL INTO :new.r_k FROM dual; 
   END IF; 
   IF inserting THEN 
       :new.crt_dt := localtimestamp; 
       :new.crt_by := nvl(wwv_flow.g_user,user); 
       :new.upd_dt := localtimestamp; 
       :new.upd_by := nvl(wwv_flow.g_user,user); 
    END IF; 
    IF inserting OR updating THEN 
       :new.upd_dt := localtimestamp; 
       :new.upd_by := nvl(wwv_flow.g_user,user); 
    END IF; 

 END TR_20_HM_EMP_TP; 




/
ALTER TRIGGER "TR_20_HM_EMP_TP" ENABLE;
