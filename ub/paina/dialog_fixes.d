//////////////
/* REPLACEs */
//////////////

REPLACE SPPAIN
IF ~~ THEN BEGIN 16 // from: 15.0
  SAY @141
  IF ~OR(3)
!InParty("Jaheira")
!See("Jaheira")
StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("SentByPaina","GLOBAL",1)~ UNSOLVED_JOURNAL @142 EXIT
  IF ~InParty("Jaheira")
See("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("SentByPaina","GLOBAL",1)~ UNSOLVED_JOURNAL @142 EXTERN ~JAHEIRAJ~ 292
END
END

REPLACE SPPAIN
IF ~OR(2) Global("ReceivedSpiderBane","GLOBAL",0)
!PartyHasItem("ubspbane")~ THEN BEGIN 19 // from:
  SAY @143
  IF ~~ THEN EXIT
END
END

REPLACE SPPAIN
IF ~Global("ReceivedSpiderBane","GLOBAL",1) 
PartyHasItem("ubspbane")~ THEN BEGIN 20 // from:
  SAY #33665
  IF ~~ THEN DO ~TakePartyItem("ubspbane")
SetGlobal("ReturnedSpiderBane","GLOBAL",1) 
EraseJournalEntry(@142)
EraseJournalEntry(@146)
AddexperienceParty(15000)~ SOLVED_JOURNAL @145 GOTO 21
END
END

REPLACE_STATE_TRIGGER SPHURG 0 ~Global("SentByPaina","GLOBAL",1)~
REPLACE_STATE_TRIGGER SPJEAG 0 ~Global("SentByPaina","GLOBAL",1)~
REPLACE_STATE_TRIGGER SPHURG 16 ~Global("AskSpiderBane","GLOBAL",1)~
REPLACE_STATE_TRIGGER SPJEAG 11 ~Global("AskSpiderBane","GLOBAL",1)~
REPLACE_STATE_TRIGGER SPPAIN 0 ~NumTimesTalkedTo(0) Global("UBSpidersAttack", "MYAREA", 0)~
REPLACE_STATE_TRIGGER SPBENE 0 ~True()~
REPLACE_STATE_TRIGGER SPPHIL 0 ~True()~
REPLACE_STATE_TRIGGER SPSAMAR 0 ~True()~
REPLACE_STATE_TRIGGER SPTREDD 0 ~True()~

REPLACE_SAY SPPAIN 12 @345

ALTER_TRANS SPPAIN
BEGIN 0 END	// State
BEGIN 1 END	// Transaction
BEGIN
  "TRIGGER"	~Or(2) Global("WorkingForBodhi","GLOBAL",1) Global("AranJob","GLOBAL",3)~
END


/////////////
/* EXTENDs */
/////////////

EXTEND_BOTTOM SPHURG 15
  IF ~~ THEN DO ~GiveItemCreate("ubspbane",LastTalkedToBy,0,0,0)
SetGlobal("ReceivedSpiderBane","GLOBAL",1)
ActionOverride("SPJEAG",EscapeArea())
EscapeArea()~ UNSOLVED_JOURNAL @146 EXIT
END

EXTEND_BOTTOM SPJEAG 8
IF ~~ THEN DO ~SetGlobal("AskSpiderBane","GLOBAL",1)~ EXIT
END

EXTEND_BOTTOM SPJEAG 10
IF ~~ THEN DO ~SetGlobal("AskSpiderBane","GLOBAL",1)~ EXIT
END

EXTEND_BOTTOM SPPAIN 21
IF ~~ THEN DO ~GiveItemCreate("misc3e",LastTalkedToBy,0,0,0)
GiveItemCreate("wand14",LastTalkedToBy,10,0,0)
ActionOverride("spbene",EscapeArea())
ActionOverride("spphil",EscapeArea())
ActionOverride("spsamar",EscapeArea())
ActionOverride("sptredd",EscapeArea())
EscapeArea()~ EXIT
END

EXTEND_BOTTOM SPPAIN 18
  IF ~~ THEN DO ~ActionOverride("SPBene",ReallyForceSpell(Myself,SPIDER_CHANGE))
ActionOverride("SPPhil",ReallyForceSpell(Myself,SPIDER_CHANGE))
ActionOverride("SPSamar",ReallyForceSpell(Myself,SPIDER_CHANGE))
ActionOverride("SPTredd",ReallyForceSpell(Myself,SPIDER_CHANGE))
SetGlobal("UBSpidersAttack", "MYAREA", 1)
Enemy()~ EXIT
END

/////////////
/* APPENDs */
/////////////

APPEND SPHURG

IF ~Global("SentByPaina","GLOBAL",0)~ THEN BEGIN NotMetPainaH
  SAY #17088
  IF ~~ THEN EXIT
END

END // APPENDING SPHURG

APPEND SPJEAG

IF ~Global("SentByPaina","GLOBAL",0)~ THEN BEGIN NotMetPainaJ
  SAY #17470
  IF ~~ THEN EXIT
END

END // APPENDING SPJEAG
