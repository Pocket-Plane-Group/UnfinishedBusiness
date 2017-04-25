BEGIN ~U!KGirl~

IF ~True()~ THEN BEGIN HelloAdventurers
SAY @265
IF ~~ THEN REPLY @266 GOTO MyaraExplain
IF ~~ THEN REPLY @267 GOTO MyaraExplain
IF ~~ THEN REPLY @268 EXIT
IF ~~ THEN REPLY @269 EXIT
END

IF ~~ THEN BEGIN MyaraGive
SAY @270
IF ~~ THEN DO ~ActionOverride("U!KGirl",GiveItemCreate("U!KBot1",Player1,1,0,0))
ActionOverride("U!KGirl",EscapeArea())
SetGlobal("U!ReadyJafir","GLOBAL",1)~
UNSOLVED_JOURNAL @271
EXIT
END

IF ~~ THEN BEGIN MyaraScared
SAY @272
IF ~~ THEN DO ~ActionOverride("U!KGirl",GiveItemCreate("U!KBot1",Player1,1,0,0))
ActionOverride("U!KGirl",EscapeArea())
SetGlobal("U!ReadyJafir","GLOBAL",1)~
UNSOLVED_JOURNAL @271
EXIT
END

CHAIN IF ~~ THEN ~U!KGirl~ MyaraExplain
@273
== ~U!KGirl~ IF ~OR(3) !InParty("Aerie") !InMyArea("Aerie") StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @274
== ~U!KGirl~ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @275
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @276
== ~U!KGirl~ @277
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @278
== ~U!KGirl~ @279
== ~U!KGirl~ @280
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @281
== ~U!KGirl~ @282
== ~U!KGirl~ @283
END
++ @284 GOTO MyaraGive
++ @285 GOTO MyaraScared
