BEGIN ~SUNA~

IF
~NumTimesTalkedTo(0)
OR(3)
!InParty("Valygar")
StateCheck("Valygar",CD_STATE_NOTVALID) /* Kulyok */
!InMyarea("Valygar")~ THEN BEGIN 0 // from:
  SAY @149
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY @150 GOTO 1
  IF ~~ THEN REPLY @151 GOTO 2
  IF ~GLOBAL("ToldAboutSuna","GLOBAL",1)~ THEN REPLY @152 GOTO 5
  IF ~GLOBAL("ToldAboutSuna","GLOBAL",1)~ THEN REPLY @153 GOTO 5
  IF ~~ THEN REPLY @154 GOTO 3
END

IF ~~ THEN BEGIN 1 // from: 0.0 4.0
  SAY @155
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.1 4.1
  SAY @156
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 3 // from: 0.4 4.4
  SAY @157
  IF ~~ THEN EXIT
END

IF
~!NumTimesTalkedTo(0)
OR(3)
!InParty("Valygar")
StateCheck("Valygar",CD_STATE_NOTVALID) /* Kulyok */
!InMyarea("Valygar")~
  THEN BEGIN 4 // from:
  SAY @158
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY @150 GOTO 1
  IF ~~ THEN REPLY @151 GOTO 2
  IF ~GLOBAL("ToldAboutSuna","GLOBAL",1)~ THEN REPLY @159 GOTO 5
  IF ~GLOBAL("ToldAboutSuna","GLOBAL",1)~ THEN REPLY @153 GOTO 5
  IF ~~ THEN REPLY @154 GOTO 3
END

IF ~~ THEN BEGIN 5 // from: 0.2 0.3 4.2 4.3
  SAY @160
  IF ~~ THEN REPLY @161 GOTO 6
  IF ~~ THEN REPLY @162 GOTO 6
  IF ~~ THEN REPLY @163 GOTO 3
END

IF ~~ THEN BEGIN 6 // from: 5.0 5.1
  SAY @164
  IF ~~ THEN REPLY @165 GOTO 7
  IF ~~ THEN REPLY @166 GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0 6.1
  SAY @167
  IF ~~ THEN UNSOLVED_JOURNAL #10128 /* ~ The hunt for Valygar Corthala.

I encountered a friend of Valygar's, a ranger by the name of Suna Seni.  She told me a little of the man... he is a ranger, for starters, and belongs to a family that is under some kind of curse.  He is fairly wealthy, having a home in the Docks District and some wild land out in the Umar Hills.  She doesn't seem to think he has any particular hatred of the Cowled Wizards and seems quite fond of him, overall.~ */ GOTO 8
END

IF ~~ THEN BEGIN 8 // from: 7.0
  SAY @168
  IF ~~ THEN DO ~SetGlobal("ToldAboutVal","GLOBAL",1) RevealAreaOnMap("AR1100") EscapeArea()~ EXIT
END
