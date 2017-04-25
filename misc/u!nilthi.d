REPLACE_STATE_TRIGGER DRSHNL01 0 ~Global("UBNilthiri","Global",0)~

EXTEND_BOTTOM DRSHNL01 1
IF ~~ THEN DO ~DestroyItem("MONHP1") SetGlobal("UBNilthiri","Global",1) Enemy()~ EXIT // Kulyok
END

