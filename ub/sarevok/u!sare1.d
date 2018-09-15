// Because Fixpack changes slilmat to wilmat, we have to add extra content to Fixpack's wilmat dialogue, too - Kulyok

// Temple of Ilmater

REPLACE WILMAT

IF ~~ 4
SAY @56
IF ~~ GOTO DONATED
END
END

APPEND WILMAT

IF ~~ DONATED
SAY @57
+ + @58 + SEE
+ + @59 + SEE
+ + @60 + SEE
END

IF ~~ SEE
SAY @61
IF ~~ DO ~TakePartyItem("miscbu")~ + VERYWELL
END

IF ~~ VERYWELL
SAY @62
IF ~OR(2)
ReputationLT(Player1,9)
Alignment(Player1,MASK_EVIL)~ + DISTRUST
IF ~ReputationGT(Player1,8)
!Alignment(Player1,MASK_EVIL)~ + TRUST
END

IF ~~ TRUST
SAY @63
+ + @64 + CASE
+ + @65 + CASE
+ + @66 + WHETHER
+ + @67 + DESERVE
+ + @68 + CASE
+ + @69 + CASE
END

IF ~~ DISTRUST
SAY @63
+ + @64 + GOAWAY
+ + @65 + GOAWAY
+ + @66 + GOAWAY
+ + @67 + GOAWAY
+ + @68 + GOAWAY
+ + @69 + GOAWAY
END

IF ~~ GOAWAY
SAY @70
+ + @71 + REASON
+ + @72 + REASON
+ + @73 DO ~SetGlobal("U!SIlmater","GLOBAL",-1)
AddexperienceParty(200000)~
EXIT
END

IF ~~ CASE
SAY @74 IF ~~ GOTO STEAD
END

IF ~~ WHETHER
SAY @75 IF ~~ GOTO STEAD
END

IF ~~ DESERVE
SAY @76 IF ~~ GOTO STEAD
END

IF ~~ STEAD
SAY @77
+ + @78 + SEEK
+ + @79  + RIGHT
+ + @80 + FAREWELL
+ + @81 + PAST
END

IF ~~ RIGHT
SAY @82
+ + @83 + SEEK
+ + @84 + FAREWELL
+ + @85 + FAREWELL
END

IF ~~ PAST
SAY @86
+ + @87 + SEEK
+ + @88 + FAREWELL
+ + @89 + FAREWELL
END

IF ~~ REASON
SAY @90
+ + @91 + MERIT
+ + @92 + PERCEIVE
+ + @93 + MERIT
+ + @94 DO ~SetGlobal("U!SIlmater","GLOBAL",-1)
AddexperienceParty(200000)~
EXIT
END

IF ~~ MERIT
SAY @95 IF ~Global("U!SYoshimo","GLOBAL",1) ~ DO
~GiveItemCreate("U!SBOOK1",LastTalkedToBy,1,1,0)
   GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~OR(2)
Global("U!SYoshimo","GLOBAL",0)
Global("U!SYoshimo","GLOBAL",2)~ DO
~GiveItemCreate("U!SBOOK2",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~Global("U!SYoshimo","GLOBAL",3)~ DO
~GiveItemCreate("U!SBOOK3",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
END

IF ~~ PERCEIVE
SAY @96 IF ~Global("U!SYoshimo","GLOBAL",1) ~ DO
~GiveItemCreate("U!SBOOK1",LastTalkedToBy,1,1,0)
   GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~OR(2)
Global("U!SYoshimo","GLOBAL",0)
Global("U!SYoshimo","GLOBAL",2)~ DO
~GiveItemCreate("U!SBOOK2",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~Global("U!SYoshimo","GLOBAL",3)~ DO
~GiveItemCreate("U!SBOOK3",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
END 

IF ~~ SEEK
SAY @299
IF ~Global("U!SYoshimo","GLOBAL",1) ~ DO
~GiveItemCreate("U!SBOOK1",LastTalkedToBy,1,1,0)
   GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~OR(2)
Global("U!SYoshimo","GLOBAL",0)
Global("U!SYoshimo","GLOBAL",2)~ DO
~GiveItemCreate("U!SBOOK2",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
IF ~Global("U!SYoshimo","GLOBAL",3)~ DO
~GiveItemCreate("U!SBOOK3",LastTalkedToBy,1,1,0)
GiveItemCreate("U!SWAKIZ",LastTalkedToBy,1,1,0)~
+ HERE
END

IF ~~ HERE
SAY @97
IF ~~ DO ~SetGlobal("U!SIlmater","GLOBAL",1)
   AddexperienceParty(200000)~
EXIT
END

IF ~~ FAREWELL
SAY @98 IF ~~ DO ~SetGlobal("U!SIlmater","GLOBAL",-1)
AddexperienceParty(200000)~
EXIT
END

END
