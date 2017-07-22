// creator  : weidu (version 153)
// argument : OBSHAL03.DLG
// game     : .
// source   : ./data/Dialog.bif
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~OBSHAL03~

IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
  SAY #33118 /* ~Perfect.  I have longed for a fresh meal and I am delivered.  You have walked into my arms.  Necre sees that you are ready to fill his stomach.~ */
  IF ~~ THEN REPLY #33119 /* ~I ain't ready for nothing other than bashing your ugly head in.~ */ GOTO 2
  IF ~~ THEN REPLY #33120 /* ~Didn't your mother ever tell you not to talk to strangers.~ */ GOTO 1
  IF ~~ THEN REPLY #33122 /* ~I really must be going.  I have no desire to kill you, but I will if I must.~ */ GOTO 3
  IF ~InParty("minsc")~ THEN REPLY #33133 /* ~We have a hamster for you to snack on, would that do?~ */ EXTERN ~MINSCJ~ 63
END

IF ~~ THEN BEGIN 1 // from: 0.1
  SAY #33121 /* ~My mother taught me how to eat strangers.  Want to see what I learned?~ */
  IF ~~ THEN DO ~Enemy()
ChangeEnemyAlly("obshal01",[ENEMY])~ EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.0
  SAY #33123 /* ~Necre thinks you will be the one with the bashed in head, for how else will I suck the sweet brains from your skull?~ */
  IF ~~ THEN DO ~Enemy()
ChangeEnemyAlly("obshal01",[ENEMY])~ EXIT
END

IF ~~ THEN BEGIN 3 // from: 0.2
  SAY #33124 /* ~I have no desire to kill you either.  However, I must eat and I'm sure you'd rather be dead before I make a meal of you.~ */
  IF ~~ THEN DO ~Enemy()
ChangeEnemyAlly("obshal01",[ENEMY])~ EXIT
END

IF ~~ THEN BEGIN 4 // from:
  SAY #33135 /* ~The hamster will be dessert.  After we eat you of course.~ */
  IF ~~ THEN DO ~Enemy()
ChangeEnemyAlly("obshal01",[ENEMY])~ EXIT
END
