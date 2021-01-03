////////////
/* CHAINs */
////////////

CHAIN
IF
~InParty("Valygar")
!StateCheck("Valygar",CD_STATE_NOTVALID)
InMyArea("Valygar")~ THEN SUNA SunaVal1 /* Kulyok */
@169
== VALYGARJ @170
== SUNA @171
== VALYGARJ @172
== SUNA @173
== VALYGARJ @174
== SUNA @175
== VALYGARJ @176
== SUNA @177 DO ~EscapeArea()~
== VALYGARJ @178
END
IF ~~ THEN DO ~SetGlobal("SunaLeaves","GLOBAL",1) SetGlobal("SunaTalkedToValygar","GLOBAL",1)~ EXIT

CHAIN
IF ~Global("AsylumPlot","GLOBAL",50)~ THEN PPSUNA SunaValSH1 // from:
@179 DO ~SetGlobal("AsylumPlot","GLOBAL",51)~
== VALYGARJ @180
== PPSUNA @181
END
++ @182 GOTO SunaValSH2
++ @183 GOTO SunaValSH2

CHAIN
IF ~~ THEN PPSUNA SunaValSH2
@184
== PPSUNA @185
== VALYGARJ @186
== PPSUNA @187
== VALYGARJ @188
== PPSUNA @189
== PPSUNA @190
END
IF ~~ THEN GOTO SunaValUD1


/////////////
/* EXTENDs */
/////////////

EXTEND_BOTTOM CERNDJ 106
IF ~OR(3) !InParty("Aerie")
!InMyArea("Aerie")
StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN EXTERN ~PPSUNA~ SunaValUD2 /* Kulyok */
IF ~InParty("Aerie")
InMyArea("Aerie")
!StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN EXTERN ~AERIEJ~ 134
END

//EXTEND_BOTTOM LLARSH 15
//IF ~~ THEN REPLY #19125 /* ~Tell me about this Lavok.~ */ DO ~RevealAreaOnMap("AR1100")
//SetGlobal("ToldAboutVal","Global",1)~ UNSOLVED_JOURNAL @211 GOTO 14
//IF ~~ THEN REPLY #19128 /* ~Umar Hills, you say?  Thanks for the information.~ */ DO ~RevealAreaOnMap("AR1100")
//SetGlobal("ToldAboutVal","Global",1)~ UNSOLVED_JOURNAL @211 GOTO 16
//END

EXTEND_BOTTOM PPIRENI1 34
  IF ~InParty("Valygar")~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",20)
DisplayString(Myself,50707)
Spell(Myself,DO_NOTHING)
StartCutSceneMode()
StartCutScene("u!cut41g")
~ EXIT  IF ~!InParty("Valygar")~ THEN DO ~SetGlobal("AsylumPlot","GLOBAL",20)
DisplayString(Myself,50707)
Spell(Myself,DO_NOTHING)
StartCutSceneMode()
StartCutScene("Cut41g")
~ EXIT
END

EXTEND_BOTTOM PPIRENI2 16
IF ~Global("SunaTalkedToValygar","GLOBAL",1) InParty("Valygar")~  THEN EXTERN ~PPSUNA~ 0
IF ~Global("SunaTalkedToValygar","GLOBAL",1) !InParty("Valygar")~  THEN GOTO 19
IF ~!Global("SunaTalkedToValygar","GLOBAL",1)~ THEN GOTO 19
END

//EXTEND_BOTTOM PPIRENI2 48
//IF ~Global("SunaTalkedToValygar","GLOBAL",1)~  THEN EXTERN ~PPSUNA~ 0
//IF ~~ THEN EXTERN ~PPBODHI4~ 0
//END

EXTEND_BOTTOM PPSAEM2 25
IF ~~ THEN DO ~SetGlobal("TakeSaemonRoute","GLOBAL",1)
EraseJournalEntry(5801)
EraseJournalEntry(5802)
EraseJournalEntry(7045)
EraseJournalEntry(23523)
EraseJournalEntry(15720)
EraseJournalEntry(15719)
EraseJournalEntry(10140)
EraseJournalEntry(22934)
EraseJournalEntry(23404)
EraseJournalEntry(@322)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL #7701 EXIT 
END

EXTEND_BOTTOM PPSAEM2 26
IF ~~ THEN DO ~EraseJournalEntry(5801)
EraseJournalEntry(5802)
EraseJournalEntry(7045)
EraseJournalEntry(23523)
EraseJournalEntry(15720)
EraseJournalEntry(15719)
EraseJournalEntry(10140)
EraseJournalEntry(22934)
EraseJournalEntry(23404)
EraseJournalEntry(@322)
ReallyForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL #7701 EXIT
END

EXTEND_BOTTOM PPSAEM2 27
IF ~~ THEN DO ~EraseJournalEntry(5801)
EraseJournalEntry(5802)
EraseJournalEntry(7045)
EraseJournalEntry(23523)
EraseJournalEntry(15720)
EraseJournalEntry(15719)
EraseJournalEntry(10140)
EraseJournalEntry(22934)
EraseJournalEntry(23404)
EraseJournalEntry(@322)
SetGlobal("TakeSaemonRoute","GLOBAL",1)
StartCutSceneMode()
StartCutScene("Cut41n")~ SOLVED_JOURNAL #4354 EXIT
END

//////////////
/* REPLACEs */
//////////////

REPLACE HERVO
IF ~~ THEN BEGIN 18 // from: 30.0 27.0 14.0 12.0
SAY  @212
IF ~~ THEN REPLY #18850 /* ~It may be.  Thank you.~ */ DO ~SetGlobal("ToldAboutSuna","GLOBAL",1)~ UNSOLVED_JOURNAL @213 GOTO 24
IF ~~ THEN REPLY #18852 /* ~It will have to be.  I'll be on my way.~ */ DO ~SetGlobal("ToldAboutSuna","GLOBAL",1) AddJournalEntry(99996,QUEST)~ GOTO 6
END
END

REPLACE HERVO
IF ~~ THEN BEGIN 20 // from: 19.0
SAY @214
IF ~~ THEN REPLY #18850 /* ~It may be.  Thank you.~ */ DO ~SetGlobal("ToldAboutSuna","GLOBAL",1)~ UNSOLVED_JOURNAL @213 GOTO 24
IF ~~ THEN REPLY #18852 /* ~It will have to be.  I'll be on my way.~ */ DO ~SetGlobal("ToldAboutSuna","GLOBAL",1)~ UNSOLVED_JOURNAL @213 GOTO 6
END
END

REPLACE LLARSH
IF ~~ THEN BEGIN 15
  SAY #19052
IF ~~ THEN REPLY #19125 /* ~Tell me about this Lavok.~ */ DO ~RevealAreaOnMap("AR1100")
SetGlobal("ToldAboutVal","Global",1)~ UNSOLVED_JOURNAL @211 GOTO 14
IF ~~ THEN REPLY #19128 /* ~Umar Hills, you say?  Thanks for the information.~ */ DO ~RevealAreaOnMap("AR1100")
SetGlobal("ToldAboutVal","Global",1)~ UNSOLVED_JOURNAL @211 GOTO 16
END
END

REPLACE PPIRENI2
IF ~~ THEN BEGIN 17 // from:
  SAY @215
  IF ~~ THEN GOTO SUNAARGUE
END
END

REPLACE VALYGARJ
IF ~~ THEN BEGIN 112 // from: 111.0
  SAY #58285 /* ~I would continue to travel with you, if you would allow me.  If there is so much I am not aware of, I must discover it.  Will you have me?~ [VALYGA79] */
  IF ~~ THEN REPLY #58286 /* ~I would be glad to have you in my company, Valygar.~ */ DO ~EraseJournalEntry(6509)
EraseJournalEntry(6534)
EraseJournalEntry(7994)
EraseJournalEntry(7995)
EraseJournalEntry(8126)
EraseJournalEntry(8127)
EraseJournalEntry(8128)
EraseJournalEntry(8129)
EraseJournalEntry(10128)
EraseJournalEntry(16302)
EraseJournalEntry(16343)
EraseJournalEntry(16524)
EraseJournalEntry(16544)
EraseJournalEntry(16569)
EraseJournalEntry(20179)
EraseJournalEntry(20365)
EraseJournalEntry(20453)
EraseJournalEntry(23371)
EraseJournalEntry(23409)
EraseJournalEntry(3422)
EraseJournalEntry(6557)
EraseJournalEntry(7241)
EraseJournalEntry(9705)
EraseJournalEntry(9919)
EraseJournalEntry(10047)
EraseJournalEntry(23551)
EraseJournalEntry(@213)
EraseJournalEntry(@211)~ SOLVED_JOURNAL #15735 /* ~Valygar's family quest is over.

Valygar's quest is finally done.  Lavok was not what he expected, and has caused the normally judgemental ranger to think deeply about what he has experienced.  With the necromancer dead and the Cowled Wizards no longer hunting him, Valygar has asked to continue traveling with me.  I have accepted him back into the group.~ */ GOTO 113
  IF ~~ THEN REPLY #58287 /* ~As you wish, although I cannot promise it will be for long.~ */ DO ~EraseJournalEntry(6509)
EraseJournalEntry(6534)
EraseJournalEntry(7994)
EraseJournalEntry(7995)
EraseJournalEntry(8126)
EraseJournalEntry(8127)
EraseJournalEntry(8128)
EraseJournalEntry(8129)
EraseJournalEntry(10128)
EraseJournalEntry(16302)
EraseJournalEntry(16343)
EraseJournalEntry(16524)
EraseJournalEntry(16544)
EraseJournalEntry(16569)
EraseJournalEntry(20179)
EraseJournalEntry(20365)
EraseJournalEntry(20453)
EraseJournalEntry(23371)
EraseJournalEntry(23409)
EraseJournalEntry(3422)
EraseJournalEntry(6557)
EraseJournalEntry(7241)
EraseJournalEntry(9705)
EraseJournalEntry(9919)
EraseJournalEntry(10047)
EraseJournalEntry(23551)
EraseJournalEntry(@213)
EraseJournalEntry(@211)~ SOLVED_JOURNAL #15735 /* ~Valygar's family quest is over.

Valygar's quest is finally done.  Lavok was not what he expected, and has caused the normally judgemental ranger to think deeply about what he has experienced.  With the necromancer dead and the Cowled Wizards no longer hunting him, Valygar has asked to continue traveling with me.  I have accepted him back into the group.~ */ GOTO 114
  IF ~~ THEN REPLY #58288 /* ~I do not think it would be wise, Valygar.  I suggest you find your own way.~ */ DO ~EraseJournalEntry(6509)
EraseJournalEntry(6534)
EraseJournalEntry(7994)
EraseJournalEntry(7995)
EraseJournalEntry(8126)
EraseJournalEntry(8127)
EraseJournalEntry(8128)
EraseJournalEntry(8129)
EraseJournalEntry(10128)
EraseJournalEntry(16302)
EraseJournalEntry(16343)
EraseJournalEntry(16524)
EraseJournalEntry(16544)
EraseJournalEntry(16569)
EraseJournalEntry(20179)
EraseJournalEntry(20365)
EraseJournalEntry(20453)
EraseJournalEntry(23371)
EraseJournalEntry(23409)
EraseJournalEntry(3422)
EraseJournalEntry(6557)
EraseJournalEntry(7241)
EraseJournalEntry(9705)
EraseJournalEntry(9919)
EraseJournalEntry(10047)
EraseJournalEntry(23551)
EraseJournalEntry(@213)
EraseJournalEntry(@211)~ SOLVED_JOURNAL #15739 /* ~Valygar's family quest is over.

Valygar's quest is finally done.  Lavok was not what he expected, and has caused the normally judgemental ranger to think deeply about what he has experienced.  With the necromancer dead and the Cowled Wizards no longer hunting him, Valygar has asked to continue traveling with me.  I have declined, and the ranger told me that he could be found at his home in the Docks District should I have need of him in the future.~ */ GOTO 115
  IF ~~ THEN REPLY #58289 /* ~I've no desire to travel with a useless lout like yourself.  You haven't seen nearly half the world as I have, and I'll not be the one to teach it to you.~ */ DO ~EraseJournalEntry(6509)
EraseJournalEntry(6534)
EraseJournalEntry(7994)
EraseJournalEntry(7995)
EraseJournalEntry(8126)
EraseJournalEntry(8127)
EraseJournalEntry(8128)
EraseJournalEntry(8129)
EraseJournalEntry(10128)
EraseJournalEntry(16302)
EraseJournalEntry(16343)
EraseJournalEntry(16524)
EraseJournalEntry(16544)
EraseJournalEntry(16569)
EraseJournalEntry(20179)
EraseJournalEntry(20365)
EraseJournalEntry(20453)
EraseJournalEntry(23371)
EraseJournalEntry(23409)
EraseJournalEntry(3422)
EraseJournalEntry(6557)
EraseJournalEntry(7241)
EraseJournalEntry(9705)
EraseJournalEntry(9919)
EraseJournalEntry(10047)
EraseJournalEntry(23551)
EraseJournalEntry(@213)
EraseJournalEntry(@211)~ UNSOLVED_JOURNAL #23561 /* ~Valygar's family quest is over.

Valygar's quest is finally done.  Lavok was not what he expected, and has caused the normally judgemental ranger to think deeply about what he has experienced.  With the necromancer dead and the Cowled Wizards no longer hunting him, the ranger has gone on his own way.  I doubt I shall see him again.~ */ GOTO 116
END
END

/////////////
/* APPENDs */
/////////////

/* PPIRENI2 */

APPEND PPIRENI2
IF ~~ THEN BEGIN SUNAARGUE // from: 69.0
  SAY @191 
  IF ~~ THEN EXTERN ~PPSUNA~ 1
END

END // APPENDING PPIRENI2

/* VALYGARJ */

APPEND VALYGARJ
IF ~Global("SunaLeaves","GLOBAL",2)~ THEN BEGIN ValMetSuna1
  SAY @192
  IF ~~ THEN REPLY @193 DO ~SetGlobal("SunaLeaves","GLOBAL",3)~ GOTO ValMetSuna2
IF ~~ THEN REPLY @194 DO ~SetGlobal("SunaLeaves","GLOBAL",3)~ GOTO ValMetSuna2
END

IF ~~ THEN BEGIN ValMetSuna2
  SAY @195
  IF ~~ THEN GOTO ValMetSuna3
END

IF ~~ THEN BEGIN ValMetSuna3
  SAY @196
  IF ~~ THEN GOTO ValMetSuna4
END

IF ~~ THEN BEGIN ValMetSuna4
  SAY @197
  IF ~~ THEN REPLY @198 GOTO NoMoreValSuna
  IF ~~ THEN REPLY @199 GOTO ValMetSuna5
END

IF ~~ THEN BEGIN ValMetSuna5
  SAY @200
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN NoMoreValSuna
  SAY @201
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN ValSunaUD1
  SAY @324
  IF ~~ THEN EXTERN ~PPSUNA~ SunaValSHBye1
END

IF ~Global("u!SunaDies","GLOBAL",2)~ THEN BEGIN ValSunaSHBye1
  SAY @316
  IF ~~ THEN DO ~SetGlobal("u!SunaDies","GLOBAL",3)~ GOTO ValSunaDead
END

/*IF ~~ THEN BEGIN SunaKilled
  SAY @204
  IF ~~ THEN EXTERN ~VARAKMAH~ 1
END */

IF ~~ THEN BEGIN ValSunaDead
   SAY @329
   IF ~~ THEN REPLY @317 GOTO SunaDeadGood
   IF ~~ THEN REPLY @318 GOTO SunaDeadBad
   IF ~~ THEN REPLY @319 GOTO SunaDeadBad
END

IF ~~ THEN BEGIN SunaDeadGood
   SAY @320 
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SunaDeadBad
   SAY @321 
   IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SunaValGeas1
   SAY @326 
   IF ~~ THEN EXTERN ~PPSUNA~ SunaValGeas2
END

END // APPENDING VALYGARJ

/* PPSUNA */

APPEND PPSUNA
IF ~~ THEN BEGIN SunaValUD1
  SAY @205
  IF ~!InParty("Aerie")
!InParty("Cernd")~ THEN GOTO SunaValUD2
  IF ~!InParty("Aerie")
InParty("Cernd")
!StateCheck("Cernd",STATE_DEAD)~ THEN EXTERN ~CERNDJ~ 106
  IF ~!InParty("Cernd")
InParty("Aerie")
!StateCheck("Aerie",STATE_DEAD)~ THEN EXTERN ~AERIEJ~ AerieSuna
END

IF ~~ THEN BEGIN SunaValUD2
  SAY @323
  IF ~~ THEN EXTERN ~VALYGARJ~ ValSunaUD1
END

IF ~~ THEN BEGIN SunaValSHBye1
  SAY @325
  IF ~~ THEN EXTERN ~VALYGARJ~ SunaValGeas1
END

IF ~~ THEN BEGIN SunaValGeas2
   SAY @327
   IF ~~ THEN GOTO SunaValSHBye2
END

IF ~~ THEN BEGIN SunaValSHBye2
  SAY @208
  IF ~~ THEN DO ~SetGlobal("WackoArmy","GLOBAL",1)
OpenDoor("DOOR12")~ GOTO SunaValSHBye3
END

IF ~~ THEN BEGIN SunaValSHBye3
  SAY @209
  IF ~~ THEN DO ~ GiveItemCreate("sw1h37","Valygar",0,0,0)~ GOTO SunaValSHBye4
END

IF ~~ THEN BEGIN SunaValSHBye4
  SAY @328
  IF ~~ THEN DO ~SetGlobal("u!SunaDies","GLOBAL",1) Kill(Myself)~ UNSOLVED_JOURNAL @322 EXIT
END

END // APPENDING PPSUNA

APPEND AERIEJ

IF ~~ THEN BEGIN AerieSuna
  SAY #55762 /* ~Suldanessellar... it... it sounds familiar.  It is the high elven city, but I don't know what Irenicus would want with it.  But... he obviously can't be allowed to succeed.~ */
  IF ~~ THEN EXTERN ~PPSUNA~ SunaValUD2
END

END // APPENDING AERIEJ


///////////////////
/* INTERJECTIONS */
///////////////////

/* Valygar */

I_C_T PPIRENI2 35 ValySunaIrenicus
== VALYGARJ IF ~InParty("Valygar")~ THEN @330
END
