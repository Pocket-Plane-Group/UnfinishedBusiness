BEGIN ~PPSUNA~

IF ~ !Global("AsylumPlot","GLOBAL",50)~ THEN BEGIN 0 // from:
  SAY @147
  IF ~~ THEN EXTERN ~PPIRENI2~ 17
END

IF ~~ THEN BEGIN 1 // from:
  SAY @148
  IF ~~ THEN EXTERN ~PPIRENI2~ 19
END
