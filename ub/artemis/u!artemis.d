BEGIN ~ARTEMIS~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN ArtemisOne // from:
  SAY #55646
  IF ~~ THEN EXTERN ~C6DRIZZ2~ DrizztOne

END

IF ~~ THEN BEGIN ArtemisTwo // from:
  SAY #55738
  IF ~~ THEN EXTERN ~C6DRIZZ2~ DrizztTwo

END

APPEND ~C6DRIZZ2~

IF ~Global("ArtemisTalk","GLOBAL",1)
~ THEN BEGIN DrizztOne // from:
  SAY #55737
  IF ~~ THEN DO ~SetGlobal("ArtemisTalk","GLOBAL",2)
~ EXTERN ~ARTEMIS~ ArtemisTwo
END

IF ~~ THEN BEGIN DrizztTwo // from:
  SAY #55739
  IF ~~ THEN EXIT
END
END
