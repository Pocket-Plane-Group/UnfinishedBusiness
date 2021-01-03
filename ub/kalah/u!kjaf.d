BEGIN ~U!Kjaf~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN HelloJafir
SAY @286
= @249
= @287
IF ~~ THEN REPLY @288 GOTO Jafir2
END

IF ~NumTimesTalkedTo(1)~ THEN BEGIN JafRevealed
SAY @289
IF ~~ THEN REPLY @290 GOTO Explain
IF ~~ THEN REPLY @291 GOTO Price
IF ~~ THEN REPLY @292 GOTO Price
IF ~~ THEN REPLY @293 GOTO Attack
END

IF ~HPPercentLT(Myself,20)~ THEN BEGIN InjuredJafir
SAY @294
IF ~~ THEN DO ~TakePartyItem("U!KBot1") GiveItem("U!Kbot2",Player1) ForceSpell("U!Kjaf",DRYAD_TELEPORT)~ EXIT /* Kulyok */
END

IF ~~ THEN BEGIN Explain
SAY @295
IF ~~ THEN REPLY @291 GOTO Price
IF ~~ THEN REPLY @292 GOTO Price
IF ~~ THEN REPLY @293 GOTO Attack
END

IF ~~ THEN BEGIN Price
SAY @296
IF ~~ THEN REPLY @290 GOTO Explain
IF ~PartyGoldGT(499)~ THEN REPLY @297 GOTO Buy
IF ~!PartyGoldGT(499)~ THEN REPLY @298 GOTO Poor
IF ~~ THEN REPLY @293 GOTO Attack
END

IF ~~ THEN BEGIN Buy
SAY @299
IF ~~ THEN DO ~TakePartyItem("U!KBot1") GiveItem("U!Kbot2",Player1) ForceSpell("U!Kjaf",DRYAD_TELEPORT) TakePartyGold(500)~ EXIT  /* Kulyok */
END

IF ~~ THEN BEGIN Poor
SAY @300
IF ~~ THEN DO ~ActionOverride("U!Kjaf",Enemy())~ EXIT
END

IF ~~ THEN BEGIN Attack
SAY @301
IF ~~ THEN DO ~ActionOverride("U!Kjaf",Enemy())~ EXIT
END

IF ~~ THEN BEGIN Jafir2
SAY @302
= @303
= @304
IF ~~ THEN DO ~ActionOverride("U!Kjaf",Polymorph(RAKSHASA))~ EXIT
END
