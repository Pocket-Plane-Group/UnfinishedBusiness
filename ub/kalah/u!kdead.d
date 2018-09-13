BEGIN ~U!Kdead~

IF ~True()~ THEN BEGIN CallSprit
SAY @220
IF ~~ THEN REPLY @221 GOTO Attack
END

IF ~~ THEN BEGIN Attack
SAY @222
= @223
IF ~~ THEN DO ~ActionOverride("U!Kdead",Enemy())~ EXIT
END
