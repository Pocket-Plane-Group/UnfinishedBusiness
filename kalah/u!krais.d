BEGIN ~U!KRais~

IF ~True()~ THEN BEGIN Thanks
SAY @305
IF ~~ THEN REPLY @306 GOTO Bye
END

IF ~~ THEN BEGIN Bye
SAY @307
IF ~~ THEN REPLY @308 GOTO Leave
END

IF ~~ THEN BEGIN Leave
SAY @309
IF ~~ THEN DO ~ActionOverride("U!Krais",EscapeArea())~ EXIT
END
