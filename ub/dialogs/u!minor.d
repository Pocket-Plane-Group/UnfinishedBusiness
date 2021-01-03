//EXTEND_BOTTOM C6LANF 7
//IF ~!Gender(Player1,FEMALE)~ THEN EXTERN ~C6CORAN~ 19
//IF ~Gender(Player1,FEMALE)~ THEN EXTERN ~C6CORAN~ 20
//END

// Aataquah, Trademeet Djinni restoration
REPLACE_TRIGGER_TEXT_REGEXP ~\(aataqah\)\|\(trgyp03\)~  ~Name(LastTalkedToBy,"\([a-z|A-Z|0-9]+\)")~ ~Name("\1",LastTalkedToBy)~

REPLACE_STATE_TRIGGER C6SQUIRE 14 ~Global("OrderFightBodhi","GLOBAL",0) !Dead("c6bodhi")~
REPLACE_STATE_TRIGGER C6SQUIRE 15 ~Global("OrderFightBodhi","GLOBAL",1) !Dead("c6bodhi")~
REPLACE_STATE_TRIGGER C6SQUIRE 16 ~Global("OrderFightBodhi","GLOBAL",2) !Dead("c6bodhi")~
REPLACE_STATE_TRIGGER C6SQUIRE 17 ~Dead("c6bodhi") ReputationGT(LastTalkedToBy,14)~
REPLACE_STATE_TRIGGER C6SQUIRE 18 ~Dead("c6bodhi") ReputationLT(LastTalkedToBy,15)~

////////////////////////////////////////////////////////////

EXTEND_BOTTOM BVALYGA 44
IF ~~ THEN DO ~SetGlobal("EdwinValygarFight","GLOBAL",1)~ EXIT
END

////////////////////////////////////////////////////////////

ADD_TRANS_TRIGGER JAHEIRAJ 3 ~False()~ DO 0
EXTEND_BOTTOM JAHEIRAJ 3 IF ~~ THEN REPLY #1095 GOTO 220
END

REPLACE JAHEIRAJ
IF ~~ THEN BEGIN 220
  SAY #14685
  IF ~~ THEN GOTO 5
END
END

////////////////////////////////////////////////////////////
//Some sound references
/*

Commented out by DavidW - we now do this direct from dialog.tlk, which saves on translations

REPLACE_SAY HAERDA 109 ~(The man looks at you blankly for a moment and then speaks) I serve only Master Mekrath.~ [HAERDA95]

REPLACE_SAY JANP 35 ~Well, by Aunt Petunia's beard! A ghost from my past? Looking to buy some turnips, perhaps?~ [JANJAN67]

REPLACE_SAY PPIRENI2 41 ~Do not look so surprised. You must have expected to find me near your Imoen.~ [IRENIC36]

REPLACE_SAY PPIRENI2 42 ~ Oh, but I'm not incarcerated here. No, I am the new coordinator, and you are in my care... once again.~ [IRENIC37]

REPLACE_SAY SUELLEAP 0 ~Wait! Who comes? You... you are the Child of Bhaal, aren't you? The one that Joneleth... Jon... boasted of stealing power from? He claimed to have slain you!~ [ELLESI02]

REPLACE_SAY SUELLEAP 10 ~The energy he has stolen from the Tree will be torn from him. I know not what effects this will have... but Jon will be disoriented, so you must kill him quickly!~ [ELLESI17]

REPLACE_SAY VALYGAR 0 ~Ho there! More Cowled ones or their servants, no doubt. By the gods, I swear you'll not live to take me to that damnable sphere!~ [VALYGA01]

*/
////////////////////////////////////////////////////////////

EXTEND_BOTTOM ANOMENJ 1
IF ~~ THEN REPLY #6251 GOTO 4
END

EXTEND_BOTTOM ANOMENJ 11 COPY_TRANS GARREN 36
END
EXTEND_BOTTOM ANOMENJ 12 COPY_TRANS GARREN 36
END
EXTEND_BOTTOM ANOMENJ 13 COPY_TRANS GARREN 36
END

EXTEND_BOTTOM GARREN 8
IF ~InParty("Anomen")~ THEN DO ~SetGlobal("FollowedGarren","GLOBAL",1)~ UNSOLVED_JOURNAL #11872 EXTERN ANOMEN 17
END

REPLACE_STATE_TRIGGER ANOMENJ 17 ~~

////////////////////////////////////////////////////////////

EXTEND_BOTTOM BOOTER 15
IF ~~ THEN EXTERN ~ARNBOY01~ 5
END

REPLACE_STATE_TRIGGER ARNBOY01 5 ~~

////////////////////////////////////////////////////////////

REPLACE_STATE_TRIGGER BODVAM01 0 ~True()~
REPLACE_STATE_TRIGGER BODVAM02 0 ~True()~

////////////////////////////////////////////////////////////

REPLACE BYOSHIM
IF WEIGHT #1 ~InParty("Minsc")
See("Minsc")
HPLT("Minsc",20)
!StateCheck("Minsc",STATE_SLEEPING)
CombatCounter(0)
Global("BYoshimo13","LOCALS",1)~ THEN BEGIN 71 // from:
  SAY #9264
  IF ~~ THEN DO ~SetGlobal("BYoshimo13","LOCALS",2)~ EXTERN ~BMINSC~ 80
END
END

////////////////////////////////////////////////////////////

EXTEND_BOTTOM CEDRUID1 7
IF ~~ THEN REPLY #9310 DO ~SetGlobal("DruidTalk","GLOBAL",1)~ GOTO 14
END

EXTEND_BOTTOM CEDRUID1 14
IF ~~ THEN DO ~EscapeArea()~ UNSOLVED_JOURNAL #55499 EXIT
END
    
////////////////////////////////////////////////////////////

REPLACE_STATE_TRIGGER DGDRU01 0 ~!See([ENEMY])~
REPLACE_STATE_TRIGGER DGDRU01 1 ~~

EXTEND_BOTTOM DGDRU01 0
  IF ~~ THEN GOTO 1
END
