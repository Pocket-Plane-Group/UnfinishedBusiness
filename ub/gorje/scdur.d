BEGIN ~SCDUR~

IF ~Global("ToldAboutDuergar","GLOBAL",0)~ THEN BEGIN 0 // from:
  SAY @32
  IF ~~ THEN EXIT
END

IF ~Global("ToldAboutDuergar","GLOBAL",1)
!Race(LastTalkedToBy,DWARF)
Global("TalkedToScdur","GLOBAL",0)~ THEN BEGIN 1 // from:
  SAY @33 
  IF ~Global("TalkedToScdur","GLOBAL",0)~ THEN REPLY @34 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 2
  IF ~Global("TalkedToScdur","GLOBAL",0)~ THEN REPLY @35 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 5
  IF ~~ THEN REPLY @36 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 4
END

IF ~~ THEN BEGIN 2 // from: 20.2 3.0 1.0
  SAY @37
  IF ~~ THEN REPLY @38 GOTO 10
  IF ~~ THEN REPLY @39 GOTO 5
  IF ~~ THEN REPLY @40 GOTO 4
END

IF ~Global("ToldAboutDuergar","GLOBAL",1)
Race(LastTalkedToBy,DWARF)
Global("TalkedToScdur","GLOBAL",0)~ THEN BEGIN 3 // from:
  SAY @41
  IF ~Global("TalkedToScdur","GLOBAL",0)~ THEN REPLY @42 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 2
  IF ~Global("TalkedToScdur","GLOBAL",0)~ THEN REPLY @35 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 5
  IF ~~ THEN REPLY @43 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)
~ GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.2 2.2 1.2
  SAY @44
  IF ~~ THEN DO ~SetGlobal("TalkedToScdur","GLOBAL",0)~ EXIT
END

IF ~~ THEN BEGIN 5 // from: 3.1 2.1 1.1
  SAY @45
  IF ~~ THEN GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY @46
  IF ~Global("SculptorPlot","GLOBAL",1)
~ THEN REPLY @47 GOTO 8
  IF ~Global("SculptorPlot","GLOBAL",2)
~ THEN REPLY @48 GOTO 8
  IF ~Global("SculptorPlot","GLOBAL",3)
~ THEN REPLY @49 GOTO 9
  IF ~~ THEN REPLY @50 GOTO 7
  IF ~~ THEN REPLY @51 GOTO 10
END

IF ~~ THEN BEGIN 7 // from: 10.0 9.0 8.0 6.3
  SAY @52
  IF ~~ THEN REPLY @53 GOTO 11
  IF ~~ THEN REPLY @54 GOTO 13
  IF ~~ THEN REPLY @55 GOTO 12
END

IF ~~ THEN BEGIN 8 // from: 6.1 6.0
  SAY @56
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 9 // from: 6.2
  SAY @57
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 10 // from: 6.4 2.0
  SAY @58
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 11 // from: 7.0
  SAY @59
  IF ~~ THEN REPLY @60 GOTO 15
  IF ~~ THEN REPLY @61 GOTO 16
END

IF ~~ THEN BEGIN 12 // from: 7.2
  SAY @62
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 13 // from: 7.1
  SAY @63
  IF ~~ THEN GOTO 14
END

IF ~~ THEN BEGIN 14 // from: 13.0 12.0
  SAY @64
  IF ~~ THEN REPLY @60 GOTO 15
  IF ~~ THEN REPLY @61 GOTO 16
END

IF ~~ THEN BEGIN 15 // from: 14.0 11.0
  SAY @65
  IF ~~ THEN GOTO 17
END

IF ~~ THEN BEGIN 16 // from: 14.1 11.1
  SAY @66
  IF ~~ THEN GOTO 17
END

IF ~~ THEN BEGIN 17 // from: 16.0 15.0
  SAY @67
  IF ~~ THEN GOTO 18
END

IF ~~ THEN BEGIN 18 // from: 17.0
  SAY @68
  IF ~~ THEN REPLY @69 GOTO 28 
  IF ~~ THEN REPLY @70 GOTO 29 
  IF ~~ THEN REPLY @71 GOTO 28
END

IF ~~ THEN BEGIN 19 // from: 18.2 18.1 18.0
  SAY @72
  IF ~~ THEN GOTO 21
END

/* Kulyok */
IF ~!Global("NebIsASmellyBastard","GLOBAL",2) !Global("FindGorje","GLOBAL",2)~ THEN BEGIN 20 // from:
SAY @73
IF ~~ EXIT
END

/*
IF ~False()~ THEN BEGIN 20 // from:
  SAY @73
  IF ~Global("NebIsASmellyBastard","GLOBAL",2)
!Dead("Neb")~ THEN GOTO 26
  IF ~OR(2)
!Global("NebIsASmellyBastard","GLOBAL",2)
Dead("Neb")
Global("TalkedToScdur","GLOBAL",1)~ THEN EXIT
  IF ~Global("ToldAboutDuergar","GLOBAL",1)
Global("TalkedToScdur","GLOBAL",0)
~ THEN REPLY @74 DO ~SetGlobal("TalkedToScdur","GLOBAL",1)~ GOTO 2
END
*/

IF ~~ THEN BEGIN 21 // from: 19.0
  SAY @75
  IF ~~ THEN GOTO 22
END

IF ~~ THEN BEGIN 22 // from: 21.0
  SAY @76
  IF ~~ THEN REPLY @77 GOTO 23
  IF ~~ THEN REPLY @78 GOTO 23
  IF ~~ THEN REPLY @79 GOTO 23
  IF ~~ THEN REPLY @80 GOTO 23
END

IF ~~ THEN BEGIN 23 // from: 22.3 22.2 22.1 22.0
  SAY @81
  IF ~~ THEN DO ~SetGlobal("UngerShowNeb","GLOBAL",1)~ GOTO 24
END

IF ~~ THEN BEGIN 24 // from: 23.0
  SAY @82
  IF ~~ THEN GOTO 25
END

IF ~~ THEN BEGIN 25 // from: 24.0
  SAY @83
  IF ~~ THEN DO ~SetGlobal("UngerInfo","GLOBAL",1)
SetGlobal("NebIsASmellyBastard","GLOBAL",1)
~ UNSOLVED_JOURNAL #2088 /* ~Gain the services of Sir Sarles for the temple.

Unger Hilldark told me that his latest shipment of illithium was stolen by a dwarf named Neb. Unger cannot get the illithium back himself because the word of a Duergar is not trusted in Amn. If I am to get real illithium, I will have to exact justice on this bandit myself. Unger tells me that Neb bought a house in the Bridge District, marked as 'derelict house' on the map. The name 'Neb' sounds oddly familiar.~ */ EXIT
END

IF ~~ THEN BEGIN 26 // from: 20.0
  SAY @84
  IF ~~ THEN GOTO 27
END

IF ~~ THEN BEGIN 27 // from: 26.0
  SAY @85
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 28 // from: 18.0
  SAY @86
  IF ~Global("ShadowLordDead","GLOBAL",1)~ THEN REPLY @87 DO ~SetGlobal("FindGorje","GLOBAL",1) RevealAreaOnMap("AR1400")~ UNSOLVED_JOURNAL @88 EXIT
  IF ~Global("ShadowLordDead","GLOBAL",0)~ THEN REPLY @87 DO ~SetGlobal("FindGorje","GLOBAL",1) RevealAreaOnMap("AR1100")~ UNSOLVED_JOURNAL @88 EXIT
  IF ~~ THEN REPLY @89 GOTO 29
END

IF ~~ THEN BEGIN 29 // from: 28.2 18.2
  SAY @90 
  IF ~~ THEN EXIT
END
