///////////
/* Thugs */
///////////

BEGIN ~WWDEL~     // Make sure thug banter initiates
BEGIN ~WWEFF~
BEGIN ~WWSTEN~

//////////////////////
/* Billy's dialogue */
//////////////////////

BEGIN ~WWBILL~    // wwbill is DV  wwbill is Override

// Backup dialogue in case the Oops scenario doesn't work

IF ~AreaCheck("AR0300")
	G("WWBooGone",1)
	Global("WWBillyBackupText","LOCALS",0)~ THEN BillyBackupText
SAY @807
IF ~~ THEN DO ~SetGlobal("WWBillyBackupText","LOCALS",1)
				ClearAllActions()
				SetInterrupt(FALSE)
				SetGlobal("WWBillySeen","GLOBAL",2)
				SetGlobal("WWHelpFindBoo","GLOBAL",10)
				DisplayStringHead("WWBill",5251)
				Wait(1)
				MoveToPointNoInterrupt([2270.2104])
				OpenDoor("Door0314")
				SetInterrupt(FALSE)
				SmallWait(3)
				MoveBetweenAreas("AR0314",[412.542],2)~ EXIT
END

IF ~CombatCounter(0)
	Global("WWBooGone","GLOBAL",0)
	Global("WWRudeSod","LOCALS",0)~ THEN RudeSod
SAY @5
IF ~~ THEN DO ~SetGlobal("WWRudeSod","LOCALS",1)~ EXIT
END

IF ~CombatCounter(0)
	Global("WWBooGone","GLOBAL",0)
	Global("WWRudeSod","LOCALS",1)~ THEN RudeSod2
SAY @6
= @7
IF ~~ THEN DO ~SetGlobal("WWRudeSod","LOCALS",0)~ EXIT
END

IF ~AreaCheck("AR0314")
	CombatCounter(0)
	Global("WWBooGone","GLOBAL",1)
	!Global("WWMoveToV","LOCALS",2)
	!See("Minsc")~ THEN Rudesod2ii
SAY @8
IF ~~ THEN EXIT
END

IF ~AreaCheck("AR0314")
	CombatCounter(0)
	Global("WWBooGone","GLOBAL",1)
    !Global("WWMoveToV","LOCALS",2)~ THEN Rudesod2i
SAY @9
IF ~~ THEN EXIT
END


IF ~Global("WWBooGone","GLOBAL",1)          // ie he's run into the tavern
	Global("WWBillySeen","GLOBAL",2)        // and you've left Minsc outside...
	Global("WWMoveToV","LOCALS",0)
	AreaCheck("AR0314")
//o    IsGabber([PC])
	CombatCounter(0)
	!See("Minsc")~ THEN bratness
SAY @8
IF ~~ THEN EXIT
END

IF ~See("Minsc")
	Global("WWMoveToV","LOCALS",2)~ THEN ComplainToVivick
SAY @10
IF ~~ THEN DO ~SetGlobal("WWMoveToV","LOCALS",3)~ EXTERN WWVIVI PickOnKid
END

IF ~
//o IsGabber([PC])
	CombatCounter(0)
	Global("WWBooGone","GLOBAL",0)
	Global("WWMoveToV","LOCALS",3)
	Global("WWBillyScared","LOCALS",0)~ THEN FakeScared
SAY @11
= @12
IF ~~ THEN DO ~SetGlobal("WWBillyScared","LOCALS",1)~ EXIT
END

IF ~
//o IsGabber([PC])
	CombatCounter(0)
	Global("WWBooGone","GLOBAL",2)~ THEN Rudesod2ii
SAY @13
IF ~~ THEN EXIT
END

IF ~~ Cantmakeme
SAY @14
= @15
++ @16 + Eek
++ @17 + Eek
++ @18 + Eek
END

IF ~~ Eek
SAY @19
++ @20 EXTERN WWVIVI ControlKid
++ @21 EXTERN WWVIVI ControlKid
END

IF ~Global("WWBillyScared","GLOBAL",1)~ BillyConfes
SAY @22
IF ~~ THEN DO ~SetGlobal("WWBillyScared","GLOBAL",2)~ EXTERN MINSCJ SoldBooToHalfling
END

///////////////////////
/* Vivick's dialogue */
///////////////////////

BEGIN ~WWVIVI~

IF ~~ PickOnKid
SAY @23
++ @24 + ThiefBilly
++ @25 + ThiefBilly
++ @26 + OuttaTheWay
END

IF ~~ ControlKid
SAY @27
+ ~CheckStatGT(Player1,14,CHR)~ + @28 + VivickYells
+ ~CheckStatGT(Player1,14,CHR)~ + @29 + VivickHigh
+ ~PartyGoldGT(49)~ + @30 + 50Gold
+ ~PartyGoldGT(499)~ + @31 + 500Gold
+ ~PartyGoldLT(50)~ + @32 + NoReason
++ @33 + BuriedHead
END

IF ~~ VivickHigh
SAY @34
IF ~~ THEN EXTERN WWBILL Yapper
END

IF ~~ BuriedHead
SAY @35
++ @36 + FightVivic
++ @37 + ControlKid2
END

IF ~~ ControlKid2
SAY @38
+ ~CheckStatGT(Player1,14,CHR)~ + @28 + VivickYells
+ ~CheckStatGT(Player1,14,CHR)~ + @29 + VivickHigh
+ ~PartyGoldGT(49)~ + @30 + 50Gold
+ ~PartyGoldGT(499)~ + @31 + 500Gold
+ ~PartyGoldLT(50)~ + @32 + NoReason
++ @33 + BuriedHead
END

IF ~~ VivickYells
SAY @39
IF ~~ THEN EXTERN WWBILL Yapper
END

IF ~~ 500Gold
SAY @40
IF ~~ THEN DO ~TakePartyGold(500)~ EXTERN WWBILL Yapper
END

IF ~~ THEN Warning2Heal
SAY @41
IF ~~ THEN DO ~SetGlobal("WWFightVivickNow","GLOBAL",0)~ EXIT
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",1)		// Minsc fights
	HPPercentLT("Minsc",75)~ THEN Warning2Heal2
SAY @42
+ ~HPPercentGT(Player1,74)
	IsGabber(Player1)~ + @43 DO ~SG("WWFightVivick",2)~ EXTERN WWVIVI QuickFight
+ ~HPPercentGT(Player1,74)
   !IsGabber(Player1)~ + @44 DO ~SG("WWFightVivick",2)~ EXTERN WWVIVI QuickFight
++ @45 EXIT   // Fight off
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",2)	    // PC fights
	HPPercentLT(Player1,75)~ THEN Warning2Heal3
SAY @46
+ ~HPPercentGT("Minsc",74)~ + @47 DO ~SetGlobal("WWFightVivick","GLOBAL",1)~ EXTERN WWVIVI QuickFight
++ @45 EXIT
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",1)		// Minsc fights
	HPPercentGT("Minsc",74)
    PartyGoldLT(50)~ THEN Back2
SAY @48
++ @49 + QuickFight
+ ~HPPercentGT(Player1,74)
	IsGabber(Player1)~ + @50 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN WWVIVI QuickFight
+ ~HPPercentGT(Player1,74)
	!IsGabber(Player1)~ + @51 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN WWVIVI QuickFight
++ @52 EXTERN WWVIVI ComeLater
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",2)		// PC Fights
	HPPercentGT(Player1,74)
    PartyGoldLT(50)~ THEN Back3
SAY @53
++ @54 EXTERN WWVIVI ComeLater
+ ~HPPercentGT("Minsc",74)~ + @47 DO ~SetGlobal("WWFightVivick","GLOBAL",1)~ EXTERN WWVIVI QuickFight
+ ~IsGabber(Player1)~ + @55 EXTERN WWVIVI QuickFight
+ ~!IsGabber(Player1)~ + @56 EXTERN WWVIVI QuickFight
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",1)		// Minsc fights
	HPPercentGT("Minsc",74)
	PartyGoldGT(49)~ THEN Back2
SAY @57
++ @58 + QuickFight
+ ~HPPercentGT(Player1,74)
	IsGabber(Player1)~ + @50 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN WWVIVI QuickFight
+ ~HPPercentGT(Player1,74)
	!IsGabber(Player1)~ + @51 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN WWVIVI QuickFight
++ @52 EXTERN WWVIVI ComeLater
END

IF ~
//o IsGabber([PC])
	Global("WWFightVivickNow","GLOBAL",0)
	Global("WWFightVivick","GLOBAL",2)		// PC Fights
	HPPercentGT(Player1,74)
	PartyGoldGT(49)~ THEN Back3
SAY @59
++ @54 EXTERN WWVIVI ComeLater
+ ~HPPercentGT("Minsc",74)~ + @47 DO ~SetGlobal("WWFightVivick","GLOBAL",1)~ EXTERN WWVIVI QuickFight
+ ~IsGabber(Player1)~ + @55 EXTERN WWVIVI QuickFight
+ ~!IsGabber(Player1)~ + @56 EXTERN WWVIVI QuickFight
END

IF ~~ QuickFight
SAY @60
IF ~~ THEN DO ~ ClearAllActions()
				SetGlobal("WWFightVivickNow","GLOBAL",1)
			    SetGlobal("WWSetSlot","GLOBAL",0)~ EXIT
END


IF WEIGHT #-2 ~Global("WWFightVivickNow","GLOBAL",3)
	PartyGoldGT(49)~ THEN VivickWins
SAY @61
= @62
IF ~~ THEN DO ~	TakePartyGold(50)
				SetGlobal("WWFightVivickNow","GLOBAL",0)
				ClearAllActions()~ EXIT
END

IF WEIGHT #-1 ~Global("WWFightVivickNow","GLOBAL",3)
	PartyGoldLT(50)~ THEN VivickWins2
SAY @63
= @62
IF ~~ THEN DO ~SetGlobal("WWFightVivickNow","GLOBAL",0)
			ClearAllActions()~ EXIT
END

///////////////////////
/* Smethy's dialogue */
///////////////////////

BEGIN ~WWSWOO~

IF ~Global("WWYouAttackedMeYouBastards","LOCALS",1)~ HitSmethy
SAY @64
= @65
= @66
= @67
= @68
IF ~~ THEN 	UNSOLVED_JOURNAL @69
			DO ~SetGlobal("WWHelpFindBoo","GLOBAL",6)
			   SetGlobalTimer("WWFindBooTimer","GLOBAL",THREE_DAYS)  		// ie Minsc's last complaint will run after three more days of no Boo
			   SetGlobal("WWInspectFountain","GLOBAL",1)             	// this is to allow leeway for the Perth component
			   ClearAllActions()
			   StartCutSceneMode()
			   StartCutScene("WWgovt")~ EXIT
END

IF ~G("WWSmethyChastens",1)~ ShameOnYou
SAY @70
++ @71 DO ~SetGlobal("WWSwooChastens","GLOBAL",2)~ + TrueEnough
++ @72 DO ~SetGlobal("WWSwooChastens","GLOBAL",2)~  + Hellpp
END

IF ~Global("WWPrettyPenny","LOCALS",0)
    Global("WWSwooTalk2","GLOBAL",3)~ PrettyPenny
SAY @73
++ @74 DO ~SetGlobal("WWPrettyPenny","LOCALS",1)~ + TakeIt
++ @75 DO ~SetGlobal("WWPrettyPenny","LOCALS",1)~ EXTERN MINSCJ YouSoldBoo
END

IF ~Global("WWSwooTakes","LOCALS",0)
    Global("WWSwooTalk2","GLOBAL",3)~ TakeIt
SAY @76
= @77
IF ~~ THEN DO ~SetGlobal("WWSwooTakes","LOCALS",1)
			TakePartyGold(200)
			MoveToPoint([216.149])
			MoveToObject("Minsc")
	//		GiveItemCreate("wwnboo","Minsc",0,0,0)
			ActionOverride("Minsc",ReallyForceSpellRES("wwfboo",Myself))
			SetGlobal("WWBooGone","GLOBAL",3)
			ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
			SetGlobalTimer("WWFakeBooTimer","GLOBAL",ONE_DAY)
			SG("WWWaitForComment",4)~ EXIT
END

IF ~Global("WWSwooTalk2","GLOBAL",3)~ EllyLivesWhereNasty
SAY @78
IF ~~ GOTO EllyLivesWhere
END

IF ~Global("WWSwooTalk2","GLOBAL",3)~ EllyLivesWhere
SAY @79
++ @80 + NoProbs
++ @81 + NoProbs
++ @82 + Hellpp
END

IF ~Global("WWSwooTalk2","GLOBAL",3)~ NoProbs
SAY @83
IF ~~ THEN 	UNSOLVED_JOURNAL @84
			DO ~SetGlobal("WWHelpFindBoo","GLOBAL",6)
			SetGlobalTimer("WWFindBooTimer","GLOBAL",TEN_DAYS)  		// ie Minsc's last complaint will run after 10 days to allow for Perth
			SetGlobal("WWInspectFountain","GLOBAL",1)
			ClearAllActions()
			Wait(1)
			StartCutSceneMode()
		    StartCutScene("WWgovt")~ EXIT
END

IF ~Global("WWSwooTalk2","GLOBAL",3)~ Hellpp
SAY @85
= @86
IF ~~ THEN GOTO niceMan
IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN EXTERN JAHEIRAJ IdiotCharname /* Kulyok */
END

IF ~Global("WWSwooTalk2","GLOBAL",3)~ niceMan
SAY @87
= @88
= @89
= @90
IF ~~ THEN  UNSOLVED_JOURNAL @69
			DO ~SetGlobal("WWHelpFindBoo","GLOBAL",6)
			   SetGlobalTimer("WWFindBooTimer","GLOBAL",THREE_DAYS)  		// ie Minsc's last complaint will run after 3 days... allows time for Perth
			   SetGlobal("WWInspectFountain","GLOBAL",1)
			   ClearAllActions()
			   StartCutSceneMode()
			   StartCutScene("WWgovt") ~ EXIT
END

IF ~~ TrueEnough
SAY @91
++ @92 + BuyStock
++ @93 + Exit
END

IF ~~ BuyStock
SAY @94
++ @95 + PayPlenty
++ @96 + Hellpp
++ @97 + Exit
END

IF ~~ PayPlenty
SAY @98
++ @96 + Hellpp
++ @99 + Exit
END

IF ~~ Exit
SAY @100
= @101
IF ~~ THEN  SOLVED_JOURNAL @102
				DO ~SetGlobal("WWHelpFindBoo","GLOBAL",6)
			   SetGlobal("WWInspectFountain","GLOBAL",1)
			   EraseJournalEntry(@729)
			   EraseJournalEntry(@754)
			   ClearAllActions()
			   StartCutSceneMode()
			   StartCutScene("WWgovt")~ EXIT
END

//////////////////////////
//* Eleanya's Dialogue *//
//////////////////////////


BEGIN ~WWELLE~

// fluff dialogue when Minsc isn't in the party
IF ~!InParty("Minsc")
	Global("WWFluff","LOCALS",0)~ THEN BEGIN EllyLooksDown
SAY @104
IF ~~ THEN DO ~SetGlobal("WWFluff","LOCALS",1)~ EXIT
END

IF ~!InParty("Minsc")
	Global("WWFluff","LOCALS",1)~ THEN BEGIN EllyLooksDown2
SAY @103
IF ~~ THEN DO ~SetGlobal("WWFluff","LOCALS",2)~ EXIT
END

IF ~!InParty("Minsc")
	Global("WWFluff","LOCALS",2)~ THEN BEGIN EllyLooksDown3
SAY @105
IF ~~ THEN DO ~SetGlobal("WWFluff","LOCALS",0)~ EXIT
END


// That 'As For You...' dialog

IF ~Global("WWFightElle","GLOBAL",3)~ THEN BEGIN EllySnorts
SAY @106
IF ~~ THEN DO ~SetGlobal("WWFightElle","GLOBAL",1)
				Enemy()~ EXIT
END


IF ~Global("WWAfterSpell","LOCALS",2)~ AfterSpell
SAY @107
++ @108 + hitMinsc
++ @109 + not
+ ~Gender(Player1,MALE) CheckStatGT(Player1,14,CHR)~ + @110 + yuck
+ ~Gender(Player1,FEMALE)~ + @111 + nothanksdude
END


// In case the Minsc seeing Eleanya talk doesn't work, you can talk to her
IF ~InParty("Minsc")
	Global("WWEleanyaBackupChk","LOCALS",0)
	~ EllyBackupDialog
SAY @129
= @130
+ ~CheckStatGT(Player1,13,CHR)~ + @131 DO ~SG("WWEleanyaTalk",1)
											SG("WWTalkedEleanyaAlready",1)
											SetGlobal("WWEleanyaBackupChk","LOCALS",1)~ + HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)~ + @132 DO ~SG("WWEleanyaTalk",1)
											SetGlobal("WWEleanyaBackupChk","LOCALS",1)
											SG("WWTalkedEleanyaAlready",1)~ + HamsterSwimLow
++ @133 DO ~SetGlobal("WWEleanyaBackupChk","LOCALS",1)
			SG("WWTalkedEleanyaAlready",1)~ + UnhandHamster
++ @134 DO ~SetGlobal("WWEleanyaBackupChk","LOCALS",1)
			SG("WWTalkedEleanyaAlready",1)~ + ChangeTone
END

IF ~~ not
SAY @112
++ @113 + hitMinsc
+ ~Gender(Player1,MALE) CheckStatGT(Player1,14,CHR)~ + @114 + yuck
+ ~Gender(Player1,FEMALE)~ + @115 + nothanksdude
END

IF ~~ yuck
SAY @116
IF ~~ THEN GOTO ConsiderThis
END

IF ~~ nothanksdude
SAY @117
++ @118 + hitMinsc
++ @119 + hitMinsc
END

IF ~~ ConsiderThis
SAY @120
++ @121 + hitMinsc
++ @122 + hitMinsc
END

IF ~~ Inbred
SAY @123
++ @124 + FieOnYou
+ ~CheckStatGT(Player1,13,CHR)~ + @125 DO ~SetGlobal("WWEleanyaTalk","GLOBAL",1)~ + HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)~ + @126  DO ~SetGlobal("WWEleanyaTalk","GLOBAL",1)~ + HamsterSwimLow
++ @127 DO ~SetGlobal("WWEleanyaProperty","GLOBAL",1)~ + Yours
++ @128 + NoWay
END

IF ~~ WhatIsThis
SAY @129
= @130
+ ~CheckStatGT(Player1,13,CHR)~ + @131 DO ~SG("WWEleanyaTalk",1)~ + HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)~ + @132 DO ~SG("WWEleanyaTalk",1)~ + HamsterSwimLow
++ @133 + UnhandHamster
++ @134 + ChangeTone
END

IF ~~ ChangeTone
SAY @135
++ @136 + Inbred
++ @137 + UnhandHamster
++ @138 DO ~SetGlobal("WWEleanyaProperty","GLOBAL",1)~ + Yours
+ ~CheckStatGT(Player1,13,CHR)~ + @139 DO ~SetGlobal("WWEleanyaTalk","GLOBAL",1)~ + HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)~ + @140 DO ~SetGlobal("WWEleanyaTalk","GLOBAL",1)~ +  HamsterSwimLow
END

IF ~~ Yours
SAY @141
+ ~CheckStatGT(Player1,13,CHR)
   !G("WWEleanyaTalk",1)~ + @142 DO ~SG("WWEleanyaTalk",1)~ +  HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)
   !G("WWEleanyaTalk",1)~ + @142 DO ~SG("WWEleanyaTalk",1)~ +  HamsterSwimLow
+ ~G("WWEleanyaTalk",1)~ + @143 + NoWay
++ @144 + LifeFor
++ @145 + LifeFor
END

IF ~~ LifeFor
SAY @146
++ @128 + NoWay
++ @147 + FieOnYou
+ ~CheckStatGT(Player1,13,CHR)
   !G("WWEleanyaTalk",1)~ + @125 + HamsterSwimHigh
+ ~!CheckStatGT(Player1,13,CHR)
   !G("WWEleanyaTalk",1)~ + @126 + HamsterSwimLow
+ ~!G("WWEleanyaProperty",1)~ + @127 + Yours
END

IF ~~ LifeFor2
SAY @148
++ @149 + FieOnYou
++ @150 + NoWay
END

IF ~~ FieOnYou
SAY @151
IF ~~ THEN DO ~ClearAllActions()
			   StartCutSceneMode()
			   StartCutScene("wwctel")~ EXIT
END

// NoWay 1000Gold GreaterThings
IF ~~ 1000Gold
SAY @152
++ @153 + NoWay
++ @154 + LifeFor2
++ @155 + LifeFor2
END


IF ~~ LoseWhat
SAY @156
= @157
++ @158 + InsultDelyl
++ @159 + ToQuestions
++ @160 + FieOnYou
END

IF ~~ NoWay
SAY @161
= @162
= @163
++ @164 + ToQuestions
++ @165 + LoseWhat
++ @160 + FieOnYou
END

IF ~~ garnet
SAY @166
IF ~~ THEN GOTO Rewards
END

IF ~~ diamond
SAY @169
IF ~~ THEN GOTO Rewards
END

IF ~~ pearl
SAY @171
= @172
IF ~~ THEN GOTO Rewards
END

IF ~~ ioun
SAY @173
IF ~~ THEN GOTO Rewards
END

IF ~~ emerald
SAY @174
IF ~~ THEN GOTO Rewards
END

IF ~~ sapphire
SAY @175
IF ~~ THEN GOTO Rewards
END

IF ~~ laeral
SAY @176
IF ~~ THEN GOTO Rewards
END

IF ~~ THEN Wrong2
SAY @178
= @179
// IF ~~ THEN EXTERN WWELLE Question3
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ3","LOCALS",1))
~ EXIT
END

IF ~~ Rewards
SAY @180
IF ~!G("WWEllyQuestions",0)~ THEN DO ~ActionOverride("Minsc",ReallyForceSpellRES("wwboo",Myself))
ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))   /* Kulyok v25 */
DestroyItem("wweboo")
SetGlobal("WWBooGone","GLOBAL",2)~ EXTERN WWELLE NotAFool
IF ~G("WWEllyQuestions",0)~ THEN EXTERN WWELLE CompleteFool
END


IF ~~ NotAFool
SAY @181
IF ~GGT("WWEllyQuestions",3)~ THEN EXTERN WWELLE UltimateReward // Boolet, 20,000 xp
IF ~OR(2)
	G("WWEllyQuestions",3)
	G("WWEllyQuestions",2)~ THEN EXTERN WWELLE Niceish  	// Jade Hound, 15,000 xp - Kulyok - edited the reward from 20000xp to 15000xp, as it was mentioned 15000xp in comments.
IF ~G("WWEllyQuestions",1)~ THEN EXTERN WWELLE Minor		// 10,000 xp
END

IF ~~ Niceish
SAY @182
= @183
= @184
IF ~~ THEN DO ~GiveItemCreate("MISC3F","Minsc",1,0,0)~ EXTERN WWELLE Compliment
END

IF ~~ Minor
SAY @185
= @186
= @187
IF ~~ THEN DO ~ActionOverride("Minsc",ReallyForceSpellRES("wwboo",Myself))
				AddexperienceParty(10000)
				SetGlobal("WWBooGone","GLOBAL",2) DestroyItem("wweboo")
				ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
				EscapeArea()~ EXIT
END


IF ~~ CompleteFool
SAY @188
= @189
IF ~~ THEN EXTERN MINSCJ ThreatenElly
END

IF ~~ UltimateReward
SAY @190
= @191
IF ~~ THEN DO ~ClearAllActions()
				StartCutSceneMode()
				StartCutScene("wwelspl")~ EXIT
END



// Start the wizards too
BEGIN ~WWCOWL1~
BEGIN ~WWCOWL2~

///////////////////////
/* CHAINs begin here */
///////////////////////

CHAIN
IF ~~ THEN MINSCJ AccuseStealBoo
@192
DO ~SetGlobal("WWMinscAccusePC","LOCALS",3)~
== MINSCJ IF ~IsValidForPartyDialog("Jan")~ THEN @193
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @194
== MINSCJ IF ~IsValidForPartyDialog("Jan")~ THEN @195
== JANJ IF ~IsValidForPartyDialog("Jan")~ THEN @196
== MINSCJ IF ~IsValidForPartyDialog("Korgan")~ THEN @197
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @198
== MINSCJ IF ~IsValidForPartyDialog("Korgan")~ THEN @199
== MINSCJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @200
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @201
== MINSCJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @202
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis")~ THEN @203
== MINSCJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE)~ THEN @204
== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE)~ THEN @205
== MINSCJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE)~ THEN @206
== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",MALE)~ THEN @207
== MINSCJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN @208
== BEDWIN IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN @209
== MINSCJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN @210
== EDWINJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN @211
== MINSCJ IF ~IsValidForPartyDialog("Edwin") Gender("Edwin",FEMALE)~ THEN @212
== MINSCJ @213
END
++ @214 GOTO BooKidding
++ @215 GOTO BooLaughter

CHAIN
IF ~Global("MinscDies","GLOBAL",91)~ THEN BMINSC miracle
@216
DO ~SetGlobal("MinscDies","GLOBAL",2)~
== BKELDOR @217
== BMINSC @218
EXIT

CHAIN
IF ~InParty("Edwin")
	See("Edwin")
	Gender("Edwin",FEMALE)
	!StateCheck("Edwin",STATE_SLEEPING)
	Global("BMinsc10","LOCALS",90)~ THEN BMINSC scoundrel
@219
DO ~SetGlobal("BMinsc10","LOCALS",1)~
== EDWINJ @220
== BMINSC @221
== EDWINJ @222
EXIT

CHAIN
IF ~InParty("Minsc")
	See("Minsc")
	!StateCheck("Minsc",STATE_SLEEPING)
	Gender("Edwin",FEMALE)
	Global("EdwinW2","LOCALS",90)~ THEN EDWINJ scoundrel2
@223
DO ~SetGlobal("EdwinW2","LOCALS",2)~
== BMINSC @224
== EDWINJ @225
== BMINSC @226
= @227
== EDWINJ @228
== BMINSC @229
= @230
= @231
= @232
= @233
= @234
== EDWINJ @235
EXIT

CHAIN
IF WEIGHT #-46 ~Global("WWBooGone","GLOBAL",1)
	AreaCheck("AR0300")
	Global("WWDocksComment","LOCALS",0)~ THEN MINSCJ SomeoneSeenBoo
@236
DO ~SetGlobal("WWDocksComment","LOCALS",1)
	SetGlobalTimer("WWFindBooTimer","GLOBAL",THREE_DAYS)~
== NALIAJ IF ~!IsValidForPartyDialog("Aerie")
			  IsValidForPartyDialog("Nalia")~ THEN @237
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @238
== MINSCJ IF ~IsValidForPartyDialog("Aerie")~ THEN @239
== JANJ IF ~IsValidForPartyDialog("Jan")
			  IsValidForPartyDialog("Aerie")
			  TimeOfDay(DAY)~ THEN @240
== AERIEJ IF ~IsValidForPartyDialog("Jan")
			  IsValidForPartyDialog("Aerie")
			  TimeOfDay(DAY)~ THEN @241
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @242
== MINSCJ IF ~IsValidForPartyDialog("Aerie")~ THEN @243
== JANJ IF ~IsValidForPartyDialog("Aerie")
            IsValidForPartyDialog("Jan")~ THEN @244
== MINSCJ IF ~IsValidForPartyDialog("Aerie")
            IsValidForPartyDialog("Jan")~ THEN @245
== JANJ IF ~IsValidForPartyDialog("Aerie")
            IsValidForPartyDialog("Jan")~ THEN @246
== AERIEJ IF ~IsValidForPartyDialog("Jan")
			  IsValidForPartyDialog("Aerie")~ THEN @247
== JANJ IF ~IsValidForPartyDialog("Jan")
			  IsValidForPartyDialog("Aerie")~ THEN @248
EXIT

CHAIN
IF ~!G("WWBillyHelp",1)~ THEN WWDEL Rudeness
@249
== WWEFF @250
== WWDEL IF ~!Dead("WWEff")~ THEN @251
== WWVIVI IF ~!Dead("WWEff")
			  !Dead("WWDel")~ THEN @252
EXIT

// wweff is DV  wwthug is Override

CHAIN
IF ~!G("WWBillyHelp",1)~ THEN WWEFF Rudeness2
@253
== WWSTEN @254
== WWEFF IF ~!Dead("WWSten")~ THEN @255
EXIT

// wwsten is DV wwthug is Override

CHAIN
IF ~!G("WWBillyHelp",1)~ THEN WWSTEN Rudeness3
@256
DO ~SetGlobal("WWKnockers","LOCALS",1)~
== WWVIVI @257
== WWDEL IF ~!Dead("WWVivi")~ THEN @258
== WWEFF IF ~!Dead("WWDel")~ THEN @259
== WWSTEN IF ~!Dead("WWSten")
			  !Dead("WWEff")~ THEN @260
EXIT

CHAIN
IF ~!G("WWBillyHelp",1)~ THEN WWVIVI Rudeness4
@261
== WWDEL @262
== WWSTEN IF ~!Dead("WWDel")~ THEN @263
== WWDEL IF ~!Dead("WWSten")~ THEN @264
== WWVIVI IF ~!Dead("WWSten")~ THEN @265
EXIT

CHAIN
IF WEIGHT #-3 ~Global("WWFightVivickNow","GLOBAL",2)~ THEN WWVIVI VivickLoses
@266
= @267
== BMINSC @268
== WWVIVI @269
END
IF ~~ THEN EXTERN WWBILL Yapper

CHAIN
IF ~Global("WWCowlInterrupt","GLOBAL",1)~ THEN WWCOWL1 Unsanctioned
@270
DO ~SetGlobal("WWCowlInterrupt","GLOBAL",2)~
= @271
== WWCOWL2 @272
== WWELLE @273
== WWCOWL1 @274
== WWCOWL2 @275
== WWELLE @276
= @277
== WWCOWL2 @278
== WWCOWL1 @279
== WWCOWL2 @280
END
IF ~~ THEN DO ~ClearAllActions()
				StartCutSceneMode()
				StartCutScene("WWcowl")~ EXIT

CHAIN
IF ~G("WWCowledAppearance",2)~ THEN WWCOWL1 EllyTakeDown
@281
DO ~SG("WWCowledAppearance",5)~
== WWCOWL2 @282
== WWCOWL1 @283
== WWCOWL2 @284
== WWCOWL1 @285
== WWCOWL2 @286
== VALYGARJ IF ~IsValidForPartyDialog("Valygar")~ THEN @287
== WWCOWL1 IF ~IsValidForPartyDialog("Valygar")~ THEN @288
== WWCOWL1 IF ~IsValidForPartyDialog("Valygar")~ THEN @289
END
IF ~!G("BribedCowled",1)~ THEN EXTERN WWCOWL2 license
IF ~G("BribedCowled",1)~ THEN EXTERN WWCOWL2 gotlicense

CHAIN
IF ~~ THEN WWCOWL2 gotlicense
@290
END
++ @291 EXTERN WWCOWL1 givemoney
++ @292 EXTERN WWCOWL1 asyouwish2
++ @293 EXTERN WWCOWL1 irenicus2
+ ~!Global("C#IM_ImoenStays","GLOBAL",1)~ + @294  EXTERN WWCOWL1 irenicus2
++ @295 EXTERN WWCOWL1 asyouwish

CHAIN
IF ~~ THEN WWCOWL2 license
@296
END
++ @291 EXTERN WWCOWL1 givelicense
++ @292 EXTERN WWCOWL1 asyouwish2
++ @293 EXTERN WWCOWL1 irenicus
+ ~!Global("C#IM_ImoenStays","GLOBAL",1)~ + @294  EXTERN WWCOWL1 irenicus
++ @295 EXTERN WWCOWL1 asyouwish

CHAIN
IF ~~ THEN WWCOWL1 givemoney
@297
END
++ @298 EXTERN WWCOWL2 10000
++ @299 EXTERN WWCOWL2 5000


CHAIN
IF ~~ THEN WWCOWL2 10000
@300
== WWCOWL1 @301
== WWCOWL2 @302
== WWCOWL1 @303
END
++ @808 EXTERN WWCOWL1 asyouwish2
++ @809 EXTERN WWCOWL2 byeNow

CHAIN
IF ~~ THEN WWCOWL2 5000
@305
== WWCOWL1 @306
== WWCOWL2 @303
END
++ @808 EXTERN WWCOWL1 asyouwish2
++ @809 EXTERN WWCOWL2 byeNow

CHAIN
IF ~~ THEN WWCOWL2 byeNow
@304
END
IF ~~ THEN DO ~GiveGoldForce(1000)
				ClearAllActions()
				CreateVisualEffectObject("SPDIMNDR","WWCowl2")
				Wait(1)
				ActionOverride("WWCowl1",DestroySelf())
				CreateVisualEffectObject("SPDIMNDR",Myself)
				Wait(1)
				DestroySelf()~ EXIT


CHAIN
IF ~~ THEN WWCOWL1 givelicense
@307
== WWCOWL2 @308
== WWCOWL1 @282
END
++ @810 EXTERN WWCOWL1 asyouwish2
++ @809 EXTERN WWCOWL1 warning

CHAIN
IF ~~ THEN WWCOWL1 warning
@309
END
IF ~~ THEN DO ~SG("BribedCowled",1)
				SG("WWBribeToCorneil",1)
				ClearAllActions()
				CreateVisualEffectObject("SPDIMNDR","WWCowl2")
				Wait(1)
				ActionOverride("WWCowl2",DestroySelf())
				CreateVisualEffectObject("SPDIMNDR",Myself)
				Wait(1)
				DestroySelf()~ EXIT

CHAIN
IF ~~ THEN WWCOWL1 irenicus
@310
= @311
END
++ @312 EXTERN WWCOWL1 givelicense
++ @292 EXTERN WWCOWL1 asyouwish2
++ @295 EXTERN WWCOWL1 asyouwish

CHAIN
IF ~~ THEN WWCOWL1 irenicus2
@310
= @313
END
++ @314 EXTERN WWCOWL1 givemoney
++ @292 EXTERN WWCOWL1 asyouwish2
++ @295 EXTERN WWCOWL1 asyouwish

CHAIN
IF ~~ THEN WWCOWL1 asyouwish
@315
END
IF ~~ THEN DO ~ClearAllActions()
				CreateVisualEffectObject("SPDIMNDR","WWCowl2")
				Wait(1)
				ActionOverride("WWCowl2",DestroySelf())
				CreateVisualEffectObject("SPDIMNDR",Myself)
				Wait(1)
				DestroySelf()~ EXIT

CHAIN
IF ~~ THEN WWCOWL1 asyouwish2
@316
END
IF ~~ THEN DO ~ClearAllActions()
				CreateVisualEffectObject("SPDIMNDR","WWCowl2")
				Wait(1)
				ActionOverride("WWCowl2",DestroySelf())
				CreateVisualEffectObject("SPDIMNDR",Myself)
				Wait(1)
				DestroySelf()~ EXIT


CHAIN
IF ~~ THEN WWVIVI OuttaTheWay
@317
== WWEFF IF ~!Dead("WWEff")~ THEN @318
== WWSTEN IF ~!Dead("WWSten")~ THEN @319
== WWDEL IF ~!Dead("WWDel")~ THEN @320
END
++ @321 + ThiefBilly
++ @322 + FightVivic

CHAIN
IF ~~ THEN WWVIVI FightVivic
@323
== WWEFF IF ~!Dead("WWEff")~ THEN @324
== WWSTEN IF ~!Dead("WWSten") Global("WWKnockers","LOCALS",0)~ THEN @325
== WWSTEN IF ~!Dead("WWSten") Global("WWKnockers","LOCALS",1)~ THEN @326
== WWDEL IF ~!Dead("WWDel")~ THEN @327
== WWVIVI IF ~!Dead("WWVivi")~ THEN @328
END
IF ~~ THEN DO ~
		SetGlobal("WWThugFight","GLOBAL",1)
		ActionOverride("WWBill",MoveToPoint([818.360]))
		ActionOverride("WWEff",Enemy())
		ActionOverride("WWSten",Enemy())
		ActionOverride("WWDel",Enemy())
		ActionOverride("WWVivi",Enemy())~ EXIT

CHAIN
IF ~~ THEN WWVIVI ThiefBilly
@329
== WWBILL @330
== WWVIVI @331
END
++ @332 EXTERN WWBILL BillyExplain
++ @333 EXTERN MINSCJ MinscExplain
++ @334 + Laughs

CHAIN
IF ~~ THEN WWBill BillyExplain
@335
== MINSCJ @336
END
IF ~~ THEN EXTERN WWVivi Laughs


CHAIN
IF ~~ THEN WWVIVI Laughs
@337
== WWEFF IF ~!Dead("WWEff")~ THEN @338
== WWVIVI @339
== WWSTEN IF ~!Dead("WWSten") !Dead("WWEff")~ THEN @340
== WWEFF IF ~!Dead("WWEff") !Dead("WWSten")~ THEN @341
== WWDEL IF ~!Dead("WWDel")~ THEN @342
== WWVIVI IF ~!Dead("WWEff")~ THEN @343
== WWEFF IF ~!Dead("WWEff")~ THEN @344
== WWSTEN IF ~!Dead("WWSten")~ THEN @345
== WWDEL IF ~!Dead("WWDel")~ THEN @346
== MINSCJ @347
= @348
= @349
= @350
= @351
= @352
END
++ @353 EXTERN MINSCJ MinscReconsiders
++ @354 EXTERN MINSCJ MinscReconsiders
++ @355 EXTERN MINSCJ MinscReconsiders


CHAIN
IF ~~ THEN WWVIVI NoReason
@356
== MINSCJ @357
END
++ @358 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN MINSCJ DoThis
++ @359 DO ~SetGlobal("WWFightVivick","GLOBAL",1)~ EXTERN MINSCJ PreFight
++ @360 EXTERN WWVIVI FightVivic

CHAIN
IF ~~ THEN WWVIVI 50Gold
@361
== WWEFF IF ~!Dead("WWEff")~ THEN @362
== WWVIVI IF ~!Dead("WWEff")~ THEN @363
== WWSTEN IF ~!Dead("WWSten")~ THEN @364
== WWVIVI IF ~!Dead("WWSten")~ THEN @365
== WWVIVI @366
== MINSCJ @357
END
++ @358 DO ~SetGlobal("WWFightVivick","GLOBAL",2)~ EXTERN MINSCJ DoThis
++ @359 DO ~SetGlobal("WWFightVivick","GLOBAL",1)~ EXTERN MINSCJ PreFight
++ @360 EXTERN WWVIVI FightVivic

CHAIN
IF ~~ THEN MINSCJ DoThis
@367
= @368
== WWVIVI @369
END
+ ~Global("WWFightVivick","GLOBAL",1)
   !HPPercent("Minsc",100)~ + @370 EXTERN WWVIVI Warning2Heal
+ ~Global("WWFightVivick","GLOBAL",2)
   !HPPercent(Player1,100)~ + @371 EXTERN WWVIVI  Warning2Heal
+ ~Global("WWFightVivick","GLOBAL",1)
   HPPercent("Minsc",100)~ + @372 EXTERN WWVIVI  QuickFight
+ ~Global("WWFightVivick","GLOBAL",2)
   HPPercent(Player1,100)~ + @373 EXTERN WWVIVI  QuickFight
+ ~Global("WWFightVivick","GLOBAL",1)~ + @374 EXTERN WWVIVI ComeLater
+ ~Global("WWFightVivick","GLOBAL",2)~ + @375 EXTERN WWVIVI ComeLater
++ @376 EXTERN WWVIVI FightVivic

CHAIN
IF ~~ THEN WWVIVI ComeLater
@377
DO ~SetGlobal("WWFightVivickNow","GLOBAL",0)~
EXIT

CHAIN
IF ~~ THEN MINSCJ PreFight
@378
== WWVIVI @379
END
+ ~Global("WWFightVivick","GLOBAL",1)
   !HPPercent("Minsc",100)~ + @370 EXTERN WWVIVI Warning2Heal
+ ~Global("WWFightVivick","GLOBAL",2)
   !HPPercent(Player1,100)~ + @371 EXTERN WWVIVI  Warning2Heal
+ ~Global("WWFightVivick","GLOBAL",1)
   HPPercent("Minsc",100)~ + @372 EXTERN WWVIVI  QuickFight
+ ~Global("WWFightVivick","GLOBAL",2)
   HPPercent(Player1,100)~ + @373 EXTERN WWVIVI  QuickFight
++ @380 EXTERN WWVIVI ComeLater
++ @376 EXTERN WWVIVI FightVivic

CHAIN
IF ~~ THEN WWBILL Yapper
@381
== WWVIVI @382
== MINSCJ @383
== WWVIVI @384
== MINSCJ @385
== WWVIVI @386
== MINSCJ @387
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @388
== WWVIVI @389
== WWBILL @390
END
IF ~~ THEN EXTERN MINSCJ SoldBooToHalfling

CHAIN
IF ~~ THEN MINSCJ SoldBooToHalfling
@391
= @392
= @393
== WWBILL @394
== MINSCJ @395
== WWBILL @396
END
IF ~~ THEN DO ~SG("WWBillyHelp",10)
			ClearAllActions()
  			StartCutSceneMode()
			StartCutScene("wwsmet")~
EXIT

CHAIN
IF WEIGHT #-50 ~Global("WWSwooTalk","GLOBAL",1)~ THEN WWSWOO MorePetsBilly
@397
DO ~SetGlobal("WWSwooTalk","GLOBAL",2)~
== WWBILL IF ~NumInPartyAlive(2)~ THEN @398
== WWBILL IF ~NumInPartyAlive(3)~ THEN @399
== WWBILL IF ~NumInPartyAlive(4)~ THEN @400
== WWBILL IF ~NumInPartyAlive(5)~ THEN @401
== WWBILL IF ~NumInPartyAlive(6)~ THEN @402
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @403
== WWBILL @404
== EDWINJ IF ~IsValidForPartyDialog("Edwin")~ THEN @405
END
IF ~~ THEN DO ~ClearAllActions()
  			StartCutSceneMode()
			StartCutScene("wwblve")~ EXIT

CHAIN
IF WEIGHT #-49 ~Global("WWSwooTalk","GLOBAL",2)
				Global("WWBillyGone","LOCALS",1)
				G("WWChatty",2)~ THEN WWSWOO SorryGuys
@406
DO ~SetGlobal("WWSwooTalk","GLOBAL",3)~
= @407
== MINSCJ @408
= @409
== CERNDJ IF ~IsValidForPartyDialogue("Cernd")~ THEN @410
== KORGANJ IF ~IsValidForPartyDialogue("Korgan")~ THEN @411
== WWSWOO @412
== MINSCJ @413
== WWSWOO @414
END
++ @415 EXTERN WWSWOO SwooPets
++ @416 EXTERN WWSWOO SwoosPetsExit

CHAIN
IF ~Global("WWFakeBoo","GLOBAL",1)~ THEN WWSWOO BooIsBackFake
@417
== MINSCJ @418
DO ~SetGlobal("WWFakeBoo","GLOBAL",2)~
= @419
END
+ ~CheckStatGT(Player1,14,CHR)~ + @420 EXTERN MINSCJ RunSo
+ ~CheckStatGT(Player1,14,INT)~ + @421 EXTERN MINSCJ RunSo
++ @422 EXTERN MINSCJ BetrayalBoo

CHAIN
IF ~~ THEN WWSWOO SwoosPetsExit
@423
= @424
END
IF ~~ THEN EXTERN WWSWOO SwooPets

CHAIN
IF ~~ THEN WWSWOO SwooPets
@425
= @426
== MINSCJ @427
== WWSWOO @428
== MINSCJ @429
== WWSWOO @430
== MINSCJ @431
== WWSWOO @432
== MINSCJ @433
== WWSWOO @434
END
+ ~OR(6)
	Alignment(Player1,NEUTRAL_EVIL)
	Alignment(Player1,LAWFUL_EVIL)
	Alignment(Player1,CHAOTIC_EVIL)
	Alignment(Player1,NEUTRAL)
	Alignment(Player1,CHAOTIC_NEUTRAL)
	Alignment(Player1,LAWFUL_NEUTRAL)
	PartyGoldGT(199)~ + @435 EXTERN WWSWOO PrettyPenny
+ ~OR(6)
	Alignment(Player1,NEUTRAL_EVIL)
	Alignment(Player1,LAWFUL_EVIL)
	Alignment(Player1,CHAOTIC_EVIL)
	Alignment(Player1,NEUTRAL)
	Alignment(Player1,CHAOTIC_NEUTRAL)
	Alignment(Player1,LAWFUL_NEUTRAL)
	PartyGoldGT(199)~ + @436 EXTERN WWSWOO TakeIt
++ @437 EXTERN MINSCJ YesItsBoo
++ @438 EXTERN MINSCJ YesItsBoo

CHAIN
IF ~Global("WWFakeBoo","GLOBAL",2)~ THEN MINSCJ RunSo
@439
DO ~SetGlobal("WWFakeBoo","GLOBAL",3)~
== AERIEJ IF ~IsValidForPartyDialog("Aerie")~ THEN @440
== NALIAJ IF ~IsValidForPartyDialog("Nalia")
			  !IsValidForPartyDialog("Aerie")~ THEN @441
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Nalia")~ THEN @442
== MINSCJ IF ~OR(3) IsValidForPartyDialog("Aerie")
                    IsValidForPartyDialog("Nalia")
					IsValidForPartyDialog("Mazzy")~ THEN @443
END
+ ~OR(2) CheckStatGT(Player1,14,CHR)
		    CheckStatGT(Player1,13,INT)~ + @444 EXTERN MINSCJ SoBig
+ ~OR(2) CheckStatGT(Player1,14,CHR)
		    CheckStatGT(Player1,13,INT)~ + @445 EXTERN MINSCJ SoBig
++ @446 EXTERN MINSCJ TravelRoad


CHAIN
IF ~~ THEN MINSCJ YesItsBoo
@447
== KORGANJ IF ~IsValidForPartyDialogue("Korgan")~ THEN @448
== WWSWOO @449
== MINSCJ @450
== WWSWOO @451
END
IF ~~ THEN EXTERN MINSCJ YouSoldBoo

CHAIN
IF ~~ THEN MINSCJ YouSoldBoo
@452
= @453
== WWSWOO @454
= @455
== MINSCJ @456
END
++ @457 EXTERN WWSWOO EllyLivesWhere
++ @458 EXTERN WWSWOO EllyLivesWhereNasty


CHAIN
IF ~~ THEN MINSCJ NoCombat
@459
== AERIEJ IF ~IsValidForPartyDialogue("Aerie")~ THEN @460
== NALIAJ IF ~IsValidForPartyDialog("Nalia")
			  !IsValidForPartyDialog("Aerie")~ THEN @461
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy")
			!IsValidForPartyDialog("Aerie")
			!IsValidForPartyDialog("Nalia")~ THEN @462
== WWSWOO @463
= @464
END
IF ~~ THEN      SOLVED_JOURNAL 	@465
				DO ~SetGlobal("WWBooGone","GLOBAL",3)
			   SetGlobalTimer("WWFakeBooTimer","GLOBAL",ONE_DAY)
				ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
			   	Wait(2)
				EraseJournalEntry(@729)
				EraseJournalEntry(@754)
				ClearAllActions()
				StartCutSceneMode()
				StartCutScene("WWGovt")~ EXIT


CHAIN
IF ~~ THEN MINSCJ NoRemorse
@466
= @467
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @468
END
IF ~IsValidForPartyDialogue("Aerie")~ THEN EXTERN AERIEJ AerieJoins
IF ~!IsValidForPartyDialogue("Aerie")~ THEN
	SOLVED_JOURNAL @469
	DO ~SG("WWBooGone",5)
	ActionOverride("Minsc",LeaveParty())
      ActionOverride("Minsc",EquipMostDamagingMelee())
	ActionOverride("Minsc",Enemy())
	ActionOverride("Minsc",Attack(Player1))~ EXIT


CHAIN
IF ~~ THEN MINSCJ BetrayedMinsc
@470
== KORGANJ IF ~IsValidForPartyDialogue("Korgan")~ THEN @471
== NALIAJ IF ~!IsValidForPartyDialogue("Aerie")
			   IsValidForPartyDialogue("Nalia")~ THEN @472
== MINSCJ @473
END
IF ~IsValidForPartyDialogue("Aerie")
Global("MinscWitch","GLOBAL",1)
	!Global("AerieRomanceActive","GLOBAL",1)
	!Global("AerieRomanceActive","GLOBAL",2)~ EXTERN AERIEJ MinscNoRomance
IF ~IsValidForPartyDialogue("Aerie")
	OR(2)
		Global("AerieRomanceActive","GLOBAL",1)
        Global("AerieRomanceActive","GLOBAL",2)~ EXTERN AERIEJ MinscRomance
IF ~!IsValidForPartyDialogue("Aerie")~ EXTERN MINSCJ Leaving

CHAIN
IF ~~ THEN AERIEJ MinscNoRomance
@474
== MINSCJ @475
== MAZZYJ IF ~!IsValidForPartyDialogue("Aerie")
			  !IsValidForPartyDialogue("Nalia")
			   IsValidForPartyDialogue("Mazzy")~ THEN @476
END
IF ~IsValidForPartyDialogue("Edwin")~ THEN 
				SOLVED_JOURNAL @477 /* Kulyok */
				DO ~SG("WWBooGone",5)
				ActionOverride("Minsc",LeaveParty())
				ActionOverride("Aerie",LeaveParty())
				ActionOverride("Minsc",GivePartyAllEquipment())
				ActionOverride("Aerie",GivePartyAllEquipment())
				ActionOverride("Minsc",EscapeArea())
				ActionOverride("Aerie",EscapeArea())~ EXTERN EDWINJ EdwinCommentAerie
IF ~!IsValidForPartyDialogue("Edwin")~ THEN
				SOLVED_JOURNAL @477
				DO ~SG("WWBooGone",5)
				ActionOverride("Minsc",LeaveParty())
				ActionOverride("Aerie",LeaveParty())
				ActionOverride("Minsc",GivePartyAllEquipment())
				ActionOverride("Aerie",GivePartyAllEquipment())
				ActionOverride("Minsc",EscapeArea())
				ActionOverride("Aerie",EscapeArea())~ EXIT

CHAIN
IF ~~ THEN MINSCJ Leaving
@478
== KORGANJ IF ~IsValidForPartyDialogue("Korgan")~ THEN @479
END
IF ~IsValidForPartyDialogue("Edwin")~ THEN
				SOLVED_JOURNAL @480
				DO ~SG("WWBooGone",5)
				ActionOverride("Minsc",LeaveParty())
				ActionOverride("Minsc",GivePartyAllEquipment())
				ActionOverride("Minsc",EscapeArea())~ EXTERN EDWINJ EdwinComment
IF ~!IsValidForPartyDialogue("Edwin")~ THEN 		
				SOLVED_JOURNAL @480						
				DO ~SG("WWBooGone",5)
				ActionOverride("Minsc",LeaveParty())
				ActionOverride("Minsc",GivePartyAllEquipment())
				ActionOverride("Minsc",EscapeArea())~ EXIT

/*

CHAIN
IF WEIGHT #-43 ~Global("WWMinscFountain","LOCALS",2)
				G("WWTalkedEleanyaAlready",0)~ THEN MINSCJ SeeElly
@481
DO ~SetGlobal("WWMinscFountain","LOCALS",3)~
== MINSCJ IF ~IsValidForPartyDialogue("Edwin")
				Gender("Edwin",FEMALE)~ THEN @482
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")
				Gender("Edwin",FEMALE)~ THEN @483
== MINSCJ IF ~IsValidForPartyDialogue("Edwin")
				Gender("Edwin",FEMALE)~ THEN @484
== MINSCJ IF ~OR(2)
				  !IsValidForPartyDialogue("Edwin")
				  Gender("Edwin",MALE)~ THEN @485
== AERIEJ IF ~IsValidForPartyDialogue("Aerie")~ THEN @486
== MINSCJ @487
== HAERDAJ IF ~IsValidForPartyDialogue("Haerdalis")~ THEN @488
== KORGANJ IF ~IsValidForPartyDialogue("Korgan")~ THEN @489
== CERNDJ IF ~IsValidForPartyDialogue("Cernd")~ THEN @490
== MINSCJ IF ~OR(3)
                  IsValidForPartyDialogue("Cernd")
				  IsValidForPartyDialogue("Korgan")
				  IsValidForPartyDialogue("Haerdalis")~ THEN @491
== EDWINJ IF ~OR(3)
                  IsValidForPartyDialogue("Cernd")
				  IsValidForPartyDialogue("Korgan")
				  IsValidForPartyDialogue("Haerdalis")
				IsValidForPartyDialogue("Edwin")~ THEN @492
== VALYGARJ IF ~IsValidForPartyDialogue("Valygar")~ THEN @493
END
++ @494 EXTERN MINSCJ Subtlety
++ @495 EXTERN MINSCJ AskHamster
++ @496 EXTERN MINSCJ AuraEvil

*/

CHAIN
IF ~~ THEN MINSCJ AuraEvil
@497
== WWELLE @498
== MINSCJ @499
== WWELLE @500
== MINSCJ @501
END
IF ~~ THEN DO ~SetGabber(Player1)~ EXTERN WWELLE WhatIsThis

CHAIN IF ~~ THEN MINSCJ AskHamster
@502
= @503
== WWELLE @504
== MINSCJ @505
END
IF ~~ THEN DO ~SetGabber(Player1)~ EXTERN WWELLE WhatIsThis

CHAIN
IF ~~ THEN MINSCJ Subtlety
@506
= @507
== WWELLE @508
= @509
== MINSCJ @510
END
IF ~~ THEN DO ~SetGabber(Player1)~ EXTERN WWELLE WhatIsThis


CHAIN
IF ~~ THEN WWELLE ToQuestions
@511
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @512
== EDWINJ IF ~IsValidForPartyDialogue("Nalia")
			  IsValidForPartyDialogue("Edwin")~ THEN @513
== WWELLE @514
= @515
== MINSCJ IF ~IsValidForPartyDialogue("Minsc")~ THEN @516
END
IF ~IsValidForPartyDialogue("Edwin")~ THEN EXTERN EDWINJ EdwinYawn
++ @517  DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @518 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @519 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Wrong1
++ @520 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Right1
++ @521 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @522 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @523 EXTERN WWELLE TotallyWrong
++ @524 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)~ EXTERN WWELLE YouLady

CHAIN
IF ~~ THEN WWELLE TotallyWrong
@525
== MINSCJ @526
== WWELLE @527
== MINSCJ @528
== WWELLE @529
== MINSCJ @530
== WWELLE @531
END
IF ~~ THEN DO ~ClearAllActions()
               StartCutScene("wwctel")~ EXIT

CHAIN
IF ~~ THEN EDWINJ TellAnswer
@532
== ANOMENJ IF ~IsValidForPartyDialogue("Anomen")
				Gender(Player1,MALE)~ THEN @533
== ANOMENJ IF ~IsValidForPartyDialogue("Anomen")
				Gender(Player1,FEMALE)~ THEN @534
== WWELLE @535
END
++ @536 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Right1
++ @519 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Wrong1
++ @517 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE  Wrong1
++ @518 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE  Wrong1
++ @521 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE  Wrong1
++ @522 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE  Wrong1
++ @523 EXTERN WWELLE  TotallyWrong
++ @537 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)~ EXTERN WWELLE  YouLady


CHAIN
IF ~~ THEN WWELLE Wrong1
@538
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @539
END
// IF ~~ THEN EXTERN WWELLE Question2
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ2","LOCALS",1))
~ EXIT


CHAIN
IF ~~ THEN WWELLE YouLady
@540
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @539
END
// IF ~~ THEN EXTERN WWELLE Question2
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ2","LOCALS",1))
~ EXIT

CHAIN
IF ~~ THEN WWELLE Right1
@541
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @542
== WWELLE @543
END
// IF ~~ THEN EXTERN WWELLE Question2
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ2","LOCALS",1))
~ EXIT


CHAIN
IF WEIGHT #-15 ~Global("WWAskQ2","LOCALS",2)~ THEN WWELLE Question2
@544
= @545
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @546
== MINSCJ @547
END
IF ~IsValidForPartyDialogue("Edwin")~ EXTERN EDWINJ NotSimpleEnough
++ @548 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @549 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Right2
++ @550 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @551 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @552 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @553 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @554 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @555 DO ~ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE TotallyWrong
+ ~Gender(Player1,MALE)~ + @556 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty
+ ~Gender(Player1,FEMALE)~ + @557 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty


CHAIN
IF ~~ THEN WWELLE Right2
@558
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @559
END
// IF ~~ THEN EXTERN WWELLE Question3
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ3","LOCALS",1))
~ EXIT

CHAIN
IF ~~ THEN WWELLE YouBeauty
@560
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @559
END
// IF ~~ THEN EXTERN WWELLE Question3
IF ~~ THEN DO ~ActionOverride("wwelle",SetGlobal("WWAskQ3","LOCALS",1))
~ EXIT

CHAIN
IF WEIGHT #-14 ~Global("WWAskQ3","LOCALS",2)~ THEN WWELLE Question3
@561
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @562
== MINSCJ @563
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @564
== AERIEJ IF ~IsValidForPartyDialogue("Aerie")~ THEN @565
== ANOMENJ IF ~IsValidForPartyDialogue("Anomen")~ THEN @566
== KORGANJ IF ~ OR(4)
					IsValidForPartyDialogue("Edwin")
                    IsValidForPartyDialogue("Nalia")
					IsValidForPartyDialogue("Aerie")
					IsValidForPartyDialogue("Anomen")
				IsValidForPartyDialogue("Korgan")~ THEN @567
== WWELLE @568
END
++ @569 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE garnet
++ @570 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE laeral
++ @571 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE diamond
++ @572 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE pearl
++ @573 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE ioun
++ @574 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE sapphire
++ @575 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE emerald
+ ~IsValidForPartyDialog("Nalia")~ + @576 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE anystoneNalia
+ ~!IsValidForPartyDialog("Nalia")~ + @576 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE anystone
++ @577 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ3","LOCALS",3))~ EXTERN WWELLE nostone

CHAIN
IF ~~ THEN WWELLE anystoneNalia
@578
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @579
== WWELLE IF ~IsValidForPartyDialogue("Nalia")~ THEN @580
END
IF ~~ THEN DO ~GiveItemCreate("MISC43","Nalia",0,0,0)  // Emerald
		~ GOTO Rewards

CHAIN
IF ~~ THEN WWELLE anystone
@578
= @581
END
IF ~~ THEN DO ~GiveItemCreate("WWBAG02",Player1,0,0,0)  // Gem bag
		~ GOTO Rewards

CHAIN
IF ~~ THEN WWELLE nostone
@582
== MINSCJ @586
END
IF ~~ THEN GOTO Rewards


CHAIN
IF ~~ THEN WWELLE Compliment
@587
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @588
== EDWINJ IF ~IsValidForPartyDialogue("Edwin")~ THEN @589
END
IF ~~ THEN DO ~ActionOverride("Minsc",ReallyForceSpellRES("wwboo",Myself))
				AddexperienceParty(15000)
				SetGlobal("WWBooGone","GLOBAL",2) DestroyItem("wweboo")
				ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
				ActionOverride("WWElle",EscapeArea())~ EXIT


CHAIN
IF ~~ THEN MINSCJ ThreatenElly
@590
== WWELLE @591
== MINSCJ @592
END
IF ~~ THEN EXTERN WWELLE TotallyWrong



CHAIN
IF ~~ THEN WWELLE GreaterThings
@593
== MINSCJ @594
== WWELLE @595
END
++ @596 + NoWay
++ @597 + Inbred
++ @598 + 1000Gold

CHAIN
IF ~~ THEN WWELLE InsultDelyl
@599
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @600
== WWELLE @601
END
++ @602 + ToQuestions
++ @160 + LifeFor


CHAIN
IF ~~ THEN WWELLE HamsterSwimLow
@603
== KORGANJ IF ~IsValidForPartyDialog("Korgan")~ THEN @604
== WWELLE @605
== MINSCJ @606
END
++ @607 + Inbred
++ @155 + LifeFor
+ ~PartyGoldGT(1000)~ + @608 + 1000Gold
++ @609 + NoWay


CHAIN
IF ~~ THEN WWELLE HamsterSwimHigh
@610
= @611
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @612
== WWELLE IF ~IsValidForPartyDialogue("Nalia")~ THEN @613
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @614
== WWELLE IF ~IsValidForPartyDialogue("Nalia")~ THEN @615
== WWELLE @616
= @617
== VALYGARJ IF ~IsValidForPartyDialogue("Valygar")~ THEN @618
== EDWINJ IF ~!IsValidForPartyDialogue("Valygar")
			  IsValidForPartyDialogue("Edwin")~ THEN @619
== NALIAJ IF ~IsValidForPartyDialogue("Nalia")~ THEN @620
== WWELLE @621
== MINSCJ @622
== WWELLE @623
= @624
== MINSCJ @625
END
++ @626 + GreaterThings
++ @627 + LifeFor
+ ~PartyGoldGT(1000)~ + @608 + 1000Gold
++ @628 + Inbred

CHAIN
IF ~~ THEN WWELLE UnhandHamster
@629
== MINSCJ @630
== WWELLE @631
== MINSCJ @632
END
IF ~~ THEN EXTERN WWELLE Yours


CHAIN
IF WEIGHT #-42 ~Global("WWBooVictory","LOCALS",1)~ THEN MINSCJ BooIsBack
@633
DO ~SetGlobal("WWBooVictory","LOCALS",9)~
= @634
= @635
= @636 
= @637
END
IF ~~ THEN SOLVED_JOURNAL @638
			DO ~EraseJournalEntry(@729)
	        EraseJournalEntry(@754)
	        EraseJournalEntry(@69)
		  	EraseJournalEntry(@84)
	        SetGlobal("WWCowledAppearance","GLOBAL",1)~ EXIT

CHAIN
IF WEIGHT #-2 ~Global("WWAttackedElly","GLOBAL",2)~ THEN WWELLE NotWorth
@639
DO ~SG("WWAttackedElly",3)~
= @640
END
IF ~~ THEN DO ~	ActionOverride("Minsc",ReallyForceSpellRES("wwBoo",Myself))
				SetGlobal("WWBooGone","GLOBAL",2) DestroyItem("wweboo")
				ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
				AddexperienceParty(15000) /* Kulyok */
				EscapeArea()~ EXIT


CHAIN
IF WEIGHT #-41 ~Global("WWBooVictory","LOCALS",2)~ THEN MINSCJ BooBackSombre
@641
DO ~SetGlobal("WWBooVictory","LOCALS",9)~
= @642
= @643
END
IF ~~ THEN  SOLVED_JOURNAL @644
	DO 	~EraseJournalEntry(@729)
	        EraseJournalEntry(@754)
	        EraseJournalEntry(@69)
		  	EraseJournalEntry(@84)
			SetGlobal("WWCowledAppearance","GLOBAL",1)~ EXIT


CHAIN
IF ~~ THEN WWELLE hitMinsc
@645
= @646
== MINSCJ @647
== WWELLE @648
== MINSCJ @649
= @650
== WWELLE @651
END
IF ~~ THEN DO ~ ActionOverride("Minsc",ReallyForceSpellRES("wwboo",Myself))
				AddexperienceParty(20000)
				SetGlobal("WWBooGone","GLOBAL",2) DestroyItem("wweboo")
				ActionOverride("Minsc",ChangeAIScript("wwbant",OVERRIDE))
				ActionOverride("Minsc",AddSpecialAbility("wwblet"))
				EscapeArea()~ EXIT


/////////////////////
/* APPENDs go here */
/////////////////////


/* Minsc */

APPEND ~MINSCJ~

IF WEIGHT #-100
~Global("WWNotMeanToBeHere","LOCALS",1)~ THEN BEGIN WeAreInARWWBO
SAY @811
=@812
IF ~~ THEN DO ~SetGlobal("WWNotMeanToBeHere","LOCALS",2)
				SetGlobal("WWBanditDelay","AR1900",1)~ EXIT
END

IF WEIGHT #-50 ~Global("WWBooGone","GLOBAL",1)
	Global("WWMinscHorror","LOCALS",1)
	~ THEN BEGIN BooIsMissing
SAY @652 
= @653
= @654
= @655
= @653
= @656
++ @657 DO ~SetGlobal("WWMinscHorror","LOCALS",2)~ + BooRun
++ @658 DO ~SetGlobal("WWMinscHorror","LOCALS",2)~ + BooArmour
++ @659 DO ~SetGlobal("WWMinscHorror","LOCALS",2)~  + CatGotYourBoo
++ @660 DO ~SetGlobal("WWMinscHorror","LOCALS",2)~  + AccuseStealBoo
END

IF WEIGHT #-49 ~Global("WWBooGone","GLOBAL",1)
Global("WWHelpFindBoo","GLOBAL",3)
	Global("WWBooComplaint","LOCALS",0)~ THEN BEGIN BooStillMissing
SAY @661
++ @662 DO ~SetGlobal("WWBooComplaint","LOCALS",1)~ + Hmmm
++ @663 DO ~SetGlobal("WWBooComplaint","LOCALS",1)~ + Looking
++ @664 DO ~SetGlobal("WWHelpFindBoo","GLOBAL",10)~ + Mad        // This shuts up the complaints
END

IF WEIGHT #-48 ~Global("WWBooGone","GLOBAL",1)
	Global("WWHelpFindBoo","GLOBAL",5)
	Global("WWBooComplaint2","LOCALS",0)~ THEN BEGIN BooStillMissing2
SAY @665
= @666
++ @667 DO ~SetGlobal("WWBooComplaint2","LOCALS",1)~ + Hmmm2
++ @668 DO ~SetGlobal("WWBooComplaint2","LOCALS",1)~ + Looking2
++ @669 DO ~SetGlobal("WWHelpFindBoo","GLOBAL",10)~ + Mad        // This shuts up the complaints
END

IF WEIGHT #-47 ~Global("WWBooGone","GLOBAL",1)
	Global("WWHelpFindBoo","GLOBAL",7)
	Global("WWBooComplaint3","LOCALS",0)~ THEN BEGIN BooStillMissing3
SAY @670
IF ~~ THEN	SOLVED_JOURNAL @671
			DO ~SetGlobal("WWBooComplaint3","LOCALS",1)
			ActionOverride("Minsc",LeaveParty())
			SG("WWBooGone",4)
			LeaveParty()
			GivePartyAllEquipment()
			EscapeArea()
			EraseJournalEntry(@729)
	        EraseJournalEntry(@754)
	       	EraseJournalEntry(@69)
		  	EraseJournalEntry(@84)~ EXIT
END

IF WEIGHT #-46 ~Global("WWMinscFountain","LOCALS",1)
				Global("WWFountain","LOCALS",0)~ THEN BEGIN BooFountain
SAY @672
IF ~~ THEN DO ~SetGlobal("WWFountain","LOCALS",1)~ EXIT
END

IF ~See("WWBill")
	Global("WWBooGone","GLOBAL",1)
	Global("WWBillySeen","GLOBAL",1)~ THEN YouBilly
SAY @673
IF ~~ THEN DO ~ClearAllActions()
				SetInterrupt(FALSE)
				SetGlobal("WWBillySeen","GLOBAL",2)
				SetGlobal("WWHelpFindBoo","GLOBAL",10)
				DisplayStringHead("WWBill",5251)
				ActionOverride("WWBill",Wait(1))
				ActionOverride("WWBill",MoveToPointNoInterrupt([2270.2104]))
				ActionOverride("WWBill",OpenDoor("Door0314"))
				SetInterrupt(FALSE)
				ActionOverride("WWBill",SmallWait(3))
				ActionOverride("WWBill",MoveBetweenAreas("AR0314",[412.542],2))~ EXIT
END

IF WEIGHT #-45 ~Global("WWFakeBoo","GLOBAL",1)
				GlobalTimerExpired("WWFakeBooTimer","GLOBAL")~ THEN FakeBooComment1
SAY @674
+ ~GLT("Chapter",%bg2_chapter_5%) !Global("C#IM_ImoenStays","GLOBAL",1)~ + @675 DO ~SetGlobal("WWFakeBoo","GLOBAL",2)~ + MeanChar
+ ~Or(2) GGT("Chapter",%bg2_chapter_4%) Global("C#IM_ImoenStays","GLOBAL",1)~ + @675 DO ~SetGlobal("WWFakeBoo","GLOBAL",2)~ + MeanChar6
++ @676 DO ~SetGlobal("WWFakeBoo","GLOBAL",2)~ + Confession
END

IF WEIGHT #-44 ~Global("WWBooLie","LOCALS",2)
				GlobalTimerExpired("WWFakeBooTimer","GLOBAL")~ THEN FakeBoo2
SAY @677
= @678
= @679
= @680
++ @681 DO ~SetGlobal("WWBooLie","LOCALS",3)~ + NoRemorse
++ @682 DO ~SetGlobal("WWBooLie","LOCALS",3)~  + NoRemorse
++ @683 DO ~SetGlobal("WWBooLie","LOCALS",3)~  + NoRemorse
++ @684 DO ~SetGlobal("WWBooLie","LOCALS",3)~  + NoRemorse
++ @685 DO ~SetGlobal("WWBooLie","LOCALS",3)~  + BetrayedMinsc
END

IF ~Global("WWMinscLeavesDying","LOCALS",1)~ THEN MinscLeavesDyingTalk
SAY @686
IF ~~ THEN  SOLVED_JOURNAL @687
			DO ~GivePartyAllEquipment()
				EraseJournalEntry(@729)
	        	EraseJournalEntry(@754)
	        	EraseJournalEntry(@69)
			  	EraseJournalEntry(@84)
			EscapeArea()~ EXIT
END

IF ~Global("WWMinscInBrynnlaw","LOCALS",1)
	G("WWBooGone",1)
	G("Chapter",%bg2_chapter_4%)
	AreaCheck("AR1600")~ THEN MinscMadInBrynnlaw
SAY @688
++ @689 + TrustMe
++ @690 + ForgetBoo
++ @691 + Addled
++ @692 + ForgetBoo
END

IF ~~ TrustMe
SAY @693
= @694
IF ~~ THEN SOLVED_JOURNAL @671
				DO ~SG("WWBooGone",4)
				EraseJournalEntry(@729)
	     	   	EraseJournalEntry(@754)
	        	EraseJournalEntry(@69)
		  		EraseJournalEntry(@84)
				LeaveParty()
				GivePartyAllEquipment()
				EscapeArea()~ EXIT
END

IF ~~ ForgetBoo
SAY @695
= @696
IF ~~ THEN SOLVED_JOURNAL @697
				DO ~EraseJournalEntry(@729)
		        EraseJournalEntry(@754)
	    	    EraseJournalEntry(@69)
		  		EraseJournalEntry(@84)
				LeaveParty()
				Enemy()
				Attack(Player1)~ EXIT
END

IF ~~ Addled
SAY @698
= @699
= @700
++ @689 + TrustMe
++ @701 + ForgetBoo
++ @692 + ForgetBoo
END


IF ~~ MeanChar
SAY @702
IF ~~ THEN DO ~SetGlobalTimer("WWFakeBooTimer","GLOBAL",ONE_DAY)
			   SetGlobal("WWBooLie","LOCALS",1)~ EXIT
END

IF ~~ MeanChar6
SAY @703
IF ~~ THEN DO ~SetGlobalTimer("WWFakeBooTimer","GLOBAL",ONE_DAY)
			   SetGlobal("WWBooLie","LOCALS",1)~ EXIT
END

IF ~~ Confession
SAY @704
++ @705 + WeirdCharname
++ @706 + BetrayedMinsc
++ @707 + NoRemorse1
END

IF ~~ NoRemorse1
SAY @708
= @709
IF ~~ THEN EXTERN MINSCJ NoRemorse
END

IF ~~ WeirdCharname
SAY @710
IF ~~ THEN DO ~SetGlobalTimer("WWFakeBooTimer","GLOBAL",ONE_DAY)
			   SetGlobal("WWBooLie","LOCALS",1)~ EXIT
END

IF ~~ Hmmm
SAY @711
IF ~~ THEN EXIT
END

IF ~~ Mad
SAY @712
= @713
++ @714 + TrustMeInThis
++ @715 + QuestOwn
++ @716 + MinscAttackYou
END

IF ~~ TrustMeInThis
SAY @717
= @718
IF ~~ THEN GOTO MinscLeavesGone
END

IF ~~ MinscLeavesGone
SAY @719
IF ~~ THEN 		SOLVED_JOURNAL @671
				DO ~EraseJournalEntry(@754)
			    EraseJournalEntry(@729)
	 	     	EraseJournalEntry(@69)
		  	    EraseJournalEntry(@84)
			    SG("WWBooGone",4)
			    LeaveParty()
			    GivePartyAllEquipment()
				EscapeArea()~ EXIT
END

IF ~~ QuestOwn
SAY @720
= @721
= @722
IF ~~ THEN GOTO MinscLeavesGone
END

IF ~~ MinscAttackYou
SAY @723
= @724
= @725
= @726
IF ~~ THEN 		SOLVED_JOURNAL @727
				DO ~EraseJournalEntry(@754)
			    	EraseJournalEntry(@729)
	 	     	    EraseJournalEntry(@69)
		  	    	EraseJournalEntry(@84)
				EquipMostDamagingMelee()
				LeaveParty()
				Enemy()
				Attack(Player1)~ EXIT
END


IF ~~ Hmmm2
SAY @728
IF ~~ THEN UNSOLVED_JOURNAL @729

		DO ~SetGlobalTimer("WWFindBooTimer","GLOBAL",ONE_DAY)
			IncrementGlobal("WWHelpFindBoo","GLOBAL",1)~ EXIT
END


IF ~~ BooRun
SAY @730
IF ~~ THEN GOTO AccuseStealBoo
END

IF ~~ BooArmour
SAY @731
IF ~~ THEN GOTO AccuseStealBoo
END

IF ~~ CatGotYourBoo
SAY @732
= @733
IF ~~ THEN DO ~	SG("WWBooGone",4)
				LeaveParty()
				GivePartyAllEquipment()
				EscapeArea()~ EXIT
END

IF ~~ BooKidding
SAY @734
++ @735 + HelpFindBoo
++ @736 + NotHelpBoo
END

IF ~~ BooLaughter
SAY @737
++ @735 + HelpFindBoo
++ @738 + NotHelpBoo
END

IF ~~ NotHelpBoo
SAY @739
= @740
++ @741 + SadMinsc
++ @742 + HelpFindBoo
+ ~!Global("C#IM_ImoenStays","GLOBAL",1)~ + @743 + SadMinsc
END

IF ~~ HelpFindBoo
SAY @744
++ @745 + ToTheDocks
++ @746 + ToTheDocks
END

IF ~~ SadMinsc
SAY @747
++ @748 + HelpFindBoo
++ @749 + SadMinsc2
END

IF ~~ SadMinsc2
SAY @750
IF ~~ THEN SOLVED_JOURNAL @751
				DO ~SG("WWBooGone",4)
			    EraseJournalEntry(@754)
			    EraseJournalEntry(@729)
	 	     	EraseJournalEntry(@69)
		  	    EraseJournalEntry(@84)
				SetGlobal("WWHelpFindBoo","GLOBAL",10)
			 	LeaveParty()
				GivePartyAllEquipment()
				EscapeArea() ~ EXIT
END

IF ~~ ToTheDocks
SAY @752
= @753
IF ~~ THEN UNSOLVED_JOURNAL @754
			DO ~SetGlobal("WWHelpFindBoo","GLOBAL",1)~ EXIT
END

IF ~~ Looking
SAY @755
IF ~~ THEN EXIT
END

IF ~~ Looking2
SAY @756
IF ~~ THEN UNSOLVED_JOURNAL @729
			DO ~SetGlobalTimer("WWFindBooTimer","GLOBAL",ONE_DAY)
			IncrementGlobal("WWHelpFindBoo","GLOBAL",1)~ EXIT
END

IF ~~ MinscReconsiders
SAY @757
= @758
++ @759 EXTERN WWBILL Cantmakeme
++ @760 EXTERN WWBILL Cantmakeme
END

IF ~~ iwillfight
SAY @761
IF ~~ THEN DO ~   SetGlobal("FightVivick","GLOBAL",1) 
			SetGlobal("FightVivickNow","GLOBAL",1)~ EXIT      // ie delay too long and Minsc will fight provided he is healthy
END

IF ~~ MinscExplain
SAY @762
IF ~~ THEN EXTERN WWVIVI Laughs
END

IF ~~ BetrayalBoo
SAY @763
IF ~~ THEN GOTO LiarCharname
END

IF ~~ TravelRoad
SAY @764
IF ~~ THEN GOTO LiarCharname
END


IF ~~ SoBig
SAY @765
++ @766 + NoCombat
++ @767 + MeantToBe
END

IF ~~ MeantToBe
SAY @768
IF ~~ THEN GOTO LiarCharname
END

IF ~~ LiarCharname
SAY @769
= @770
= @771
= @772
= @773
= @774
IF ~~ THEN SOLVED_JOURNAL @480 /* Kulyok */
			   DO ~SetGlobal("WWBetrayedMinsc","GLOBAL",1)
			   SG("WWSmethyChastens",1)
			   SG("WWBooGone",4)
			   LeaveParty()
   			   GivePartyAllEquipment()
			   MoveToPoint([177.395])
			   EscapeAreaDestroy(2)~ EXIT


END

END   // APPENDING MINSCJ

/* Jaheira */

APPEND ~JAHEIRAJ~

IF ~~ IdiotCharname
SAY @775
IF ~~ THEN EXTERN WWSWOO niceMan
END

END   // APPENDING JAHEIRAJ

/* Edwin */
APPEND ~EDWINJ~

IF ~~ EdwinCommentAerie
SAY @776
IF ~~ THEN EXIT
END

IF ~~ EdwinComment
SAY @777
IF ~~ THEN EXIT /* Kulyok - journal entries are all up for consistency*/
END

IF ~~ EdwinYawn
SAY @778
IF ~~ THEN EXTERN EDWINJ EdwinHelp
END

IF ~~ EdwinHelp
SAY @779
++ @780 + TellAnswer
++ @781 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @518 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @519 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Wrong1
++ @520 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)~ EXTERN WWELLE Right1
++ @521 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @522 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)~ EXTERN WWELLE Wrong1
++ @523 EXTERN WWELLE TotallyWrong
++ @537 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)~ EXTERN WWELLE YouLady
END

IF ~~ THEN AskEdwin
SAY @782
++ @783 + AnswerEdwin2
++ @784 + AnswerEdwin2
++ @548 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @549 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Right2
++ @550 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @551 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @553 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @554 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @555 DO ~			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE TotallyWrong
+ ~Gender(Player1,MALE)~ + @556 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty
+ ~Gender(Player1,FEMALE)~ + @557 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty
END

IF ~~ AnswerEdwin2
SAY @785
++ @549 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Right2
++ @548 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @550 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @551 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE  Wrong2
++ @552 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @553 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",0)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @554 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",1)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE Wrong2
++ @555 DO ~			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE TotallyWrong
+ ~Gender(Player1,MALE)~ + @556 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty
+ ~Gender(Player1,FEMALE)~ + @557 DO ~IncrementGlobal("WWEllyQuestions","GLOBAL",2)
			ActionOverride("WWElle",SetGlobal("WWAskQ2","LOCALS",3))~ EXTERN WWELLE YouBeauty
END

IF ~~ NotSimpleEnough
SAY @786
IF ~~ THEN EXTERN EDWINJ AskEdwin
END

END


/* Aerie */

APPEND ~AERIEJ~

IF ~~ AerieJoins
SAY @787
IF ~~ THEN SOLVED_JOURNAL @788
				DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)
				SG("WWBooGone",5)
				LeaveParty()
				GivePartyAllEquipment()
				EscapeArea()
				ActionOverride("Minsc",EquipMostDamagingMelee())
				ActionOverride("Minsc",LeaveParty())
				ActionOverride("Minsc",Enemy())
				ActionOverride("Minsc",Attack(Player1))~ EXIT
END

IF ~~ MinscRomance
SAY @789
++ @790 + NastyReply
++ @791 + SincereReply
+ ~CheckStatGT(Player1,14,CHR)~ + @792 + JokeHigh
+ ~OR(2)
	CheckStat(Player1,14,CHR)
	CheckStatLT(Player1,14,CHR)~ + @792 + JokeLow
END

IF ~~ NastyReply
SAY @793
IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ SincereReply
SAY @794
IF ~~ THEN EXIT
END

IF ~~ JokeHigh
SAY @795
IF ~~ THEN EXIT
END

IF ~~ JokeLow
SAY @796
IF ~~ THEN DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ EXIT
END

END



// Minsc's kicked out & unhappiness dialogues

APPEND ~MINSCP~

IF WEIGHT #-5 ~HasItem("wweboo","Minsc") !HasItem("MISC84","Minsc") /* Kulyok */
			   !Global("WWBetrayedMinsc","GLOBAL",1)
			   Global("WWLeave","LOCALS",0)~ THEN MinscLeavesForever
SAY @797
++ @798 + ByeService
++ @799 + ByeService
++ @800 + JoinAgain
END

IF ~~ ByeService
SAY @801
= @802
IF ~~ THEN SOLVED_JOURNAL @751
		DO ~SetGlobal("WWLeave","LOCALS",1)
		SG("WWBooGone",5)
		GivePartyAllEquipment()
		EraseJournalEntry(@729)
		EraseJournalEntry(@754)
		EscapeArea()~ EXIT
END

IF ~~ JoinAgain
SAY @803
IF ~~ THEN DO ~JoinParty()~ EXIT
END

END


///////////////////////
/* Random interjects */
///////////////////////

INTERJECT_COPY_TRANS BMINSC 14 MinscAddedComment
  == MINSCJ   IF ~OR(2)  Global("WWBooGone","GLOBAL",2)
						 Global("WWBooGone","GLOBAL",3)~ THEN
    @804
END

INTERJECT_COPY_TRANS DBEGGAR 0 MinscBeggar
  == MINSCJ IF ~Global("WWBooGone","GLOBAL",1)~ THEN
	@805
  == DBEGGAR IF ~Global("WWBooGone","GLOBAL",1)~ THEN
	@806
END


