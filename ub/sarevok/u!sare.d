// Additional dialogue for Yoshimo

ADD_TRANS_ACTION BYOSHIM BEGIN 39 END BEGIN 0 1 2 END ~SetGlobalTimer("U!SYoshimoTalksPC","GLOBAL",ONE_DAY)~

APPEND BYOSHIM

IF WEIGHT #-1 ~Global("U!SYoshimoImpose","LOCALS",1)~ IMPOSE
SAY @6
+ + @7  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + ABRUPT
+ + @8  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + AFFECT
+ + @9  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + HATRED
+ ~Gender(Player1,MALE)~ + @10  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + MALE
+ ~Gender(Player1,FEMALE)~ + @10  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + FEMALE
+ + @11  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + HATRED
+ ~Gender(Player1,MALE)~ + @12  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + MALE
+ ~Gender(Player1,FEMALE)~ + @13  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + FEMALE
+ + @14  DO ~SetGlobal("U!SYoshimoImpose","LOCALS",2)~ + RATHER
END

IF ~~ RATHER
SAY @15
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",2)~ EXIT
END

IF ~~ ABRUPT
SAY @16 IF ~~ GOTO AFFECT
END

IF ~~ HATRED
SAY @17
+ + @18 + PERSONAL
+ + @19 + TASK
+ + @20 + FASHION
+ + @21 + TASK
END

IF ~~ MALE
SAY @22
+ + @18 + PERSONAL
+ + @19 + TASK
+ + @23 + TASK
+ + @20 + FASHION
+ + @21 + TASK
+ + @24 + SURVIVAL
END

IF ~~ FEMALE
SAY @25
+ + @18 + PERSONAL
+ + @19 + TASK
+ + @23 + TASK
+ + @20 + FASHION
+ + @21 + TASK
+ + @24 + SURVIVAL
END

IF ~~ AFFECT
SAY @26
+ + @27 + FASHION
+ + @19 + TASK
+ + @23 + TASK
+ + @28 + FASHION
+ + @18 + PERSONAL
+ + @24 + SURVIVAL
END

IF ~~ PERSONAL
SAY @29
+ + @30 + LURE
+ + @31 + MERCY
+ + @32 + WORK
+ + @33 + COMPASSION
+ + @34 + HARSH
END

IF ~~ TASK
SAY @35
+ + @36 + LURE
+ + @37 + MERCY
+ + @32 + WORK 
+ + @38 + COMPASSION
+ + @34 + HARSH
END

IF ~~ FASHION
SAY @39
= @40
+ + @41 + SIMPLE
+ + @42 + SUCCESS
+ + @43 + SIMPLE
+ + @44 + SENSE
+ + @45 + FRIENDS
END

// U!SYoshimo=1	Charname probably killed Tamoko

IF ~~ HARSH
SAY @46
IF ~~ EXIT
END

IF ~~ SUCCESS
SAY @47
IF ~~ EXIT
END

IF ~~ WORK
SAY @48
IF ~~ EXIT
END

// U!SYoshimo=2	Not sure if Charname killed Tamoko

IF ~~ SURVIVAL
SAY @49
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",2)~ EXIT
END

IF ~~ SIMPLE
SAY @50
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",2)~ EXIT
END

IF ~~ FRIENDS
SAY @51
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",2)~ EXIT
END

IF ~~ LURE
SAY @52
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",2)~ EXIT
END

// U!SYoshimo=3	Charname probably didn't kill Tamoko.

IF ~~ COMPASSION
SAY @53
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",3)~ EXIT
END

IF ~~ SENSE
SAY @54
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",3)~ EXIT
END

IF ~~ MERCY
SAY @55
IF ~~ DO ~SetGlobal("U!SYoshimo","GLOBAL",3)~ EXIT
END

END


// Temple of Ilmater

REPLACE SLILMAT

IF ~~ 11
SAY @56
IF ~~ GOTO DONATED
END
END

APPEND SLILMAT

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
SAY @95 IF ~~ GOTO HERE
END

IF ~~ PERCEIVE
SAY @96 IF ~~ GOTO HERE
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


// Remorse

REPLACE_ACTION_TEXT BSAREV25 ~IncrementGlobal("SarevokChange","GLOBAL",-2)~
                             ~IncrementGlobal("SarevokChange","GLOBAL",-2)
                              IncrementGlobal("w#schange","GLOBAL",-2)~

REPLACE_ACTION_TEXT BSAREV25 ~IncrementGlobal("SarevokChange","GLOBAL",-1)~
                             ~IncrementGlobal("SarevokChange","GLOBAL",-1)
                              IncrementGlobal("w#schange","GLOBAL",-1)~

REPLACE_ACTION_TEXT BSAREV25 ~IncrementGlobal("SarevokChange","GLOBAL",1)~
                             ~IncrementGlobal("SarevokChange","GLOBAL",1)
                              IncrementGlobal("w#schange","GLOBAL",1)~

ADD_STATE_TRIGGER BSAREV25 105 ~Global("U!SRemorse","GLOBAL",3)~

ADD_TRANS_TRIGGER BSAREV25 134 ~False()~ DO 0

EXTEND_TOP BSAREV25 134
+ ~Alignment(Player1,MASK_GOOD)~ + @99 + SEEGOOD
+ ~Alignment(Player1,MASK_GENEUTRAL)~ + @99 + SEENEUTRAL
+ ~Alignment(Player1,MASK_EVIL)~ + @99 + SEEEVIL
END

APPEND BSAREV25

IF WEIGHT #-1 ~Global("U!SRemorse","GLOBAL",2)~ IMPRESS
SAY @100
+ + @101 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + DUH
+ ~CheckStatGT(Player1,9,INT)~ + @102 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + NOPE
+ ~CheckStatGT(Player1,9,INT)~ + @103 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + DUH
+ ~CheckStatGT(Player1,11,INT)~ + @104 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + YEP
+ ~CheckStatGT(Player1,9,INT)~ + @105 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + PERHAPS
+ ~CheckStatGT(Player1,11,INT)~ + @106 DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + STUPID
+ + @107  DO ~SetGlobal("U!SRemorse","GLOBAL",3)~ + OFF
END

IF ~~ STUPID
SAY @108 IF ~~ GOTO WHAT
END

IF ~~ OFF
SAY @109 IF ~~ + WHAT
END

IF ~~ WHAT
SAY @110
+ + @111 + DENY
+ + @112 + BAH
+ + @113 + REGRET
+ + @114 + GUESS
END

IF ~~ DUH
SAY @115 
= @116
+ + @117 + REGRET
+ + @111 + DENY
+ + @118 + EVIL
+ + @119 + EVIL
+ + @112 + BAH
+ + @120 + NOPE
+ + @114 + GUESS
+ + @121 EXIT
END

/* IF ~~ DUH2
SAY @115
+ + ~What?!  Look, I don't know what you make of this mess I'm in, but that doesn't sound like my plans at all.  I don't enjoy killing the way you seem to.~ + REGRET
+ + @117 + REGRET
+ + @118 + EVIL
+ + @119 + EVIL
+ + @112 + BAH
+ + @120 + NOPE
+ + @121 EXIT
END */

IF ~~ NOPE
SAY @122 
= @123
+ + @124 + DENY
+ + @112 + BAH
+ + @113 + REGRET
+ + @125 + GUESS
END

/*
IF ~~ WHATEVER
SAY ~So indifferent to your connection to the carnage about us?  You prove time and again that you are indeed a spawn of murder.  By whatever means and regardless of the situation, perhaps even against your original intent - I find that impressive.   Don't you?~
+ + @111 + DENY
+ + @112 + BAH
+ + @113 + REGRET
+ + @114 + GUESS
END
*/

IF ~~ YEP
SAY @126
+ + @127 + DENY
+ + @128 + EVIL
+ + @129 + REGRET
END

IF ~~ PERHAPS
SAY @130 
= @131
+ + @132 + DENY
+ + @112 + BAH
+ + @133 + REGRET
+ + @114 + GUESS
END

IF ~~ EVIL
SAY @134 IF ~~  DO ~IncrementGlobal("w#schange","GLOBAL",-2)~ EXIT
END

IF ~~ GUESS
SAY @135
+ + @127 + DENY
+ + @136 + EVIL
+ + @137 + BAH
+ + @129 + REGRET
END

IF ~~ DENY
SAY @138
+ + @139 + QUIT
+ + @140 + KILLER
+ + @141 + BAH
+ + @142 + REGRET
END

IF ~~ QUIT
SAY @143 IF ~~  DO ~IncrementGlobal("w#schange","GLOBAL",-1)~ EXIT
END

IF ~~ KILLER
SAY @144
+ + @145 + EVIL
+ + @146 + JUDGE
+ + @147 + QUIT
END

IF ~~ JUDGE
SAY @148
IF ~~ EXIT
END

IF ~~ REGRET
SAY @149
= @150
+ + @151 + PARDON
+ + @152 + KILLER
+ + @153 + WHY
+ + @154 + BAH
+ + @155 + WHY
+ + @156 + QUIT
END

IF ~~ PARDON
SAY @157
+ + @158 + LEARN
+ + @159 + QUIT
+ + @160 + CORNY
+ + @161 + MEANING
END

IF ~~ BAH
SAY @162
= @163
+ + @164 + IRRELE
+ + @165 + UNPREDICT
+ + @166 + CORNY
+ + @167 + LEARN	
+ + @168 + QUIT
END

IF ~~ WHY
SAY @169 
+ + @170 + IRRELE
+ + @171 + UNPREDICT
+ + @166 + CORNY
+ + @167 + LEARN
+ + @168 + QUIT
END

IF ~~ IRRELE
SAY @172
+ + @173 + MEANING
+ + @174 + QUIT
+ + @175 + UNPREDICT
+ + @176 + CORNY
+ + @177 + LEARN
END

IF ~~ LEARN
SAY @178
+ + @179 + MEANING
+ + @180  DO ~IncrementGlobal("w#schange","GLOBAL",-1)~ + LESSON
+ + @181  DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + LESSON
+ + @182 EXIT
END

IF ~~ UNPREDICT
SAY @183
= @184
+ + @185 + MEANING
+ + @186 + FALL
+ + @187 + QUIT
+ + @188 + QUIT
END

IF ~~ MEANING
SAY @189
+ ~OR(2)
CheckStatGt(Player1,13,WIS)
Global("U!SIlmater","GLOBAL",1)~ + @190 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + TAMOKO2
+ + @191 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + TAMOKO1
+ ~CheckStatGT(Player1,14,CHR)~ + @192 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + TAMOKO3
+ ~CheckStatLT(Player1,15,CHR)~ + @192 + PROVE
+ + @193 + SILLY
END

IF ~~ SILLY
SAY @194
IF ~~ DO ~IncrementGlobal("w#schange","GLOBAL",-1)~ EXIT
END

IF ~~ PROVE
SAY @195 IF ~~ DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ TAMOKO1
SAY @196
= @197
+ + @198 + UNFOR
+ ~CheckStatGT(Player1,9,WIS)~ + @199 + REFUSE
 + ~CheckStatGT(Player1,12,INT)
Alignment(Player1,MASK_EVIL)~ + @200 + HISTORY
+ ~CheckStatGT(Player1,12,INT)
!Alignment(Player1,MASK_EVIL)~ + @200 + SAVING
+ + @201 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + KILLED
+ ~CheckStatGT(Player1,11,WIS)~ + @202 + UNFOR
+ + @203 + HISTORY
+ + @204 + HISTORY
END

IF ~~ TAMOKO2
SAY @196
= @205
+ + @206 + UNFOR
+ ~CheckStatGT(Player1,9,WIS)~ + @207 + REFUSE
 + ~CheckStatGT(Player1,12,INT)
Alignment(Player1,MASK_EVIL)~ + @208 + HISTORY
+ ~CheckStatGT(Player1,12,INT)
!Alignment(Player1,MASK_EVIL)~ + @208 + SAVING
+ + @209 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + KILLED
+ ~CheckStatGT(Player1,11,WIS)~ + @202 + UNFOR
+ + @210 + HISTORY
END

IF ~~ TAMOKO3
SAY @196
= @197
+ + @211 + UNFOR
+ ~CheckStatGT(Player1,9,WIS)~ + @212 + REFUSE
 + ~CheckStatGT(Player1,12,INT)
Alignment(Player1,MASK_EVIL)~ + @213 + HISTORY
+ ~CheckStatGT(Player1,12,INT)
!Alignment(Player1,MASK_EVIL)~ + @213 + SAVING
+ + @209 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + KILLED
+ ~CheckStatGT(Player1,11,WIS)~ + @202 + UNFOR
+ + @203 + HISTORY
+ + @204 + HISTORY
END

IF ~~ SAVING
SAY @214
= @215
+ + @216 + UNFOR
+ + @217 + REFUSE
+ ~CheckStatGT(Player1,9,WIS)~ + @218 + REFUSE
+ + @219 + UNFOR
+ + @220 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)
IncrementGlobal("w#schange","GLOBAL",-1)~ + KILLED
END

IF ~~ HISTORY
SAY @221
+ + @216 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + UNFOR
+ + @217 + REFUSE
+ ~CheckStatGT(Player1,9,WIS)~ + @218 + REFUSE
+ + @219 + UNFOR
+ + @220 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)
IncrementGlobal("w#schange","GLOBAL",-1)~ + KILLED
END

IF ~~ REFUSE
SAY @222
+ ~CheckStatGT(Player1,9,INT)~ + @223  DO ~SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + UNFOR
+ ~CheckStatGT(Player1,11,WIS)~ + @224 DO ~IncrementGlobal("w#schange","GLOBAL",2)
SetGlobal("w#SKilledTamoko","GLOBAL",-1)~ + BLESS
+ ~OR(2)
CheckStatGT(Player1,14,WIS)
CheckStatGT(Player1,17,INT)~ + @225 DO ~IncrementGlobal("w#schange","GLOBAL",3)
SetGlobal("w#SKilledTamoko","GLOBAL",-1)~ + BLESS
+ + @300 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",-1)~ + UNFOR
/* + + ~I *really* don't know what you're talking about.  Why are you pestering me about this, anyway?~ DO ~IncrementGlobal("w#schange","GLOBAL",-1)
SetGlobal("w#SKilledTamoko","GLOBAL",1)~ + KILLED */
+ + @226 DO ~SetGlobal("w#SKilledTamoko","GLOBAL",-1)~ + UNFOR
END

IF ~~ BLESS
SAY @227
= @228
+ + @229 + NICE
+ ~Global("U!SIlmater","GLOBAL",1)~ + @230 + YOSHIMO
+ + @231 + EXPERT
+ + @232 + FORTUNE
END

IF ~~ UNFOR
SAY @233  
+ + @229 + NICE
+ ~Global("U!SIlmater","GLOBAL",1)~ + @230 + YOSHIMO
+ ~Global("w#SKilledTamoko","GLOBAL",1)~ + @234 + BLUNT
+ ~Global("w#SKilledTamoko","GLOBAL",-1)~ + @235 + BLUNT
+ + @236 + FORTUNE
END

IF ~~ KILLED
SAY @237
+ + @238 + NICE
+ ~Global("U!SIlmater","GLOBAL",1)~ + @230 + YOSHIMO
+ + @234 + BLUNT
+ + @236 + FORTUNE
END

IF ~~ YOSHIMO
SAY @239
= @240
+ + @241 + INSULT
+ ~CheckStatGT(Player1,11,WIS)
!Global("w#SKilledTamoko","GLOBAL",-1)~ + @242 + FAILKILLED
+ ~CheckStatGT(Player1,11,WIS)
Global("w#SKilledTamoko","GLOBAL",-1)~ + @243 + FAILED
+ ~CheckStatGT(Player1,9,WIS)~ + @244 + DIARY
+ + @245 + DIFFER
END

IF ~~ DIARY
SAY @246
+ + @247 + HARDLY
+ + @248 + HARDLY
+ + @249 + SNIT
END

IF ~~ HARDLY
SAY @250
+ + @251 + INSULT
+ ~Global("w#SKilledTamoko","GLOBAL",-1)~ + @252 + FAILED
+ ~!Global("w#SKilledTamoko","GLOBAL",-1)~ + @252 + FAILKILLED
+ + @253 + DIFFER
+ + @254 + SNIT
END

IF ~~ SNIT
SAY @255
+ + @256 + EXACTLY
+ + @257 + EXACTLY
+ + @258 EXIT
END

IF ~~ EXACTLY
SAY @259
+ + @260 + DIFFER
+ + @261 + INSULT
+ ~Global("w#SKilledTamoko","GLOBAL",-1)~ + @262 + FAILED
+ ~!Global("w#SKilledTamoko","GLOBAL",-1)~ + @262 + FAILKILLED
END

IF ~~ INSULT
SAY @263
= @264
+ + @265 + DIFFER
+ + @266 + DIFFER
+ ~!Global("w#SKilledTamoko","GLOBAL",-1)~  + @267 + FAILKILLED
+ ~Global("w#SKilledTamoko","GLOBAL",-1)~ + @267 + FAILED
END

IF ~~ DIFFER
SAY @268
= @269
+ + @270 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + EXPERT
+ + @229 DO ~IncrementGlobal("w#schange","GLOBAL",2)~ + EXPERT
+ + @271 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ FAILED
SAY @272
= @273
+ + @274 DO ~IncrementGlobal("w#schange","GLOBAL",2)~ + THRONE
+ + @275 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + OWN
+ + @276 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + OWN
+ + @277 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + EXPERT
+ + @229 DO ~IncrementGlobal("w#schange","GLOBAL",2)~ + EXPERT
+ + @271 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ FAILKILLED
SAY @272
= @278
+ + @279 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + EXPERT
+ + @229 DO ~IncrementGlobal("w#schange","GLOBAL",2)~ + EXPERT
+ + @271 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ EXPERT
SAY @280
+ + @281 + PRESUME
+ + @282 + PRESUME
+ + @283 + PRESUME
END

IF ~~ PRESUME
SAY @284
IF ~~ EXIT
END

IF ~~ NICE
SAY @285
IF ~~  DO ~IncrementGlobal("w#schange","GLOBAL",2)~ EXIT
END

IF ~~ BLUNT
SAY @286
IF ~~  DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ THRONE
SAY @287
IF ~~ EXIT
END

IF ~~ FORTUNE
SAY @288
IF ~~ DO ~IncrementGlobal("w#schange","GLOBAL",1)~ EXIT
END

IF ~~ FALL
SAY @289
+ + @290 + WARN
+ + @291 DO ~IncrementGlobal("w#schange","GLOBAL",1)~ + LESSON
+ + @292 + CORNY
+ + @293 EXIT
END

IF ~~ WARN
SAY @294
IF ~~ EXIT
END

IF ~~ LESSON
SAY @295
IF ~~ EXIT
END

IF ~~ CORNY
SAY @296
IF ~~  DO ~IncrementGlobal("w#schange","GLOBAL",-2)~ EXIT
END

IF ~~ OWN
SAY @297
IF ~~ EXIT
END

IF ~~ THEN SEEGOOD
SAY #69486
  IF ~GlobalGT("w#schange","GLOBAL",0)
GlobalLT("w#schange","GLOBAL",4)~ THEN GOTO 138 // 1-3: not sincere
  IF ~GlobalLT("w#schange","GLOBAL",1)~ THEN GOTO 139 // zero or less: liar
  IF ~GlobalGT("w#schange","GLOBAL",3)~ THEN GOTO 140 // four or more: redeem
END

IF ~~ THEN SEENEUTRAL
SAY #69486
IF ~GlobalGT("w#schange","GLOBAL",-1)
GlobalLT("w#schange","GLOBAL",5)~ THEN GOTO 138 // 0-4: not sincere
  IF ~GlobalLT("w#schange","GLOBAL",0)~ THEN GOTO 139 // negative: liar
  IF ~GlobalGT("w#schange","GLOBAL",4)~ THEN GOTO 140 // five or more: redeem
END

IF ~~ THEN SEEEVIL
SAY #69486
IF ~GlobalGT("w#schange","GLOBAL",1)
GlobalLT("w#schange","GLOBAL",7)~ THEN GOTO 138 // two to six: not sincere
  IF ~GlobalLT("w#schange","GLOBAL",2)~ THEN GOTO 139 // one or less: liar
  IF ~GlobalGT("w#schange","GLOBAL",6)~ THEN GOTO 140 // seven or more: redeem
END

END
