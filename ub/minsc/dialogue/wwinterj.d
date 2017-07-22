// Replace IsValidForPartyDialog commands with a condition
// that adds the two Boo+ globals. When Boo+, Minsc wants to talk
//
// The EXTEND_BOTTOM commands are necessary as there may be
// cases where Minsc is valid for party dialog but the BooGone
// global = 1. This equates to Boo-, where Minsc is unhappy 
// and doesn't want to interject. The EXTEND_BOTTOMs just put
// back the options that equate to Minsc not being available for
// party dialog. NB: I put WWBooGone = 3 into the same Boo- class
// as this isn't the real Boo and therefore Minsc shouldn't understand
// him.
// NB2: Some of Minsc's triggered dialogues contain important things (him leaving)
// or Booless dialog. In these cases, the triggers lead to the original dialogue
// and not the Player1 options.

// Notes: When triggering Minsc's original Boo- dialogue, it should stay in the 
// correct order in the file!
//
// Next file to compile is wwunderpants.d..

// For V2.0 of the Minsc UB component, I've replaced the original REPLACE_TRIGGER_TEXT argument
//   OR(2)
//   G("WWBooGone",1)
//   G("WWBooGone",3)
// with the simple and equivalent
//   !PartyHasItem("Misc84")
// Similarly I've replaced
//   OR(2)
//   G("WWBooGone",0)
//   G("WWBooGone",2)
// with
//  PartyHasItem("Misc84")

ADD_STATE_TRIGGER MINSCP 7
~!HasItem("wweboo","Minsc")~

REPLACE_TRIGGER_TEXT MINSCP
~True()~
~!HasItem("wweboo","Minsc")~

REPLACE_TRIGGER_TEXT CORNEIL
~Global("KnowsCowledBribe","LOCALS",0)~
~Global("KnowsCowledBribe","LOCALS",0)
G("WWBribeToCorneil",0)~


// Ishadmt1


REPLACE_TRIGGER_TEXT ISHADMT1
~IsValidForPartyDialogue("MINSC")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP ISHADMT1 3
#3  IF ~!IsValidForPartyDialogue("IMOEN2")
IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 113Ishadmt1
END

EXTEND_BOTTOM ISHADMT1 4
IF ~!IsValidForPartyDialogue("IMOEN2")
!IsValidForPartyDialogue("JAHEIRA")
IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 113Ishadmt1
END

// Aran

REPLACE_TRIGGER_TEXT ARAN
~IsValidForPartyDialogue("MINSC")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP ARAN 40
#4  IF ~IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")
!IsValidForPartyDialogue("YOSHIMO")
!IsValidForPartyDialogue("JAHEIRA")~ THEN EXTERN ~MINSCJ~ 208Aran
  IF ~~ THEN EXTERN ~ARAN~ 41
END

EXTEND_TOP ARAN 49
#5   IF ~IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")
!IsValidForPartyDialogue("KORGAN")
!IsValidForPartyDialogue("KELDORN")
!IsValidForPartyDialogue("JAHEIRA")~ THEN EXTERN ~MINSCJ~ 200Aran
END

// DCleric

REPLACE_TRIGGER_TEXT DCLERIC
~IsValidForPartyDialogue("MINSC")~
~IsValidForPartyDialogue("MINSC")
PartyHasItem("Misc84") ~

EXTEND_TOP DCLERIC 2
#2  IF ~IsValidForPartyDialogue("MINSC")~ THEN DO ~Enemy()~ EXTERN ~MINSCJ~ 112Dcleric
END


// Edwin

REPLACE_TRIGGER_TEXT EDWIN
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_BOTTOM EDWIN 0
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 117
END

EXTEND_BOTTOM EDWIN 18
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 120
END

EXTEND_TOP EDWIN 30
#2 IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("EdwinJob","GLOBAL",5)
SetGlobalTimer("EdwinMae","GLOBAL",ONE_DAY)
JoinParty()~ UNSOLVED_JOURNAL #34237 /* ~Find proof of Mae'Var's treachery.

Edwin knows of my deception in joining Mae'Var, and has opted to join with me. He said there may be a letter contained in a strongbox in Mae'Var's quarters.  This would be evidence enough for Renal, I am sure.~ */ EXTERN ~MINSCJ~ 121Edwin
END

// Neb

REPLACE_TRIGGER_TEXT NEB
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_BOTTOM NEB 5
#3   IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~Enemy()~ EXTERN ~MINSCJ~ 140Neb
END

// Viconi

REPLACE_TRIGGER_TEXT VICONI
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_BOTTOM VICONI 2
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 147Viconi
END

EXTEND_TOP VICONI 11
#3  IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~DialogueInterrupt(FALSE)
SetGlobal("ViconiaDeath","AR1000",1)
TriggerActivation("ViconiaStake",FALSE)
ReallyForceSpell(Myself,CLERIC_FLAME_STRIKE)
Wait(1)
Kill(Myself)~ EXTERN ~MINSCJ~ 146Viconi
END

EXTEND_BOTTOM VICONI 23
IF ~!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 147Viconi
END

// Anomen

REPLACE_TRIGGER_TEXT Anomenj
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP ANOMENJ 150
#4   IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 188Anomenj
END

EXTEND_TOP ANOMENJ 185
#4   IF ~!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
ReactionGT(Player1,13)~ THEN EXTERN ~MINSCJ~ 102Anomenj
  IF ~!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
ReactionLT(Player1,14)~ THEN EXTERN ~MINSCJ~ 103Anomenj
END

EXTEND_BOTTOM ANOMENJ 249
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 147Viconi
END

EXTEND_BOTTOM ANOMENJ 271
  IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~LeaveParty()
Enemy()~ EXTERN ~MINSCJ~ 170
END

EXTEND_TOP ANOMENJ 287
#3   IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 194Anomenj
END

EXTEND_TOP ANOMENJ 288
#3  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 195Anomenj
END

// Naliaj

REPLACE_TRIGGER_TEXT NALIAJ
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP NALIAJ 142
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 73Naliaj
END

EXTEND_BOTTOM NALIAJ 234
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
~ THEN EXTERN ~MINSCJ~ 100Naliaj
END


EXTEND_BOTTOM NALIAJ 248
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 150Naliaj
END

EXTEND_BOTTOM NALIAJ 291
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 228
END


// AERIEJ

REPLACE_TRIGGER_TEXT AERIEJ
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

REPLACE_TRIGGER_TEXT AERIEJ
~IsValidForPartyDialogue("MINSC")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP AERIEJ 43
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 76
END

EXTEND_TOP AERIEJ 59
#3   IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 100Aeriej
END

EXTEND_BOTTOM AERIEJ 170
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 228
END

EXTEND_BOTTOM AERIEJ 183
  IF ~IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")
!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("VICONIA")~ THEN EXTERN ~MINSCJ~ 207Aeriej
END

EXTEND_BOTTOM AERIEJ 184
  IF ~IsValidForPartyDialogue("MINSC")
!PartyHasItem("Misc84")
!IsValidForPartyDialogue("HAERDALIS")
!IsValidForPartyDialogue("VICONIA")~ THEN EXTERN ~MINSCJ~ 207Aeriej
END

// Circg1

REPLACE_TRIGGER_TEXT CIRCG1
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP CIRCG1 3
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("NoEntry","AR0700",2)
MoveToPoint([3037.1566])
Face(0)~ EXTERN ~MINSCJ~ 69Circg1
END


// Delon

REPLACE_TRIGGER_TEXT DELON
~InParty("Minsc")~
~InParty("Minsc")
PartyHasItem("Misc84")~

REPLACE_TRIGGER_TEXT DELON
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

ADD_STATE_TRIGGER DELON 42
~PartyHasItem("Misc84") ~

EXTEND_BOTTOM DELON 4
  IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 214Delon
END



EXTEND_BOTTOM DELON 8
  IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 217Delon
END

EXTEND_BOTTOM DELON 10
IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 218DelonNoTimer      // to prevent any timer conflicts
END

EXTEND_BOTTOM DELON 15
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("Acceptance","GLOBAL",1)
RevealAreaOnMap("AR1100")~ UNSOLVED_JOURNAL #2097 /* ~Investigate the deaths in the Umar Hills.

Delon was sent to find aid for the village of Imnesvale in the Umar Hills.  Apparently, people are disappearing in large numbers and it is not certain what the cause is.  I am to speak to the village mayor, Minister Lloyd Wainwright.~ */ EXTERN ~MINSCJ~ 74Delon
END

EXTEND_TOP DELON 16
#3    IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN UNSOLVED_JOURNAL #2097 /* ~Investigate the deaths in the Umar Hills.

Delon was sent to find aid for the village of Imnesvale in the Umar Hills.  Apparently, people are disappearing in large numbers and it is not certain what the cause is.  I am to speak to the village mayor, Minister Lloyd Wainwright.~ */ EXTERN ~MINSCJ~ 74Delon
END


EXTEND_BOTTOM DELON 19
  IF ~InParty("Minsc")
!PartyHasItem("Misc84")
See("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)~ THEN EXTERN ~MINSCJ~ 215Delon
END

// Hendak

REPLACE_TRIGGER_TEXT HENDAK
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~


EXTEND_BOTTOM HENDAK 4
  IF ~!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 76
END

EXTEND_TOP HENDAK 19
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 78Hendak
END

EXTEND_TOP HENDAK 37
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 77
END

// Nalia

REPLACE_TRIGGER_TEXT NALIA
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP NALIA 13
#4   IF ~!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 194Anomenj
END

EXTEND_TOP NALIA 14
#4   IF ~!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 195Anomenj
END

// Raelis
REPLACE_TRIGGER_TEXT RAELIS
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP RAELIS 33
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("HaerDalisPlotStarted","GLOBAL",1)~ EXTERN ~MINSCJ~ 192Raelis
END

// Tolger
REPLACE_TRIGGER_TEXT TOLGER
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~

EXTEND_TOP TOLGER 80
#4  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 210Tolger
END

// VALYGAR
REPLACE_TRIGGER_TEXT VALYGAR
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~


EXTEND_TOP VALYGAR 28
#7   IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
ReactionGT(Player1,13)~ THEN DO ~Enemy()~ UNSOLVED_JOURNAL #16343 /* ~The hunt for Valygar Corthala.

I have discovered Valygar Corthala, a ranger hiding in his cabin in the Umar Hills from the Cowled Wizards.  No doubt I shall be rewarded should I bring his body to them in Athkatla.~ */ EXTERN ~MINSCJ~ 102Anomenj
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
ReactionLT(Player1,14)~ THEN DO ~Enemy()~ UNSOLVED_JOURNAL #16343 /* ~The hunt for Valygar Corthala.

I have discovered Valygar Corthala, a ranger hiding in his cabin in the Umar Hills from the Cowled Wizards.  No doubt I shall be rewarded should I bring his body to them in Athkatla.~ */ EXTERN ~MINSCJ~ 103
END

EXTEND_BOTTOM VALYGAR 43
  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 101
END

EXTEND_TOP VALYGAR 44
#4   IF ~!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")~ THEN DO ~AddExperienceParty(9500)
JoinParty()~ UNSOLVED_JOURNAL #16524 /* ~The hunt for Valygar Corthala.

I have encountered Valygar Corthala in his cabin in the Umar Hills, hiding from the Cowled Wizards who believe that he will enable them to have access to the planar sphere in the Slums District of Athkatla through his blood relation to Lavok, the necromancer who created it 500 years ago.

Valygar believes that Lavok, himself, is within the sphere...and that he intends to prolong his life through taking the body of a relative as he always has.  Valygar's family has sworn to kill Lavok should he ever reappear, and now this is his chance.

I have agreed to take Valygar with me to Athkatla and enter the sphere and discover what is within...and kill Lavok should we encounter him.~ */ EXTERN ~MINSCJ~ 104Valygar
END


// BODHI

REPLACE_TRIGGER_TEXT BODHI
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP BODHI 6
#8  IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 126ReplaceBodhi
END

EXTEND_TOP BODHI 45
#3   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 127
END

EXTEND_TOP BODHI 49
#4   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 128
END

EXTEND_TOP BODHI 51
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("BodhiAppear","GLOBAL",2)
SetGlobalTimer("Bodhi","GLOBAL",ONE_DAY)~ EXTERN ~MINSCJ~ 129ReplaceBodhi
END

EXTEND_TOP BODHI 56
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 131ReplaceBodhi
END

EXTEND_TOP BODHI 77
#3   IF ~!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("BodhiJob","GLOBAL",4)~ UNSOLVED_JOURNAL #7013 /* ~Perform Bodhi's tasks to receive her aid.

My final task has been given to me by Bodhi, and it is to kill the Shadowmaster Aran Linvail.  His lair lies beneath the Shadow Thief headquarters in the Docks District, accessible only through a secret door that cannot be picked, just inside the entrance on the right.

The key for that door likely lies in the hands of my old contact Gaelan Bayle.  I will need to retrieve the key from him first if I am going to be able to enter.

Once inside, I must track down Aran's inner sanctum... perhaps with the help of a captured employee of Bodhi's named Tizzak... and kill him there.~ */ EXTERN ~MINSCJ~ 132
END

// Burch1

REPLACE_TRIGGER_TEXT BURCH1
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

// GAAL

REPLACE_TRIGGER_TEXT GAAL
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_BOTTOM GAAL 20
  IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("UnseeingEye","GLOBAL",1)~ EXTERN ~MINSCJ~ 138ReplaceGaal
END


// LYROS

REPLACE_TRIGGER_TEXT LYROS
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_BOTTOM LYROS 11
  IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("TalkedToLyros","GLOBAL",1)~ EXTERN ~MINSCJ~ 115Lyros
END




// TirDir
REPLACE_TRIGGER_TEXT TIRDIR
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP TIRDIR 11
#3   IF ~!IsValidForPartyDialog("Edwin")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~AddexperienceParty(6500)
EscapeArea()~ EXTERN ~MINSCJ~ 133TirDir
END


// WAYLANE
ADD_STATE_TRIGGER WAYLANE 0
~PartyHasItem("Misc84")~


// Elgea

REPLACE_TRIGGER_TEXT ELGEA
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~


EXTEND_TOP ELGEA 6
#4   IF ~!IsValidForPartyDialog("Keldorn")
!IsValidForPartyDialog("Mazzy")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("SpawnWelther","GLOBAL",1)~ UNSOLVED_JOURNAL #34324 /* ~Find the kidnappers who buried Tirdir.

The kidnappers had another victim imprisoned and were awaiting the ransom for her. Perhaps I might collect the ransom for this Lady Elgea, rather than just release her.~ */ EXTERN ~MINSCJ~ 134Elgea
END

// Welther

REPLACE_TRIGGER_TEXT WELTHER
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~


EXTEND_TOP WELTHER 4
#2  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("ElgeaGone","GLOBAL",1)
EraseJournalEntry(34301)
EraseJournalEntry(34302)
EraseJournalEntry(34307)
EraseJournalEntry(34311)
EraseJournalEntry(34324)
ReputationInc(-2)
EscapeArea()~ SOLVED_JOURNAL #62038 /* ~Ransom Collected For Lady Elgea

I met Welther in front of the Copper Coronet and received the ransom that was originally intended for Camitis and Reti.  Lady Elgea's location has been given to Welther. Returning to that house might not be such a good idea.~ */ EXTERN ~MINSCJ~ 135Welther
END


// deltow02

ADD_STATE_TRIGGER DELTOW02 9
~PartyHasItem("Misc84")~

// Drush

REPLACE_TRIGGER_TEXT DRUSH
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP DRUSH 9
#3 IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~AddexperienceParty(12250)
SetGlobal("Drush","GLOBAL",2)
GiveItem("MISC6B",LastTalkedToBy)~ UNSOLVED_JOURNAL #34300 /* ~Recover Dennis' mother's gong.

Drush gave me the gong (and WHEW does it stink!)...I suppose all that remains, now, is to return it to Dennis at Delosar's in Athkatla.~ */ EXTERN ~MINSCJ~ 107Drush
END


// Gphil01

REPLACE_TRIGGER_TEXT GPHIL01
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~


EXTEND_BOTTOM GPHIL01 3
IF ~!IsValidForPartyDialog("HaerDalis")
!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 144Gphil01
END

// Lout

REPLACE_TRIGGER_TEXT LOUT
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84") ~

EXTEND_TOP LOUT 22
#3 IF ~!IsValidForPartyDialog("Keldorn")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~SetGlobal("AttackVittorio","AR0514",1)~ EXTERN ~MINSCJ~ 108Lout
END

// UHMAY01

REPLACE_TRIGGER_TEXT UHMAY01
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP UHMAY01 18
#6   IF ~!IsValidForPartyDialog("Edwin")
!IsValidForPartyDialog("Nalia")
!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN JOURNAL #2099 /* ~Investigate the deaths in the Umar Hills.

Minister Lloyd told me of several possibilities for the murders. He suspects that a recently arrived group of creatures led by the ogre Madulf are responsible.  There are also normally peaceable wolves that have been in the hills for several years.  He also mentioned a legend regarding the Umar witch who once ruled this area. The murders seem very similar to when she was alive.
He also mentioned another group of adventurers led by the knight Mazzy Fentan. He had hired them earlier but they have not returned.~ */ EXTERN ~MINSCJ~ 228
END

EXTEND_BOTTOM UHMAY01 24
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXIT
END

EXTEND_BOTTOM UHMAY01 33
  IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN EXTERN ~MINSCJ~ 229Replace
END

// FIRKRA01

REPLACE_TRIGGER_TEXT FIRKRA01
~IsValidForPartyDialog("Minsc")~
~IsValidForPartyDialog("Minsc")
PartyHasItem("Misc84")~

EXTEND_TOP FIRKRA01 9
#2   IF ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")~ THEN DO ~RevealAreaOnMap("AR1200")
EscapeArea()~ UNSOLVED_JOURNAL #11821 /* ~Journey to the Windspear Hills.

I was approached by a Lord Jierdan Firkraag, whose lands outside of Athkatla are being plagued by ogre bandits.  He has asked that I journey to the Windspear Hills and kill these ogres, and has offered a 10,000 gp reward for the deed.~ */ EXTERN ~MINSCJ~ 96Firkra01

END



// INTERJECTION REPLACEMENTS HERE

CHAIN
IF WEIGHT #10 ~IsValidForPartyDialog("Minsc")
!PartyHasItem("Misc84")
Global("InteractMinsc2","LOCALS",0)
RandomNum(2,1)~ THEN DELTOW02 9Replace
@0
== MINSCJ @1
== DELTOW02 @2
END
IF ~~ THEN DO ~SetGlobal("InteractMinsc2","LOCALS",1)~ EXTERN ~MINSCJ~ 106


CHAIN
IF WEIGHT #-1 ~
G("WWBooGone",1)
See("Minsc")
InParty("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
RandomNum(2,1)
Global("WWwaylaneminsc","LOCALS",0)~ THEN WAYLANE MinscConvo
@3
== MINSCJ @4
== WAYLANE @5
== MINSCJ @6
== WAYLANE @7
== MINSCJ @8
= @9
END
IF ~~ THEN EXIT

CHAIN
IF WEIGHT #-2 ~
G("WWBooGone",3)
See("Minsc")
InParty("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
RandomNum(2,1)
Global("WWwaylaneminsc","LOCALS",0)~ THEN WAYLANE MinscConvo
@3
== MINSCJ @4
== WAYLANE @5
== MINSCJ @10
== WAYLANE @11
== MINSCJ @12
END
IF ~~ THEN EXIT



APPEND ~DELON~



IF WEIGHT #-1 ~NumTimesTalkedTo(0)
InParty("Minsc")
!PartyHasItem("Misc84")
Detect("Minsc")
!StateCheck("Minsc",STATE_SLEEPING)
!Global("OgronAttack","GLOBAL",1)
!Global("UmarPlot","GLOBAL",1)~ THEN BEGIN 42 // from:
  SAY #59064 /* ~Umm... excuse me, sir.  Y-y-you... you look like a warrior.  Are... are you a warrior?  C-c-could you help me?~ */
  IF ~~ THEN DO ~SetGlobal("TalkedToDelon","GLOBAL",1)~ EXTERN ~MINSCJ~ 212Replace
END

IF ~~ 0Replace
  SAY #16765 /* ~Oh, uh.  H-h-hello, <SIRMAAM>.~ */
  IF ~~ THEN REPLY #16766 /* ~And hello to you, young man.  What might your name be?~ */ DO ~SetGlobal("TalkedToDelon","GLOBAL",1)~ GOTO 3
  IF ~~ THEN REPLY #16767 /* ~This is a strange place for a young boy to be in, isn't it?~ */ DO ~SetGlobal("TalkedToDelon","GLOBAL",1)~ GOTO 4
  IF ~~ THEN REPLY #16768 /* ~I'll not speak to brats.  Begone.~ */ DO ~SetGlobal("TalkedToDelon","GLOBAL",1)~ GOTO 2
  IF ~~ THEN REPLY #16769 /* ~Excuse me, I must be going.~ */ DO ~SetGlobal("TalkedToDelon","GLOBAL",1)~ GOTO 1
END

END



APPEND MINSCJ

IF ~~ 113Ishadmt1
SAY @13
  IF ~~ THEN EXTERN ~ISHADMT1~ 7
END

IF ~~ 208Aran
SAY @14
  IF ~~ THEN EXTERN ~ARAN~ 41
END

IF ~~ 200Aran
SAY @15
  IF ~~ THEN EXTERN ~ARAN~ 50
END

IF ~~ 112Dcleric
 SAY @16
  IF ~~ THEN EXIT
END

IF ~~ 121Edwin
  SAY @17
  IF ~~ THEN EXIT
END

IF ~~ 140Neb
SAY @18
  IF ~~ THEN DO ~Attack("Neb")~ EXIT
END

IF ~~ 147Viconi
SAY @19
  IF ~~ THEN EXTERN ~VICONI~ 24
END

IF ~~ 146Viconi
  SAY @20
  IF ~!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Keldorn")~ THEN EXIT
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 113
  IF ~!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Keldorn")~ THEN EXTERN ~KELDORJ~ 179
END

IF ~~ 188Anomenj
  SAY @21
  IF ~!IsValidForPartyDialog("Viconia")~ THEN EXTERN ~ANOMENJ~ 52
  IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ 165
END

IF ~~ 102Anomenj
  SAY  @22
  IF ~!IsValidForPartyDialog("Aerie")~ THEN EXIT
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 61
END

IF ~~ 103Anomenj
  SAY @23
  IF ~!IsValidForPartyDialog("Aerie")~ THEN DO ~LeaveParty()
Enemy()~ EXIT
  IF ~IsValidForPartyDialog("Aerie")
ReactionGT(Player1,10)~ THEN DO ~LeaveParty()
Enemy()~ EXTERN ~AERIEJ~ 61
  IF ~IsValidForPartyDialog("Aerie")
ReactionLT(Player1,11)~ THEN DO ~LeaveParty()
Enemy()~ EXTERN ~AERIEJ~ 60
END

IF ~~ 194Anomenj
SAY @24
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~NALIA~ 66
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 502
END

IF ~~ 195Anomenj
SAY @25
  IF ~!IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~NALIA~ 53
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 503
END

IF ~~ 73Naliaj
SAY @26
  IF ~~ THEN EXTERN ~NALIAJ~ 143
END

IF ~~ 100Naliaj
  SAY @27
  IF ~~ THEN EXTERN ~VALYGAR~ 9
END

IF ~~ 150Naliaj
  SAY @28
  IF ~~ THEN EXTERN ~NALIAJ~ 149
END

IF ~~ 100Aeriej
SAY @29
  IF ~~ THEN EXTERN ~VALYGAR~ 9
END

IF ~~ 207Aeriej
  SAY @30
  IF ~~ THEN EXIT
END

IF ~~ 69Circg1
 SAY @31
  IF ~!IsValidForPartyDialog("Yoshimo")~ THEN EXIT
  IF ~IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 25
END


 IF ~~ 212Replace
SAY @32
= @33
 IF ~~ THEN DO ~SetGabber(Player1)~ EXTERN ~DELON~ 0Replace
END


IF ~~ 214Delon
SAY @34
  IF ~~ THEN EXTERN ~DELON~ 19
END


IF ~~217Delon
SAY @35
IF ~~ THEN EXTERN ~DELON~ 10
END

IF ~~ 218DelonNoTimer
  SAY @36
  IF ~~ THEN REPLY #59080 /* ~Right you are, Minsc!~ */ EXTERN ~DELON~ 15
  IF ~~ THEN REPLY #59081 /* ~Well... as long as the reward is decent, we could always take a look.~ */ EXTERN ~DELON~ 15
  IF ~~ THEN REPLY #59082 /* ~I don't know if we have time, Minsc, but we'll see.~ */ GOTO 219DelonNoTimer
  IF ~~ THEN REPLY #59083 /* ~Forget it, Minsc.  We're not running off on some fool's errand.~ */ GOTO 220DelonNoTimer
END

IF ~~ 219DelonNoTimer
SAY @37
  IF ~~ THEN EXTERN ~DELON~ 15
END

IF ~~ 220DelonNoTimer
SAY @38
  IF ~~ THEN GOTO 221
END

IF ~~ 221DelonNoTimer
SAY @39
  IF ~~ THEN EXTERN ~DELON~ 15
END

IF ~~ BEGIN 74Delon
  SAY @40
  IF ~!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Jaheira")~ THEN EXIT
  IF ~IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 44
  IF ~!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 320
END

IF ~~ THEN BEGIN 215Delon
  SAY @41
  IF ~~ THEN EXTERN ~DELON~ 44
END


IF ~~ 78Hendak
  SAY @42
  IF ~!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~HENDAK~ 24
  IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 323
  IF ~!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 33
END

IF ~~ 192Raelis
SAY @43
  IF ~~ THEN EXTERN ~RAELIS~ 34
END

IF ~~ 210Tolger
SAY @44
  IF ~~ THEN EXTERN ~TOLGER~ 81
END

IF ~~ 104Valygar
  SAY @45
  IF ~!IsValidForPartyDialog("Cernd")
OR(2)
!Global("HiredByCowled","GLOBAL",1)
!IsValidForPartyDialog("Korgan")~ THEN EXIT
  IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN ~CERNDJ~ 93
  IF ~!IsValidForPartyDialog("Cernd")
Global("HiredByCowled","GLOBAL",1)
IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 221
END


IF ~~ 126ReplaceBodhi
SAY @46
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Korgan")
!IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~BODHI~ 130
  IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ 59
  IF ~!IsValidForPartyDialog("Valygar")
IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 88
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Aerie")
IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 222
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
IsValidForPartyDialog("Korgan")~ THEN EXTERN ~KORGANJ~ 98
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Aerie")
!IsValidForPartyDialog("Anomen")
!IsValidForPartyDialog("Korgan")
IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 76
END

IF ~~ 129ReplaceBodhi
SAY @47
  IF ~~ THEN GOTO 130
END

IF ~~ 131ReplaceBodhi
SAY @48
  IF ~!IsValidForPartyDialog("Aerie")~ THEN EXTERN ~BODHI~ 57
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 93
END

IF ~~ 138ReplaceGaal
SAY @49
  IF ~~ THEN DO ~Attack("Gaal")~ EXIT
END

IF ~~ 115Lyros
SAY @50
  IF ~~ THEN EXTERN ~LYROS~ 29
END

IF ~~ 133TirDir
  SAY @51
  IF ~!IsValidForPartyDialog("Anomen")~ THEN EXIT
  IF ~IsValidForPartyDialog("Anomen")~ THEN EXTERN ~ANOMENJ~ 224
END

IF ~~ 134Elgea
SAY @52
  IF ~!IsValidForPartyDialog("Edwin")~ THEN EXIT
  IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN ~EDWINJ~ 81
END

IF ~~ 135Welther
SAY @53
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Jaheira")
!IsValidForPartyDialog("Viconia")~ THEN EXIT
  IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN ~VALYGARJ~ 64
  IF ~!IsValidForPartyDialog("Valygar")
IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 411
  IF ~!IsValidForPartyDialog("Valygar")
!IsValidForPartyDialog("Jaheira")
IsValidForPartyDialog("Viconia")~ THEN EXTERN ~VICONIJ~ 61
END

IF ~~ 107Drush
SAY @54
  IF ~!IsValidForPartyDialog("Aerie")~ THEN EXIT
  IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN ~AERIEJ~ 70
END

IF ~~ 144Gphil01
SAY @55
  IF ~~ THEN DO ~Attack("gphil03")~ EXIT
END


IF ~~ 108Lout
SAY @56
  IF ~!IsValidForPartyDialog("Valygar")~ THEN DO ~Attack("Dennis")~ EXIT
  IF ~IsValidForPartyDialog("Valygar")~ THEN DO ~Attack("Dennis")~ EXTERN ~VALYGARJ~ 55
END

IF ~~ 229Replace
SAY @57
IF ~~ THEN EXIT
END
		
IF ~~ 96Firkra01
  SAY @58
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Yoshimo")
!IsValidForPartyDialog("Jaheira")~ THEN EXIT
  IF ~IsValidForPartyDialog("Jan")~ THEN EXTERN ~JANJ~ 97
  IF ~!IsValidForPartyDialog("Jan")
IsValidForPartyDialog("Yoshimo")~ THEN EXTERN ~YOSHJ~ 41
  IF ~!IsValidForPartyDialog("Jan")
!IsValidForPartyDialog("Yoshimo")
IsValidForPartyDialog("Jaheira")~ THEN EXTERN ~JAHEIRAJ~ 356
END



END
