// PPBODHI4 state 15 needs to be changed to have various timer starts, based on difficulty and
// PC XP.

REPLACE ~PPBODHI4~
IF ~False()~ 18
  SAY ~~
  IF ~~ THEN EXIT
END

IF ~~ 15
  SAY #44892
  IF ~Difficulty(EASIEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",TWO_DAYS)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~Difficulty(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",3600)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",3600)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",1800)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",3600)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",1800)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",41)
SetGlobalTimer("BodhiHunts","GLOBAL",900)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,BODHI_BAT_ASYLUM)~ JOURNAL #23404 EXIT
END
END

ADD_STATE_TRIGGER PPBODHI4 19
  ~Global("J#BodhiUltimatum","GLOBAL",1)~

ADD_STATE_TRIGGER PPBODHI4 21
  ~Global("J#BodhiUltimatum","GLOBAL",1)~

ADD_TRANS_TRIGGER PPBODHI4 19
  ~Global("SpokeBodhiHunt","GLOBAL",0)~ 

APPEND PPBODHI4
IF WEIGHT #5 ~Global("SpokeBodhiHunt","GLOBAL",1)
Global("J#FirstBodhiFight","GLOBAL",2)~ motherfucker
  SAY #49188
  IF ~Difficulty(EASIEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",TWO_DAYS)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~Difficulty(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",1801)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",1801)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",901)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
END

IF ~~ newstate
  SAY @1 
  IF ~~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",42)
ActionOverride("vammat01",Enemy())
ActionOverride("vamold01",Enemy())
SetGlobalTimer("SlayerTimer","GLOBAL",2)
ChangeAIScript("Wtasight",DEFAULT)
Enemy()~ EXIT
END

IF WEIGHT #4 ~Global("SpokeBodhiHunt","GLOBAL",0)~ firstfight
  SAY @2
  IF ~~ THEN DO ~SetGlobal("SpokeBodhiHunt","GLOBAL",1)
SetGlobal("J#FirstBodhiFight","GLOBAL",1)
ChangeAIScript("Wtasight",DEFAULT)  /* Kulyok */
Enemy()~ EXIT
END

IF WEIGHT #4 ~OR(2)
!Detect([EVILCUTOFF])
HPLT(Myself,25)
Global("J#FirstBodhiFight","GLOBAL",1)
GlobalLT("AsylumPlot","GLOBAL",42)~ afterfirstfight
  SAY @3
  IF ~Difficulty(EASIEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",TWO_DAYS)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~Difficulty(HARDEST)
XPLT(Player1,1000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",ONE_DAY)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,1000000)
XPLT(Player1,2000001)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",1801)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT

  IF ~Difficulty(EASIEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",3601)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~DifficultyGT(EASIEST)
DifficultyLT(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",1801)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
  IF ~Difficulty(HARDEST)
XPGT(Player1,2000000)~ THEN DO ~SetGlobalTimer("BodhiHunts","GLOBAL",901)
SetGlobal("J#FirstBodhiFight","GLOBAL",2)
SetGlobal("J#BodhiSpawned","GLOBAL",0)
ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)
EscapeArea()~ EXIT
END
END

EXTEND_BOTTOM PPBODHI4 19
IF ~Global("SpokeBodhiHunt","GLOBAL",1)~ THEN REPLY #49451 EXTERN PPBODHI4 newstate
IF ~Global("SpokeBodhiHunt","GLOBAL",1)~ THEN REPLY #49452 EXTERN PPBODHI4 newstate
END

// Change CreateCreatureObject() to CreateCreatureObjectOffScreen().
// Kulyok changes it back in v22, to prevent bug reports(riddle zone)

