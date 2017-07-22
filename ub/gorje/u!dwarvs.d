////////////
/* CHAINs */
////////////

CHAIN
IF ~Global("FindGorje","GLOBAL",2)
!Global("TalkedToGorje","GLOBAL",0)~ THEN SCDUR reunion1
@91
DO ~SetGlobal("FindGorje","GLOBAL",3) EraseJournalEntry(@88)~
== GORJE @92
== SCDUR @93
== GORJE @94
== SCDUR @95
== GORJE @96 
END
++ @97 GOTO ReIntrpt1
++ @98 GOTO reunion2
++ @99 GOTO reunion2

CHAIN
IF ~~ THEN SCDUR reunion2
@100
== GORJE @101
END
++ @102 GOTO ReIntrpt2
++ @103 GOTO reunion3

CHAIN
IF ~~ THEN SCDUR reunion3
@104
== GORJE @105
== SCDUR @106
== GORJE @107
== VICONIJ IF ~IsValidForPartyDialog("Viconia")~ THEN @108
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @109
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2")~ THEN @110
END
++ @111 GOTO ReIntrpt3
++ @112 EXTERN GORJE reunion4

CHAIN 
IF ~~ THEN GORJE GorjeViconia
@113
DO ~SetGlobal("GorjVicoCh1","LOCALS",1)~
== VICONIJ @114
== GORJE @115
== VICONIJ @116
== GORJE @117
END 
IF ~~ THEN GOTO Leave

CHAIN
IF ~~ THEN GORJE reunion4
@118
== GORJE @119
== SCDUR @120
== GORJE @121
== GORJE @122
== SCDUR @123
END
++ @124 EXTERN SCDUR 19
++ @125 EXTERN SCDUR PissOff


/////////////
/* APPENDs */
/////////////

/* Unger */

APPEND ~SCDUR~

IF ~~ THEN BEGIN ReIntrpt1
  SAY @126
  IF ~~ THEN GOTO reunion2
END

IF ~~ THEN BEGIN ReIntrpt2
  SAY @127
  IF ~~ THEN GOTO reunion3
END

IF ~~ THEN BEGIN ReIntrpt3
  SAY @128
  IF ~~ THEN EXTERN GORJE reunion4
END

IF ~~ THEN BEGIN PissOff
  SAY @129
  IF ~~ THEN EXIT
END

IF ~Global("FindGorje","GLOBAL",2)~ THEN BEGIN CCMeeting
  SAY @130
  IF ~~ THEN EXTERN SCDUR reunion1
END

IF ~Global("NebIsASmellyBastard","GLOBAL",2)~ THEN BEGIN AfterNeb1
  SAY @310
  IF ~!Dead("Neb")~ THEN REPLY @311 GOTO AfterNeb2
  IF ~Dead("Neb")~ THEN REPLY @312 GOTO AfterNeb3
END

IF ~~ THEN BEGIN AfterNeb2
  SAY @313
  IF ~~ THEN DO ~EraseJournalEntry(@30)  /* Kulyok - erase journal entries before escaping the area */
EraseJournalEntry(2088)
ActionOverride("GORJE",EscapeArea())
EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN AfterNeb3
  SAY @314
  IF ~~ THEN DO ~EraseJournalEntry(@30) 
EraseJournalEntry(2088)
ActionOverride("GORJE",EscapeArea())
EscapeArea()~ EXIT
END

END   // APPENDING SCDUR

/* Gorje */

APPEND ~GORJE~

IF ~~ THEN BEGIN GorjeNoViconia
   SAY @113
   IF ~~ THEN GOTO Leave
END

IF ~~ THEN BEGIN Leave
SAY @131
IF ~~ THEN REPLY @132 GOTO 1
IF ~~ THEN REPLY @133 GOTO 11
IF ~~ THEN REPLY @134 GOTO 10
END

IF 
~OR(2)
Global("FindGorje","GLOBAL",2)
Global("FindGorje","GLOBAL",3)~ THEN BEGIN AfterNeb
  SAY @138
  IF ~~ THEN EXIT
END


END // APPENDING GORJE

//////////////
/* REPLACEs */
//////////////

/* GORJE */

REPLACE ~GORJE~
IF ~~ THEN BEGIN 4 // from: 0.2
  SAY @139
  IF ~~ THEN REPLY @16 GOTO 8
  IF ~~ THEN REPLY @140 GOTO 3
  IF ~IsValidForPartyDialog("Viconia")~ THEN REPLY @18 GOTO GorjeViconia
  IF ~!IsValidForPartyDialog("Viconia")~ THEN REPLY @18 GOTO GorjeNoViconia
END
END
