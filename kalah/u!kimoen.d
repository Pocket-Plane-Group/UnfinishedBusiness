BEGIN ~U!KImoen~

IF ~See(Player1)~ THEN BEGIN Hello
SAY @331
= @332
= @333
IF ~~ THEN REPLY @334 GOTO Explain
END

IF ~~ THEN BEGIN Explain
SAY @335
IF ~~ THEN REPLY @336 DO ~ActionOverride("U!KImoen",EscapeArea())~ EXIT
IF ~~ THEN REPLY @337 GOTO WhatNow
END

IF ~~ THEN BEGIN WhatNow
SAY @338
IF ~~ THEN REPLY @339 DO ~ActionOverride("U!KImoen",EscapeArea())~ EXIT
IF ~~ THEN REPLY @340 GOTO Home
END

IF ~~ THEN BEGIN Home
SAY @341
IF ~~ THEN DO ~ActionOverride("U!KImoen",EscapeArea())~ EXIT
END

