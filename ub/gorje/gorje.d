BEGIN ~GORJE~

IF ~Global("TalkedToGorje","GLOBAL",0)
!Global("UBGorjeCC","GLOBAL",1)
!Global("UBGorjeCC","GLOBAL",2)~ THEN BEGIN 0 // from:
  SAY @4
  IF ~~ THEN REPLY @5 DO ~SetGlobal("TalkedToGorje","GLOBAL",1)~ GOTO 1
  IF ~~ THEN REPLY @6 DO ~SetGlobal("TalkedToGorje","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY @7 DO ~SetGlobal("TalkedToGorje","GLOBAL",1)~ GOTO 4
END

IF ~~ THEN BEGIN 1 // from: 9.0 0.0
  SAY @8
  IF ~~ THEN REPLY @9 GOTO 5
  IF ~~ THEN REPLY @10 GOTO 6
END

IF ~~ THEN BEGIN 2 // from: 0.1
  SAY @11
  IF ~~ THEN REPLY @12 GOTO 7
  IF ~~ THEN REPLY @13 GOTO 3
END


IF ~~ THEN BEGIN 3 // from: 4.1 2.1
  SAY @14
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4 // from: 0.2
  SAY @15
  IF ~~ THEN REPLY @16 GOTO 8
  IF ~~ THEN REPLY @17 GOTO 3
  IF ~~ THEN REPLY @18 GOTO 8
END

IF ~~ THEN BEGIN 5 // from: 1.0
  SAY @19
  IF ~~ THEN REPLY @20 GOTO 12
  IF ~~ THEN REPLY @21 GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.1 1.1
  SAY @22
  IF ~~ THEN REPLY @23 GOTO 7
  IF ~~ THEN REPLY @24 GOTO 10
  IF ~~ THEN REPLY @25 GOTO 11
END

IF ~~ THEN BEGIN 7 // from: 6.0 2.0
  SAY @26
  IF ~~ THEN REPLY @24 GOTO 10
  IF ~~ THEN REPLY @25 GOTO 11
END

IF ~~ THEN BEGIN 8 // from: 4.0
  SAY @27
  IF ~~ THEN REPLY @24 GOTO 10
  IF ~~ THEN REPLY @25 GOTO 11
END

IF ~~ THEN BEGIN 10 // from: 9.2 8.0 7.0 6.1
  SAY @28
  IF ~~ THEN DO ~SetGlobal("UBGorjeCC","GLOBAL",1) EscapeArea()~
    UNSOLVED_JOURNAL @30
    EXIT
END

IF ~~ THEN BEGIN 11 // from: 9.1 8.1 7.1 6.2
  SAY @29
  IF ~~ THEN DO ~SetGlobal("UBGorjeCC","GLOBAL",1) EscapeArea()~
    UNSOLVED_JOURNAL @30
    EXIT
END

IF ~~ THEN BEGIN 12 // from: 5.0
  SAY @31
  IF ~~ THEN DO ~SetGlobal("UBGorjeCC","GLOBAL",1) EscapeArea()~
    UNSOLVED_JOURNAL @30
    EXIT
END


