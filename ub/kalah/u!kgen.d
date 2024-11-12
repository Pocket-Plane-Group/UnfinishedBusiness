BEGIN ~U!KGen~

IF WEIGHT #-1 ~NumTimesTalkedTo(0)~ THEN BEGIN KalahGenieStart
SAY @224
IF ~~ THEN REPLY @225 GOTO Genie2
IF ~~ THEN REPLY @226 GOTO Genie2
END

IF ~~ THEN BEGIN Genie2
SAY @227
IF ~~ THEN REPLY @228 GOTO Genie3
IF ~~ THEN REPLY @229 GOTO Genie3
IF ~~ THEN REPLY @230 GOTO GenWishes
END

IF ~~ THEN BEGIN Genie3
SAY @231
= @232
= @233
= @234
= @235
= @236
= @237
IF ~~ THEN GOTO GenWishes
END

IF ~~ THEN BEGIN GenWishes
SAY @238
IF ~OR(2) CheckStatGT(LastTalkedToBy,12,WIS) CheckStatGT(LastTalkedToBy,12,INT)~ THEN REPLY @239 GOTO RaiseKalah
IF ~CheckStatLT(LastTalkedToBy,13,WIS) CheckStatLT(LastTalkedToBy,13,INT)~ THEN REPLY @240 GOTO DeadKalah
IF ~~ THEN REPLY @241 GOTO FreeGenie
IF ~~ THEN REPLY @242 GOTO SoulKalah
IF ~GlobalLT("Chapter","GLOBAL", %bg2_chapter_4%) !Global("C#IM_ImoenStays","GLOBAL",1) OR(2) CheckStatGT(LastTalkedToBy,12,WIS) CheckStatGT(LastTalkedToBy,12,INT)~ THEN REPLY @342 GOTO Failed
IF ~GlobalLT("Chapter","GLOBAL", %bg2_chapter_4%) !Global("C#IM_ImoenStays","GLOBAL",1) CheckStatLT(LastTalkedToBy,13,WIS) CheckStatLT(LastTalkedToBy,13,INT)~ THEN REPLY @243 GOTO WrongImoen
IF ~~ THEN REPLY @244 GOTO Failed
IF ~~ THEN REPLY @245 GOTO JafirKill
IF ~~ THEN REPLY @246 GOTO NoMoreWishes
IF ~~ THEN REPLY @247 GOTO 0
END

IF ~~ THEN BEGIN WrongImoen
SAY @343
IF ~~ THEN DO ~CreateVisualEffectObject("ICRAISEI",Player1) Wait(1) CreateCreatureObjectOffset("U!KImoen",Player1,[0.0]) AddexperienceParty(1000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @344 EXIT
END

IF ~~ THEN BEGIN Failed
SAY @248
= @249
= @250
= @251
IF ~~ THEN GOTO GenWishes
END

IF ~~ THEN BEGIN NoMoreWishes
SAY @252
IF ~~ THEN GOTO GenWishes
END

IF ~~ THEN BEGIN RaiseKalah
SAY @253
IF ~~ THEN DO ~ReputationInc(1) CreateVisualEffectObject("ICRAISEI",Player1) Wait(1) CreateCreatureObjectOffset("U!Krais",Player1,[0.0]) AddexperienceParty(1000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @254 EXIT
END

IF ~~ THEN BEGIN DeadKalah
SAY @255
IF ~~ THEN DO ~CreateVisualEffectObject("SPRAISED",Player1) Wait(1) CreateCreatureObjectOffset("U!Kdead",Player1,[0.0]) AddexperienceParty(1000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @256 EXIT
END

IF ~~ THEN BEGIN FreeGenie
SAY @257
IF ~~ THEN DO ~ReputationInc(1) AddexperienceParty(5000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @258 EXIT
END

IF ~~ THEN BEGIN SoulKalah
SAY @259
IF ~~ THEN DO ~AddexperienceParty(1000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @260 EXIT
END

IF ~~ THEN BEGIN JafirKill
SAY @261
IF ~~ THEN DO ~AddexperienceParty(3000) EraseJournalEntry(@271) ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @262 EXIT
END

IF ~~ THEN BEGIN 0 // from:
SAY @263
IF ~CheckStatGT(LastTalkedToBy,9,WIS)~ THEN REPLY #58562 /* ~I wish for my entire party to be healed.~ */ GOTO 13
  IF ~CheckStatLT(LastTalkedToBy,10,WIS)~ THEN REPLY #58563 /* ~I wish that none of my party would die of their wounds.~ */ GOTO 14
  IF ~CheckStatGT(LastTalkedToBy,15,WIS)~ THEN REPLY #58564 /* ~I wish that spells I have cast would be restored, that I might cast them again!~ */ GOTO 15
  IF ~CheckStatLT(LastTalkedToBy,16,WIS)~ THEN REPLY #58565 /* ~I wish for my spells to be restored!~ */ GOTO 16
  IF ~CheckStatGT(LastTalkedToBy,11,WIS)~ THEN REPLY #58566 /* ~I wish to make my party invulnerable.~ */ GOTO 17
  IF ~CheckStatLT(LastTalkedToBy,12,WIS)~ THEN REPLY #58567 /* ~I wish that magic would fail to affect me or my party.~ */ GOTO 18
  IF ~~ THEN REPLY #58568 /* ~I wish to summon a horde to overrun my enemies.~ */ GOTO 19
  IF ~CheckStatGT(LastTalkedToBy,9,WIS)~ THEN REPLY #58569 /* ~I wish to be protected from the undead.~ */ GOTO 20
  IF ~CheckStatLT(LastTalkedToBy,10,WIS)~ THEN REPLY #58570 /* ~I wish to be protected from undead right now.~ */ GOTO 21
IF ~CheckStatGT(LastTalkedToBy,9,WIS)
Global("wishRich","GLOBAL",0)~ THEN REPLY #58541 /* ~I wish to be rich.~ */ DO ~SetGlobal("wishRich","GLOBAL",1)~ GOTO 3
  IF ~CheckStatGT(LastTalkedToBy,10,WIS)
Global("wishArmor","GLOBAL",0)~ THEN REPLY #58542 /* ~I wish for a powerful magical item.~ */ DO ~SetGlobal("wishArmor","GLOBAL",1)~ GOTO 6
  IF ~CheckStatGT(LastTalkedToBy,3,WIS)
Global("wishXP","GLOBAL",0)~ THEN REPLY #58543 /* ~I wish to be more experienced.~ */ DO ~SetGlobal("wishXP","GLOBAL",1)~ GOTO 7
  IF ~CheckStatGT(LastTalkedToBy,11,WIS)
Global("wishGlasses","GLOBAL",0)~ THEN REPLY #58544 /* ~I wish to see all as it really is.~ */ DO ~SetGlobal("wishGlasses","GLOBAL",1)~ GOTO 11
  IF ~CheckStatGT(LastTalkedToBy,9,WIS)
!Dead("dennis")
!Global("DennisHasGong","GLOBAL",1)
Global("wishQuest","GLOBAL",0)~ THEN REPLY #58545 /* ~I wish for an adventure like none I've ever experienced before.~ */ DO ~SetGlobal("wishQuest","GLOBAL",1)~ GOTO 8
  IF ~CheckStatGT(LastTalkedToBy,13,WIS)
Global("wishTime","GLOBAL",0)~ THEN REPLY #58546 /* ~I wish for control over time.~ */ DO ~SetGlobal("wishTime","GLOBAL",1)~ GOTO 9
  IF ~CheckStatGT(LastTalkedToBy,5,WIS)
Global("wishShape","GLOBAL",0)~ THEN REPLY #58547 /* ~I wish to be anything I desire.~ */ DO ~SetGlobal("wishShape","GLOBAL",1)~ GOTO 10
  IF ~CheckStatGT(LastTalkedToBy,9,WIS)
Global("wishContigency","GLOBAL",0)~ THEN REPLY #58548 /* ~I wish to be prepared for anything.~ */ DO ~SetGlobal("wishContigency","GLOBAL",1)~ GOTO 5
  IF ~CheckStatGT(LastTalkedToBy,11,WIS)
Global("wishWail","GLOBAL",0)~ THEN REPLY #58549 /* ~I wish that all my enemies will die.~ */ DO ~SetGlobal("wishWail","GLOBAL",1)~ GOTO 4
IF ~~ THEN REPLY @264 GOTO GenWishes
END

IF ~~ THEN BEGIN 3 // from: 1.2
  SAY #58551 /* ~Rich you want, then rich you shall be.~ */
  IF ~~ THEN DO ~GiveItemCreate("misc38",LastTalkedToBy,0,0,0)
GiveItemCreate("misc36",LastTalkedToBy,0,0,0)
GiveItemCreate("misc35",LastTalkedToBy,0,0,0)
GiveItemCreate("misc43",LastTalkedToBy,0,0,0)
GivePartyGold(2000)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 4 // from: 1.10
  SAY #58552 /* ~Then let your enemies fall now!~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ForceSpell(Myself,WIZARD_WAIL_OF_THE_BANSHEE))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 5 // from: 1.9
  SAY #58553 /* ~Contingencies are the key to preparation.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ForceSpell(Myself,WIZARD_CHAIN_CONTINGENCY))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 6 // from: 1.3
  SAY #58554 /* ~Then you shall have it.~ */
  IF ~~ THEN DO ~GiveItemCreate("plat19",LastTalkedToBy,0,0,0)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 7 // from: 1.4
  SAY #58556 /* ~(chuckle)  Fight well and experience you will earn.~ */
  IF ~~ THEN DO ~CreateCreatureObjectEffect("golada01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("golsan01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("goljug01","SPDIMNDR",LastTalkedToBy)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 8 // from: 1.6
  SAY #58557 /* ~Soon you will have your quest, my Master.~ */
  IF ~~ THEN DO ~GiveItemCreate("wishscrl",LastTalkedToBy,0,0,0)
DisplayStringHead(Myself,3089)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 9 // from: 1.7
  SAY #58558 /* ~Time is now your ally, Master.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WIZARD_TIME_STOP))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 10 // from: 1.8
  SAY #58559 /* ~I give you then the ability to shapechange...use it wisely for it will not last forever.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WIZARD_SHAPECHANGE))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 11 // from: 1.5
  SAY #58560 /* ~With these glasses no item will be beyond your ability to comprehend.~ */
  IF ~~ THEN DO ~GiveItemCreate("misc3p",LastTalkedToBy,0,0,0)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 13 // from: 12.0
  SAY #58573 /* ~Then all shall be healed. ~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_HEAL_PARTY))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 14 // from: 12.1
  SAY #58574 /* ~Granted.  All will die of other afflictions, but not of the wounds they have. ~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_POISON))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 15 // from: 12.2
  SAY #58575 /* ~Then I shall grant your wish and restore some of your lost spells.~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_MEMORIZE))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 16 // from: 12.3
  SAY #58576 /* ~Granted. Your spells have been restored to the way they were before you memorized them. ~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_LOSE_SPELL))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 17 // from: 12.4
  SAY #58577 /* ~Invulnerability you shall have!~ */
  IF ~~ THEN DO ~ActionOverride(Player1,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player2,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player3,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player4,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player5,ReallyForceSpell(Myself,WISH_GLOBE))
ActionOverride(Player6,ReallyForceSpell(Myself,WISH_GLOBE))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 18 // from: 12.5
  SAY #58578 /* ~A curious request, but consider it granted. None of your spells shall function. ~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_SPELL_FAILURE))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 19 // from: 12.6
  SAY #58579 /* ~A horde?  As you wish...~ */
  IF ~~ THEN DO ~ActionOverride(LastTalkedToBy,ReallyForceSpell(Myself,WISH_RABBIT))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 20 // from: 12.7
  SAY #58580 /* ~Protection granted.~ */
  IF ~~ THEN DO ~ActionOverride(Player1,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player2,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player3,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player4,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player5,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
ActionOverride(Player6,ReallyForceSpell(Myself,CLERIC_NEGATIVE_PLANE_PROTECTION))
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END

IF ~~ THEN BEGIN 21 // from: 12.8
  SAY #58581 /* ~Protection from undead granted, and I shall have to summon some undead for you to be protected from. ~ */
  IF ~~ THEN DO ~DayNight(MIDNIGHT)
CreateCreatureObjectEffect("vamanc01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vamver01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vamold01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
CreateCreatureObjectEffect("vammat01","SPDIMNDR",LastTalkedToBy)
EraseJournalEntry(@271)
SetInterrupt(FALSE)
ForceSpell(Myself,DRYAD_TELEPORT)~ SOLVED_JOURNAL @350 EXIT
END
