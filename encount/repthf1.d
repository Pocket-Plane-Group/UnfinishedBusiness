BEGIN ~REPTHF1~

IF ~Global("ThiefWarning","GLOBAL",0)
~ THEN BEGIN 0 // from:
  SAY #27133 /* ~You're on the wrong side of the river here, friend. This is Shadow Thief territory and we can't have you committing monstrous crimes without our permission.~ */
  IF ~~ THEN DO ~SetGlobal("ThiefWarning","GLOBAL",1)
~ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #27136 /* ~Take yourself out of the Docks and I won't have to take you out. You'll see the real meaning of murder.~ */
  IF ~~ THEN DO ~EscapeArea()
~ EXIT
END

IF ~True()
~ THEN BEGIN 2 // from:
  SAY #27144 /* ~I warned you to get out of our turf. Now you'll pay. To battle, men!~ */
  IF ~~ THEN DO ~CreateCreatureObject("REPTHF2",Myself,0,0,0)
CreateCreatureObject("REPTHF2",Myself,0,0,0)
CreateCreatureObject("REPTHF2",Myself,0,0,0)
CreateCreatureObject("REPTHF3",Myself,0,0,0)
CreateCreatureObject("REPTHF3",Myself,0,0,0)
Enemy()
~ EXIT
END
