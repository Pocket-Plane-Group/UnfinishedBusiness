REPLACE_STATE_TRIGGER CROTHF01 0 ~Global("TakenBlame","GLOBAL",0)~

REPLACE_STATE_TRIGGER CRTHF03 0 ~Global("crothfCreate","GLOBAL",0)~

REPLACE_STATE_TRIGGER CRTHF03 7 ~Global("BonnieClyde","GLOBAL",2)~

//EXTEND_BOTTOM CROTHF01 6
//  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",4)~ EXIT
//END

//EXTEND_BOTTOM CROTHF01 16
//  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",2)
//EscapeArea()
//~ EXTERN ~CROTHF02~ 13
//END

//EXTEND_BOTTOM CROTHF02 13
//  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",4) ActionOverride("crothf01",EscapeArea()) EscapeArea()~ EXIT
//END

EXTEND_BOTTOM CRTHF03 13
  IF ~~ THEN GOTO 14
END

EXTEND_BOTTOM CROTHF01 23
  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",3)
Enemy() ActionOverride("crothf02",Enemy())
~ EXIT
END

//EXTEND_BOTTOM CROTHF01 16
//  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",2) SetGlobalTimer("ubcctimer","GLOBAL",ONE_DAY)~ EXTERN ~CROTHF02~ 13
//END

REPLACE CROTHF01
IF ~~ THEN BEGIN 16 // from: CROTHF02:12.0
  SAY #45420 /* ~That's right. Everything we do we'll dedicate to you.~ */
  IF ~~ THEN DO ~SetGlobal("BonnieClyde","GLOBAL",2)
SetGlobalTimer("ubcctimer","GLOBAL",ONE_DAY)
~ EXTERN ~CROTHF02~ 13
END
END
