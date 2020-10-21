BEGIN O#HALIEU 
BEGIN O#HAPRI
BEGIN O#HAJAN

// 1. Haer'Dalis gets arrested

CHAIN IF ~Global("O#UBHaerDalisArrested","GLOBAL",1)~ THEN O#HALIEU u1
@0 /* In the name of the Council, halt! You harbor a known murderer! */
END
+ ~OR(2) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9)~ + @1 /* I only butchered that village to save it. */ EXTERN O#HALIEU u1.1
+ ~OR(2) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9)~ + @2 /* What, again? Look, it wasn't my fault! */ EXTERN O#HALIEU u1.1
++ @3 /* Interesting. What have I done this time? */ EXTERN O#HALIEU u1.1
++ @4 /* You must be mistaken. We harbor no murderers. */ EXTERN O#HALIEU u1.3
++ @5 /* Watch your tone! You are talking to the Hero of Baldur's Gate! */ EXTERN O#HALIEU u1.1
++ @6 /* I don't want a murderer in my group. Whoever it is, step forward. */ EXTERN O#HALIEU u1.2

CHAIN O#HALIEU u1.1
@7 /* Not you, fool! Step aside! */
END
IF ~~ EXTERN O#HALIEU u1.3

CHAIN O#HALIEU u1.2
@8 /* Thank you for your cooperation, citizen. */
END
IF ~~ EXTERN O#HALIEU u1.3

CHAIN O#HALIEU u1.3
@9 /* This one, a bard from Raelis Shai's troupe. Seize him! */
== HAERDAJ @10 /* Pray hold, my good lieutenant. Whose murder am I accused of? */
== O#HALIEU @11 /* You are accused of murdering Vice-Regent for the Council of Athkatla, Lord Acton Balthis, in his own mansion in the Bridge District! There were witnesses to the fact. Now follow us or else! */
END
++ @12 /* Haer'Dalis, did you do it? */ EXTERN HAERDAJ u1.4
++ @13 /* You'd better come with him, Haer'Dalis. */ EXTERN HAERDAJ u1.5
++ @14 /* There's been a misunderstanding. My friend hasn't killed anyone! */ EXTERN HAERDAJ u1.4
+ ~OR(2) Alignment(Player1,MASK_EVIL) ReputationLT(Player1,9)~ + @15 /* I say we fight! I won't let some troll fodder steal a member of my group! */ EXTERN HAERDAJ u1.4

CHAIN HAERDAJ u1.4
@16 /* I am innocent, but hold your blade, I beg you. No doubt Inspector Brega will look into this and free me in good time. Speak to him on my behalf, my raven. I put my trust in you. */
END
IF ~~ EXTERN O#HALIEU u1.6

CHAIN HAERDAJ u1.5
@17 /* And so I shall, but not for long. No doubt Inspector Brega will look into this and free me in good time. Speak to him on my behalf, my raven. I put my trust in you. */
END 
IF ~~ EXTERN O#HALIEU u1.6

CHAIN O#HALIEU u1.6
@18 /* You can find Chief Inspector Brega in the Council of Six building, citizen. He will answer any questions you have. */
== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @19 /* A strange turn of events. We must investigate at the Government District, <CHARNAME>. */
== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @20 /* I saw Haer'Dalis missing the other night... But I can't see him murdering a Council of Six member out of the blue. We have to find out what has happened. */
== VALYGARJ IF ~InParty("Valygar") InMyArea("Valygar") !StateCheck("Valygar",CD_STATE_NOTVALID)~ THEN @21 /* Corruption everywhere. We have to seek justice ourselves. Perhaps Chief Inspector Brega will have the answers. */
== CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @22 /* Let us visit the murdered man's home in the Bridge District first, <CHARNAME>. It may have some clues to this riddle. */
== O#HALIEU @23 /* Now to the prison! We've lingered long enough. */
DO ~ClearAllActions()
StartCutSceneMode()
StartCutScene("O#HAHAER")~
EXIT

// 2. Haer'Dalis in prison

// Prison keeper

EXTEND_BOTTOM PRISONK1 0
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @24 /* I am here to see my friend, Haer'Dalis. */ EXTERN PRISONK1 k1
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",1)~ + @24 /* I am here to see my friend, Haer'Dalis. */ EXTERN PRISONK1 k2
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",1) Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisToldPK","GLOBAL",0) PartyHasItem("misc5j")~ + @25 /* Actually, Haer'Dalis is innocent. Here is a writ from Brega. */ DO ~SetGlobal("O#UBHaerDalisToldPK","GLOBAL",1)~ EXTERN PRISONK1 k3
END

CHAIN PRISONK1 k1
@26 /* He's in one of the cells to your right. Not for long, though. His execution's already been scheduled, so hurry up if you wanna say your goodbyes or whatnot. */
EXIT

CHAIN PRISONK1 k2
@27 /* You're too late, friend. He's already been sentenced and executed. I'm sorry. */
EXIT

CHAIN PRISONK1 k3
@28 /* I see. Everything seems to be in order. Well, sorry that we nearly executed your friend. */
END
++ @29 /* That's all you have to say? */ EXTERN PRISONK1 k3.1
++ @30 /* Yeah, thanks a lot. */ EXTERN PRISONK1 k3.1

CHAIN PRISONK1 k3.1
@31 /* Look, what do you want me to say? This place is a huge mess. There's this idiot gnome who's in trouble every week, stupid adventurers are always underfoot, and they nearly burnt a drow the other day! */ 
= @32 /* So, yeah, I'm sorry. But compared to other folks, you got lucky. So take it and shut up. */
EXIT

// Suffering guard

CHAIN IF ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBGuardTalkative","GLOBAL",1)~ THEN O#HAPRI p1
@33 /* At last, some other living soul besides that blasted bard! I swear, he keeps babbling like there's no tomorrow. Can't wait till his execution. */
END
++ @34 /* Wait, what? Haer'Dalis is to be executed? */ EXTERN O#HAPRI p1.1
++ @35 /* He's a handful, isn't he? */ EXTERN O#HAPRI p1.2
+ ~Global("O#UBHaerDalisInnocent","GLOBAL",1) PartyHasItem("misc5j")~ + @36 /* Actually, he is innocent. Here is a writ from Brega. */ EXTERN O#HAPRI p4

CHAIN O#HAPRI p1.1
@37 /* In three days, haven't you heard? Or was it three days yesterday? Anyway, not long now. */
END
IF ~~ EXTERN O#HAPRI p1.3

CHAIN O#HAPRI p1.2
@38 /* You don't know half of it. Just wait until he starts reciting those long moody ballads again. */
END
IF ~~ EXTERN O#HAPRI p1.3

CHAIN O#HAPRI p1.3
@39 /* I'll breathe easier once he's executed. In all my years here, never have I guarded such a blabbermouth. */
END
++ @40 /* Can I talk to him? */ EXTERN O#HAPRI p1.5
++ @41 /* He is my companion. I would like to visit him. */ EXTERN O#HAPRI p1.5
++ @42 /* All right. I shall go. */ EXTERN O#HAPRI p1.4
+ ~Global("O#UBHaerDalisInnocent","GLOBAL",1) PartyHasItem("misc5j")~ + @43 /* Haer'Dalis is innocent. Here is a writ from Brega. */ EXTERN O#HAPRI p4

CHAIN O#HAPRI p1.4
@44 /* Wish I could go. Mystra, Llira, Waukeen, Sune, PLEASE shut him up. Please. Please? */
DO ~SetGlobal("O#UBGuardTalkative","GLOBAL",2)~
EXIT

CHAIN O#HAPRI p1.5
@45 /* No way. My ears will start bleeding again. Besides, it's forbidden, thank Llira. Chief Inspector's orders. */
END
+ ~Global("O#UBHaerDalisInnocent","GLOBAL",1) PartyHasItem("misc5j")~ + @43 /* Haer'Dalis is innocent. Here is a writ from Brega. */ EXTERN O#HAPRI p4
+ ~PartyGoldGT(99)~ + @46 /* How about a hundred gold? */ DO ~TakePartyGold(100)~ EXTERN O#HAPRI p1.6
+ ~CheckStatGT(Player1,12,CHR)~ + @47 /* If you don't let Haer'Dalis talk to me, he'll become completely insufferable. Trust me, I know. */ EXTERN O#HAPRI p1.7
++ @48 /* Then I should probably go. */ EXTERN O#HAPRI p1.4

CHAIN O#HAPRI p1.6
@49 /* Do you think money matters to me at this point? Wait, actually, it does. A hundred gold? Hand it over. */
DO ~SetGlobal("O#UBGuardTalkative","GLOBAL",3)~
= @50 /* You may pass, but I ain't seen ya. */
EXIT

CHAIN O#HAPRI p1.7
@51 /* What, even more so? Oh, gods. You may pass. */
DO ~SetGlobal("O#UBGuardTalkative","GLOBAL",3)~
EXIT

CHAIN IF ~Global("O#UBGuardTalkative","GLOBAL",2)~ THEN O#HAPRI p2
@52 /* Sneaking around, are you? Told you, you shouldn't be here. */
END
+ ~Global("O#UBHaerDalisInnocent","GLOBAL",1) PartyHasItem("misc5j")~ + @43 /* Haer'Dalis is innocent. Here is a writ from Brega. */ EXTERN O#HAPRI p4
++ @53 /* Can I talk to the prisoner? */ EXTERN O#HAPRI p1.5
++ @54 /* Yes, I'll just... sneak right by. */ EXTERN O#HAPRI p2.1
++ @55 /* Just passing by. */ EXTERN O#HAPRI p2.2

CHAIN O#HAPRI p2.1
@56 /* Ah, go ahead. I don't care. I think my ears are bleeding... */
DO ~SetGlobal("O#UBGuardTalkative","GLOBAL",3)~
EXIT

CHAIN O#HAPRI p2.2
@57 /* The exit's that way. */
EXIT

CHAIN IF ~Global("O#UBGuardTalkative","GLOBAL",3)~ THEN O#HAPRI p3
@58 /* Another hour of this, and I'm going to quit. And to the Nine Hells with the lieutenant. */
END
+ ~Global("O#UBHaerDalisInnocent","GLOBAL",1) PartyHasItem("misc5j")~ + @43 /* Haer'Dalis is innocent. Here is a writ from Brega. */ EXTERN O#HAPRI p4
++ @59 /* I should go. */ EXTERN O#HAPRI p2.2

CHAIN O#HAPRI p4
@60 /* Well, I'll be damned. All right, I'll take this. You go ahead and free him. Can't believe I'm free of his chatter at last! */
DO ~TakePartyItem("misc5j") EscapeArea()~
EXIT

// Haer'Dalis

/* Kulyok, version 25: I'm duplicating his dialogue in his P file and his normal file, since SetDialog("haerda") seems to be failing in some cases. */

// Normal file (v24 and below)

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",0)
Global("O#UBHaerDalisTalked","GLOBAL",0)~ THEN HAERDA h1
@61 /* My rescuing ravens! Have you unveiled this mystery yet? */
END
++ @62 /* Not yet, Haer'Dalis. I am sorry. */ EXTERN HAERDA h1.1
++ @63 /* I've been told you're about to be executed. */ EXTERN HAERDA h1.2

CHAIN HAERDA h1.1
@64 /* Thus do I pine and surfeit day by day. 'Twould be a fine joke to escape the likes of Duke Darkwood only to end up as a lone magpie on the gallows. */
END
IF ~~ EXTERN HAERDA h1.3

CHAIN HAERDA h1.2
@65 /* Aye, 'tis true for this bard, as it was for any other unfortunate soul in this cage. Now my turn has come, and naught but your hand, my dear raven, can avert it. */
END
IF ~~ EXTERN HAERDA h1.3

CHAIN HAERDA h1.3
@66 /* I never touched the man, but I was present in the area not long ago. One night, when I was restless and walked about, I saw a beautiful bust in the window of the Balthis estate that reminded me of my beloved Raelis, so perfect and so peerless, and I was entranced by it. */
= @67 /* I went to speak to the people of the house and asked Acton Balthis himself if I could see the lovely bust up close and marvel at it more fully... but I was turned out rather promptly. */
= @68 /* I haven't thought about the event since, but I beg you, believe that I did not murder Lord Balthis. */
END
++ @69 /* Then who did? */ EXTERN HAERDA h1.4
++ @70 /* What can I do to free you? */ EXTERN HAERDA h1.4
+ ~OR(2) !Alignment(Player1,MASK_GOOD) ReputationLT(Player1,9)~ + @71 /* Why don't we just kill the guards and escape? */ EXTERN HAERDA h1.4a
+ ~Dead("O#HAPRI")~ + @72 /* Your guard is dead. Come on, let's go! */ EXTERN HAERDA h1.4a
++ @73 /* I do not believe you. I think I'll leave you here. */ EXTERN HAERDA h1.4b

CHAIN HAERDA h1.4a
@74 /* 'Twould accomplish little, for this sparrow will be hunted by every guard in Athkatla and beyond. No, 'tis not an option I would care to take. */
END
IF ~~ EXTERN HAERDA h1.4

CHAIN HAERDA h1.4b
@75 /* And you will forever wonder. Was Haer'Dalis guilty? Did he suffer? Had I abandoned my sparrow for naught? */
== HAERDA @76 /* Think well and hard, my raven. Your time will soon run out. */
DO ~SetGlobal("O#UBHaerDalisTalked","GLOBAL",1) SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",1) AddJournalEntry(@1302,QUEST)~
EXIT

CHAIN HAERDA h1.4
@77 /* Talk to whomever 'witnessed' me at the night of the murder, my raven. 'Twas one of Balthis' men, no doubt, and he will be found at the estate in the Bridge District. */
= @78 /* Inspector Brega himself may yield more answers. But unless you hurry, this sparrow will never fly again. Hurry, my daring rescuer, or you may not find me within these dismal walls ere you return. */
DO ~SetGlobal("O#UBHaerDalisTalked","GLOBAL",1) AddJournalEntry(@1302,QUEST)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",0)
Global("O#UBHaerDalisTalked","GLOBAL",1)~ THEN HAERDA h2
@79 /* Bring your news not to me, my raven, but to the Chief Inspector. 'Tis him who holds this sparrow's life in his hands. */
END
+ ~!Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @80 /* I will, Haer'Dalis. */ EXTERN HAERDA h2.1
+ ~!Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @81 /* I have no new evidence, I'm afraid. */ EXTERN HAERDA h2.1
+ ~Global("O#UBHaerDalisPipTalk","GLOBAL",1) Global("O#UBHaerDalisPipTalkHaer","GLOBAL",0)~ + @82 /* Pip at Acton Balthis' estate accused you because he saw you with the bust of Sune. */ DO ~SetGlobal("O#UBHaerDalisPipTalkHaer","GLOBAL",1)~ EXTERN HAERDA h2.2
+ ~Global("O#UBHaerDalisBregaTalk","GLOBAL",1) Global("O#UBHaerDalisBregaTalkHaer","GLOBAL",0)~ + @83 /* Inspector Brega said you became a suspect because of your interest in the Sune statue. */ DO ~SetGlobal("O#UBHaerDalisBregaTalkHaer","GLOBAL",1)~ EXTERN HAERDA h2.2a
+ ~Dead("O#HAPRI")~ + @84 /* I have killed your guard. You are free. */ EXTERN HAERDA h2.p
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @85 /* I have changed my mind. I will help you, Haer'Dalis. */ DO ~SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",2)~ EXTERN HAERDA h2.0
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @86 /* I must go. */ EXTERN HAERDA h2.1
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",0)~ + @87 /* I think you are the murderer, and I'll let the law deal with you. */ DO ~SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",1)~ EXTERN HAERDA h2.00

CHAIN HAERDA h2.p
@88 /* No, my raven. Chaos and enthropy rule over this sparrow's destiny, but even a Doomguard knows when he is beaten. Without the Chief Inspector's verdict of innocence, even a dozen corpses at my feet would mean little. */
EXIT

CHAIN HAERDA h2.00
@89 /* What know the laws that thieves do pass on thieves? Yet this sparrow holds no demands, my raven. Aid him or not, as it pleases you. */
EXIT

CHAIN HAERDA h2.0
@90 /* 'Tis strange to hear from the lips that hastened to accuse me only moments before, but this sparrow is glad of any help. Hasten to the late Lord Balthis' estate, my raven. Fly well, and leave angry words behind. */
EXIT

CHAIN HAERDA h2.1
@91 /* Fly, then. */
EXIT

CHAIN HAERDA h2.2
@92 /* That wretch! Truly, he has no notion of beauty or artistic elegance. */
END
IF ~~ EXTERN HAERDA h2.2b

CHAIN HAERDA h2.2a
@93 /* Indeed? Well, whoever told him led the good inspector astray. */
END
IF ~~ EXTERN HAERDA h2.2b

CHAIN HAERDA h2.2b
@94 /* But he's onto something. The real culprit would want someone to take the blame... and would likely be aware of this sparrow's interest. */
= @95 /* And the only people who would even know that I asked about the statue would be Acton's servants... and, of course, that fat man with whom I discussed the statue outside. */
END
++ @96 /* 'That fat man outside?' */ EXTERN HAERDA h2.3
++ @97 /* Go on. */ EXTERN HAERDA h2.4

CHAIN HAERDA h2.3
@98 /* Oh, yes, didn't I mention that? */
END
IF ~~ EXTERN HAERDA h2.4

CHAIN HAERDA h2.4
@99 /* I do not know who the man was, but we marvelled at the wonderful artwork together. He was a collector, obviously. */
= @100 /* That is all I can tell you, my raven. I beg of you, fly swiftly, for this sparrow's time draws near. */
EXIT

// Haer'Dalis declared innocent

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",1)
Global("O#UBHaerDalisInnocentTalk","GLOBAL",0)~ THEN HAERDA h3
@101 /* At long last, my raven! I owe you more than I can ever repay. */
DO ~SetGlobal("O#UBHaerDalisInnocentTalk","GLOBAL",1)
AddJournalEntry(@1308,QUEST)
EraseJournalEntry(@1301)
EraseJournalEntry(@1302)
EraseJournalEntry(@1303)
EraseJournalEntry(@1304)
EraseJournalEntry(@1305)
EraseJournalEntry(@1306)
EraseJournalEntry(@1307)~
== HAERDA @102 /* True hope is swift, and flies with sparrow's wings;
Kings it makes gods, and meaner creatures kings. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @103 /* Well said, my friend. Freedom is yours now. */
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @104 /* You've done well, <CHARNAME>. I am proud of you. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @105 /* Minsc and Boo and Haer'Dalis and friends! Hamsters, rangers and blue-haired bards, rejoice! */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @106 /* I'm... very happy f-for you, Haer'Dalis. */
== HAERDA @107 /* Thank you, my friends. But of the true originator, the culprit, you know nothing still? */
END
+ ~Global("O#UBHaerDalisQuatarisConfessed","GLOBAL",1)~ + @108 /* No. Only that it was an illusionist who looked like you. */ EXTERN HAERDA h3.1
++ @109 /* Do you know who it was? */ EXTERN HAERDA h3.1

CHAIN HAERDA h3.1
@110 /* I have a thought, an idea both brilliant and plain. If you wish to deal with the mysterious assassin, I can put out the rumor through my sources that evidence was left behind at the estate, putting question to the idea I was the actual murderer. */
= @111 /* If we do so, I suspect our assassin will show up at his first opportunity. */
END
++ @112 /* You have sources, Haer'Dalis? */ EXTERN HAERDA h3.2
++ @113 /* It can work. */ EXTERN HAERDA h3.4
++ @114 /* He's likely already far away. */ EXTERN HAERDA h3.3

CHAIN HAERDA h3.2
@115 /* The life of an actor is full of strange turns, my raven. And makes strange bedfellows. */
END
IF ~~ EXTERN HAERDA h3.4

CHAIN HAERDA h3.3
@116 /* Aye, and the rumor will make him return. */
END
IF ~~ EXTERN HAERDA h3.4

CHAIN HAERDA h3.4
@117 /* Now, shall we travel together once more? This world's wonders are ours to behold. */
END
++ @118 /* Enter Haer'Dalis. */ DO ~ActionOverride("O#HAPRI",DestroySelf()) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
++ @119 /* Not this time. Wait for me at the Five Flagons. */ EXTERN HAERDA h3.5

CHAIN HAERDA h3.5
@120 /* So shall it be. */
DO ~ActionOverride("O#HAPRI",DestroySelf()) SetGlobal("KickedOut","LOCALS",1) MoveGlobal("AR0509","HaerDalis",[405.330])~
EXIT

// P file (v25 and above)

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",0)
Global("O#UBHaerDalisTalked","GLOBAL",0)~ THEN HAERDAP h1
@61 /* My rescuing ravens! Have you unveiled this mystery yet? */
END
++ @62 /* Not yet, Haer'Dalis. I am sorry. */ EXTERN HAERDAP h1.1
++ @63 /* I've been told you're about to be executed. */ EXTERN HAERDAP h1.2

CHAIN HAERDAP h1.1
@64 /* Thus do I pine and surfeit day by day. 'Twould be a fine joke to escape the likes of Duke Darkwood only to end up as a lone magpie on the gallows. */
END
IF ~~ EXTERN HAERDAP h1.3

CHAIN HAERDAP h1.2
@65 /* Aye, 'tis true for this bard, as it was for any other unfortunate soul in this cage. Now my turn has come, and naught but your hand, my dear raven, can avert it. */
END
IF ~~ EXTERN HAERDAP h1.3

CHAIN HAERDAP h1.3
@66 /* I never touched the man, but I was present in the area not long ago. One night, when I was restless and walked about, I saw a beautiful bust in the window of the Balthis estate that reminded me of my beloved Raelis, so perfect and so peerless, and I was entranced by it. */
= @67 /* I went to speak to the people of the house and asked Acton Balthis himself if I could see the lovely bust up close and marvel at it more fully... but I was turned out rather promptly. */
= @68 /* I haven't thought about the event since, but I beg you, believe that I did not murder Lord Balthis. */
END
++ @69 /* Then who did? */ EXTERN HAERDAP h1.4
++ @70 /* What can I do to free you? */ EXTERN HAERDAP h1.4
+ ~OR(2) !Alignment(Player1,MASK_GOOD) ReputationLT(Player1,9)~ + @71 /* Why don't we just kill the guards and escape? */ EXTERN HAERDAP h1.4a
+ ~Dead("O#HAPRI")~ + @72 /* Your guard is dead. Come on, let's go! */ EXTERN HAERDAP h1.4a
++ @73 /* I do not believe you. I think I'll leave you here. */ EXTERN HAERDAP h1.4b

CHAIN HAERDAP h1.4a
@74 /* 'Twould accomplish little, for this sparrow will be hunted by every guard in Athkatla and beyond. No, 'tis not an option I would care to take. */
END
IF ~~ EXTERN HAERDAP h1.4

CHAIN HAERDAP h1.4b
@75 /* And you will forever wonder. Was Haer'Dalis guilty? Did he suffer? Had I abandoned my sparrow for naught? */
== HAERDAP @76 /* Think well and hard, my raven. Your time will soon run out. */
DO ~SetGlobal("O#UBHaerDalisTalked","GLOBAL",1) SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",1) AddJournalEntry(@1302,QUEST)~
EXIT

CHAIN HAERDAP h1.4
@77 /* Talk to whomever 'witnessed' me at the night of the murder, my raven. 'Twas one of Balthis' men, no doubt, and he will be found at the estate in the Bridge District. */
= @78 /* Inspector Brega himself may yield more answers. But unless you hurry, this sparrow will never fly again. Hurry, my daring rescuer, or you may not find me within these dismal walls ere you return. */
DO ~SetGlobal("O#UBHaerDalisTalked","GLOBAL",1) AddJournalEntry(@1302,QUEST)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",0)
Global("O#UBHaerDalisTalked","GLOBAL",1)~ THEN HAERDAP h2
@79 /* Bring your news not to me, my raven, but to the Chief Inspector. 'Tis him who holds this sparrow's life in his hands. */
END
+ ~!Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @80 /* I will, Haer'Dalis. */ EXTERN HAERDAP h2.1
+ ~!Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @81 /* I have no new evidence, I'm afraid. */ EXTERN HAERDAP h2.1
+ ~Global("O#UBHaerDalisPipTalk","GLOBAL",1) Global("O#UBHaerDalisPipTalkHaer","GLOBAL",0)~ + @82 /* Pip at Acton Balthis' estate accused you because he saw you with the bust of Sune. */ DO ~SetGlobal("O#UBHaerDalisPipTalkHaer","GLOBAL",1)~ EXTERN HAERDAP h2.2
+ ~Global("O#UBHaerDalisBregaTalk","GLOBAL",1) Global("O#UBHaerDalisBregaTalkHaer","GLOBAL",0)~ + @83 /* Inspector Brega said you became a suspect because of your interest in the Sune statue. */ DO ~SetGlobal("O#UBHaerDalisBregaTalkHaer","GLOBAL",1)~ EXTERN HAERDAP h2.2a
+ ~Dead("O#HAPRI")~ + @84 /* I have killed your guard. You are free. */ EXTERN HAERDAP h2.p
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @85 /* I have changed my mind. I will help you, Haer'Dalis. */ DO ~SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",2)~ EXTERN HAERDAP h2.0
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",1)~ + @86 /* I must go. */ EXTERN HAERDAP h2.1
+ ~Global("O#UBHaerDalisAbandoned","GLOBAL",0)~ + @87 /* I think you are the murderer, and I'll let the law deal with you. */ DO ~SetGlobal("O#UBHaerDalisAbandoned","GLOBAL",1)~ EXTERN HAERDAP h2.00

CHAIN HAERDAP h2.p
@88 /* No, my raven. Chaos and enthropy rule over this sparrow's destiny, but even a Doomguard knows when he is beaten. Without the Chief Inspector's verdict of innocence, even a dozen corpses at my feet would mean little. */
EXIT

CHAIN HAERDAP h2.00
@89 /* What know the laws that thieves do pass on thieves? Yet this sparrow holds no demands, my raven. Aid him or not, as it pleases you. */
EXIT

CHAIN HAERDAP h2.0
@90 /* 'Tis strange to hear from the lips that hastened to accuse me only moments before, but this sparrow is glad of any help. Hasten to the late Lord Balthis' estate, my raven. Fly well, and leave angry words behind. */
EXIT

CHAIN HAERDAP h2.1
@91 /* Fly, then. */
EXIT

CHAIN HAERDAP h2.2
@92 /* That wretch! Truly, he has no notion of beauty or artistic elegance. */
END
IF ~~ EXTERN HAERDAP h2.2b

CHAIN HAERDAP h2.2a
@93 /* Indeed? Well, whoever told him led the good inspector astray. */
END
IF ~~ EXTERN HAERDAP h2.2b

CHAIN HAERDAP h2.2b
@94 /* But he's onto something. The real culprit would want someone to take the blame... and would likely be aware of this sparrow's interest. */
= @95 /* And the only people who would even know that I asked about the statue would be Acton's servants... and, of course, that fat man with whom I discussed the statue outside. */
END
++ @96 /* 'That fat man outside?' */ EXTERN HAERDAP h2.3
++ @97 /* Go on. */ EXTERN HAERDAP h2.4

CHAIN HAERDAP h2.3
@98 /* Oh, yes, didn't I mention that? */
END
IF ~~ EXTERN HAERDAP h2.4

CHAIN HAERDAP h2.4
@99 /* I do not know who the man was, but we marvelled at the wonderful artwork together. He was a collector, obviously. */
= @100 /* That is all I can tell you, my raven. I beg of you, fly swiftly, for this sparrow's time draws near. */
EXIT

// Haer'Dalis declared innocent

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisInnocent","GLOBAL",1)
Global("O#UBHaerDalisInnocentTalk","GLOBAL",0)~ THEN HAERDAP h3
@101 /* At long last, my raven! I owe you more than I can ever repay. */
DO ~SetGlobal("O#UBHaerDalisInnocentTalk","GLOBAL",1)
AddJournalEntry(@1308,QUEST)
EraseJournalEntry(@1301)
EraseJournalEntry(@1302)
EraseJournalEntry(@1303)
EraseJournalEntry(@1304)
EraseJournalEntry(@1305)
EraseJournalEntry(@1306)
EraseJournalEntry(@1307)~
== HAERDAP @102 /* True hope is swift, and flies with sparrow's wings;
Kings it makes gods, and meaner creatures kings. */
== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @103 /* Well said, my friend. Freedom is yours now. */
== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @104 /* You've done well, <CHARNAME>. I am proud of you. */
== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @105 /* Minsc and Boo and Haer'Dalis and friends! Hamsters, rangers and blue-haired bards, rejoice! */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @106 /* I'm... very happy f-for you, Haer'Dalis. */
== HAERDAP @107 /* Thank you, my friends. But of the true originator, the culprit, you know nothing still? */
END
+ ~Global("O#UBHaerDalisQuatarisConfessed","GLOBAL",1)~ + @108 /* No. Only that it was an illusionist who looked like you. */ EXTERN HAERDAP h3.1
++ @109 /* Do you know who it was? */ EXTERN HAERDAP h3.1

CHAIN HAERDAP h3.1
@110 /* I have a thought, an idea both brilliant and plain. If you wish to deal with the mysterious assassin, I can put out the rumor through my sources that evidence was left behind at the estate, putting question to the idea I was the actual murderer. */
= @111 /* If we do so, I suspect our assassin will show up at his first opportunity. */
END
++ @112 /* You have sources, Haer'Dalis? */ EXTERN HAERDAP h3.2
++ @113 /* It can work. */ EXTERN HAERDAP h3.4
++ @114 /* He's likely already far away. */ EXTERN HAERDAP h3.3

CHAIN HAERDAP h3.2
@115 /* The life of an actor is full of strange turns, my raven. And makes strange bedfellows. */
END
IF ~~ EXTERN HAERDAP h3.4

CHAIN HAERDAP h3.3
@116 /* Aye, and the rumor will make him return. */
END
IF ~~ EXTERN HAERDAP h3.4

CHAIN HAERDAP h3.4
@117 /* Now, shall we travel together once more? This world's wonders are ours to behold. */
END
++ @118 /* Enter Haer'Dalis. */ DO ~ActionOverride("O#HAPRI",DestroySelf()) SetGlobal("KickedOut","LOCALS",0) JoinParty()~ EXIT
++ @119 /* Not this time. Wait for me at the Five Flagons. */ EXTERN HAERDAP h3.5

CHAIN HAERDAP h3.5
@120 /* So shall it be. */
DO ~ActionOverride("O#HAPRI",DestroySelf()) SetGlobal("KickedOut","LOCALS",1) MoveGlobal("AR0509","HaerDalis",[405.330])~
EXIT

// Janos is dead

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisJanosReward","GLOBAL",0) Global("O#UBHaerDalisJanosSaw","GLOBAL",2)~ THEN HAERDAJ h3
@121 /* This is it, my brave ravens. To Inspector Brega we fly! */
DO ~SetGlobal("O#UBHaerDalisJanosSaw","GLOBAL",3)~
EXIT

// 3. Pip at Acton Balthis' house

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisPipTalk","GLOBAL",0)
Global("O#UBHaerDalisInnocent","GLOBAL",0)
Global("O#UBHaerDalisExecuted","GLOBAL",0)~ THEN HAPIP p1
@122 /* I am sorry, the estate is closed. We are in mourning, so whatever you're here for can wait, I'm sure. */
END
++ @123 /* Actually, my friend Haer'Dalis is about to be executed. */ EXTERN HAPIP p1.1
++ @124 /* I've been told someone witnessed the murder. */ EXTERN HAPIP p1.2

CHAIN HAPIP p1.1
@125 /* That murderer is your friend? A pity you weren't arrested together. */
END
IF ~~ EXTERN HAPIP p1.2

CHAIN HAPIP p1.2
@126 /* I've told everything to Inspector Brega. Talk to him, if you insist on knowing the details of this distressing event. I have nothing to say to the likes of you. */
END
++ @127 /* Please, Haer'Dalis is innocent! */ EXTERN HAPIP p1.3
++ @128 /* You will talk, unless you want to dangle upside down from the roof beam! */ EXTERN HAPIP p1.4
++ @129 /* Don't you want everyone to know the truth? */ EXTERN HAPIP p1.5

CHAIN HAPIP p1.3
@130 /* Did he tell you that? */
END
IF ~~ EXTERN HAPIP p1.6

CHAIN HAPIP p1.4
@131 /* T-there's no need for threats! */
END
IF ~~ EXTERN HAPIP p1.6

CHAIN HAPIP p1.5
@132 /* And by 'everyone' you mean you, I presume? Typical. But very well, you've made your point. */
END
IF ~~ EXTERN HAPIP p1.6

CHAIN HAPIP p1.6
@133 /* I saw the murderer, plain as day. I was already half-asleep, but heard a struggle in Lord Balthis' room and entered, only to find that thief standing over the corpse with his blades. */
= @134 /* Next minute he jumped out the window to escape. Well, naturally he wasn't going to stay for the guards! */ 
END
+ ~Global("O#UBHaerDalisBregaTalk","GLOBAL",1)~ + @135 /* Inspector Brega mentioned the robbery. Tell me more. */ EXTERN HAPIP p1.7
++ @136 /* You called him 'the thief', not 'the murderer'. Why? */ EXTERN HAPIP p1.7
++ @137 /* Did that thief steal anything? */ EXTERN HAPIP p1.7

CHAIN HAPIP p1.7
@138 /* Lord Balthis' invaluable bust of Sune is missing! That's how I remembered the thief: he had come asking about it only days before. */
END
++ @139 /* That would be a rather obvious thing for a thief to do, wouldn't it? */ EXTERN HAPIP p1.8
++ @140 /* What if Haer'Dalis and the man you saw were two different people? */ EXTERN HAPIP p1.8
++ @141 /* You could've been mistaken in the poor light, though. What if it wasn't Haer'Dalis? */ EXTERN HAPIP p1.8

CHAIN HAPIP p1.8
@142 /* I hadn't thought of that before... but I saw what I saw. */
END
++ @143 /* Has anyone else ever asked about that bust? */ EXTERN HAPIP p1.9
++ @144 /* Can you tell me anything else at all? */ EXTERN HAPIP p1.9

CHAIN HAPIP p1.9
@145 /* Not really... But Quataris, an art dealer and collector from the Promenade, was quite jealous that Lord Balthis outbid him to acquire the bust. That is all I can say. I suggest you leave the estate now. */
DO ~SetGlobal("O#UBHaerDalisPipTalk","GLOBAL",1) AddJournalEntry(@1303,QUEST)~
EXIT

CHAIN IF WEIGHT #-1 ~OR(3) Global("O#UBHaerDalisExecuted","GLOBAL",1) Global("O#UBHaerDalisInnocent","GLOBAL",1) Global("O#UBHaerDalisPipTalk","GLOBAL",1)~ THEN HAPIP p2
@146 /* The estate is closed. Please, leave now. */
EXIT 

// 4. Quataris the art dealer

ADD_TRANS_TRIGGER HAQUAT 2 ~False()~

EXTEND_BOTTOM HAQUAT 0
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisQuatarisTalk","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @147 /* I am here to ask you some questions about Acton Balthis' murder. */ DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",1)~ EXTERN HAQUAT q1.1
+ ~OR(2) Global("O#UBHaerDalisPipTalk","GLOBAL",1) Global("O#UBHaerDalisBregaTalk","GLOBAL",1) Global("O#UBHaerDalisQuatarisTalk","GLOBAL",1) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @148 /* What about the bust of Sune? I've heard you were very interested in it. */ DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",2)~ EXTERN HAQUAT q1.2
++ @149 /* Never mind. */ EXTERN HAQUAT q1.0
END

EXTEND_BOTTOM HAQUAT 2
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisQuatarisTalk","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @147 /* I am here to ask you some questions about Acton Balthis' murder. */ DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",1)~ EXTERN HAQUAT q1.1
+ ~OR(2) Global("O#UBHaerDalisPipTalk","GLOBAL",1) Global("O#UBHaerDalisBregaTalk","GLOBAL",1) Global("O#UBHaerDalisQuatarisTalk","GLOBAL",1) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @148 /* What about the bust of Sune? I've heard you were very interested in it. */ DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",2)~ EXTERN HAQUAT q1.2
++ @149 /* Never mind. */ EXTERN HAQUAT q1.0
END

CHAIN HAQUAT q1.0
@150 /* Of course. */
EXIT

CHAIN HAQUAT q1.1
@151 /* I am glad that the fiendish thief was brought to justice. Acton Balthis was a fine man and a great loss to the art community. Beyond that, I've little to say. */
END
+ ~OR(2) Global("O#UBHaerDalisPipTalk","GLOBAL",1) Global("O#UBHaerDalisBregaTalk","GLOBAL",1)~ + @148 /* What about the bust of Sune? I've heard you were very interested in it. */ DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",2)~ EXTERN HAQUAT q1.2
++ @152 /* I see. Thank you for your time. */ EXTERN HAQUAT q1.0
++ @153 /* That is all for now. */ EXTERN HAQUAT q1.0

CHAIN HAQUAT q1.2
@154 /* I've already been asked all about that by Inspector Brega. There's no need for me to answer your questions! Moreover, I have nothing to do with that... piece of art! */
END
+ ~Global("O#UBHaerDalisPipTalkHaer","GLOBAL",0) Global("O#UBHaerDalisBregaTalkHaer","GLOBAL",0)~ + @155 /* (bluff) Really? My friend Haer'Dalis saw you under Lord Balthis' window. */ EXTERN HAQUAT q1.3
+ ~OR(2) Global("O#UBHaerDalisPipTalkHaer","GLOBAL",1) Global("O#UBHaerDalisBregaTalkHaer","GLOBAL",1)~ + @156 /* Really? My friend Haer'Dalis saw you under Lord Balthis' window. */ EXTERN HAQUAT q1.3
+ ~Global("O#UBHaerDalisBregaTalk","GLOBAL",1)~ + @157 /* Inspector Brega says otherwise. */ EXTERN HAQUAT q1.3
+ ~Global("O#UBHaerDalisPipTalk","GLOBAL",1)~ + @158 /* Pip at Lord Balthis' estate mentioned the opposite. */ EXTERN HAQUAT q1.3

CHAIN HAQUAT q1.3
@159 /* That's enough! I won't stand here and take this! Guards! */
DO ~CreateCreatureObject("O#HABOD1",Player1,0,0,0)
CreateCreatureObject("O#HABOD2",Player1,0,0,0)
ActionOverride("bodyg2",DestroySelf())
SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",3)~
EXIT

CHAIN IF WEIGHT #-1 ~OR(2) !Dead("O#HABOD1") !Dead("O#HABOD2") Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisQuatarisTalk","GLOBAL",3)~ THEN HAQUAT q3
@160 /* Guards! GUARDS!! Protect me!! */
EXIT

CHAIN IF WEIGHT #-1 ~Dead("O#HABOD1") Dead("O#HABOD2") Global("O#UBHaerDalisArrested","GLOBAL",2)
Global("O#UBHaerDalisQuatarisTalk","GLOBAL",3)~ THEN HAQUAT q4
@161 /* Please, please don't kill me. */
END
++ @162 /* Did you hire the murderer? */ EXTERN HAQUAT q4.1
++ @163 /* Confess, and I may spare your life. */ EXTERN HAQUAT q4.1

CHAIN HAQUAT q4.1
@164 /* Please, just let me speak! I will tell you everything you need to know. */
== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @165 /* Who needs this worthless confession! This man trades in rare scrolls, forgotten relics, Netheril artifacts! Seize them instead, you stupid monkey! (I can't believe I have to work with this.) */
== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @166 /* Feh, he is cowering like a slithering worm. Just end his misery now, abbil. */
== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @167 /* Truly, a gross injustice has been committed. I admire you for bringing this coward to justice, my friend. */
== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @168 /* You'd b-better! Haer'Dalis nearly died because of you! */
== HAQUAT @169 /* Yes, I wanted that bust of Sune. 'Twas a marvel to behold indeed, her marble so smooth, her face so vibrant... */
= @170 /* I hired a local freelancer, Janos, to steal it. He is a master of illusions, so the... matter should have proceeded flawlessly. But something must have gone wrong... */
END
++ @171 /* Sign this confession and I'll let you go. */ EXTERN HAQUAT q4.2
++ @172 /* Now put all of this in writing. */ EXTERN HAQUAT q4.2

CHAIN HAQUAT q4.2
@173 /* Just... let me take a piece of parchment. If only my hands weren't shaking so much... */
DO ~SetGlobal("O#UBHaerDalisQuatarisConfessed","GLOBAL",1) GiveItemCreate("misc6f",Player1,1,0,0) GiveItem("misc6g",Player1) AddExperienceParty(15500) AddJournalEntry(@1305,QUEST)~
== HAQUAT @174 /* Here is my confession, and here is the bust of Sune, as well. Please do not kill me! */
END
++ @175 /* I won't. But you almost cost my friend his life. */ EXTERN HAQUAT q4.3
++ @176 /* The guards will come for you soon enough. */ EXTERN HAQUAT q4.3
++ @177 /* Too bad. Prepare to die! */ EXTERN HAQUAT q4.4

CHAIN HAQUAT q4.3
@178 /* I suppose they will throw me in your friend's cell now. Isn't that punishment enough? */
DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",5) EscapeArea()~
EXIT

CHAIN HAQUAT q4.4
@179 /* No! Someone, help!! */
DO ~SetGlobal("O#UBHaerDalisQuatarisTalk","GLOBAL",5) EscapeArea()~
EXIT

// 5. Inspector Brega

EXTEND_TOP HABREGA 0 #1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) !PartyHasItem("misc6g") !PartyHasItem("misc6f") Global("O#UBHaerDalisBregaTalk","GLOBAL",0)~ + @180 /* I would like to know why my friend Haer'Dalis got arrested. */ DO ~SetGlobal("O#UBHaerDalisBregaTalk","GLOBAL",1) AddJournalEntry(@1304,QUEST)~ EXTERN HABREGA h1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) PartyHasItem("misc6g") PartyHasItem("misc6f") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @181 /* Here is the stolen bust of Sune and Quataris' written confession. I want Haer'Dalis freed. */ DO ~TakePartyItem("misc6f") TakePartyItem("misc6g") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) PartyHasItem("misc6f") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @182 /* Here is Quataris' written confession. I want Haer'Dalis freed. */ DO ~TakePartyItem("misc6f") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) !PartyHasItem("misc6f") PartyHasItem("misc6g") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @183 /* Here is the stolen bust of Sune. Quataris the art dealer was behind it. */ DO ~TakePartyItem("misc6g") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.2
+ ~Dead("O#HAJAN") Global("O#UBHaerDalisJanosReward","GLOBAL",0)~ + @184 /* I killed the real thief, Janos.  */ DO ~SetGlobal("O#UBHaerDalisJanosReward","GLOBAL",1) EraseJournalEntry(@1308) AddJournalEntry(@1309,QUEST_DONE)~ EXTERN HABREGA h3
END

EXTEND_TOP HABREGA 1 #1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) !PartyHasItem("misc6g") !PartyHasItem("misc6f") Global("O#UBHaerDalisBregaTalk","GLOBAL",0)~ + @180 /* I would like to know why my friend Haer'Dalis got arrested. */ DO ~SetGlobal("O#UBHaerDalisBregaTalk","GLOBAL",1) AddJournalEntry(@1304,QUEST)~ EXTERN HABREGA h1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) PartyHasItem("misc6g") PartyHasItem("misc6f") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @181 /* Here is the stolen bust of Sune and Quataris' written confession. I want Haer'Dalis freed. */ DO ~TakePartyItem("misc6f") TakePartyItem("misc6g") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) PartyHasItem("misc6f") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @182 /* Here is Quataris' written confession. I want Haer'Dalis freed. */ DO ~TakePartyItem("misc6f") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) !PartyHasItem("misc6f") PartyHasItem("misc6g") Global("O#UBHaerDalisInnocent","GLOBAL",0)~ + @183 /* Here is the stolen bust of Sune. Quataris the art dealer was behind it. */ DO ~TakePartyItem("misc6g") SetGlobal("O#UBHaerDalisInnocent","GLOBAL",1) AddJournalEntry(@1307,QUEST)~ EXTERN HABREGA h2.2
+ ~Dead("O#HAJAN") Global("O#UBHaerDalisJanosReward","GLOBAL",0)~ + @184 /* I killed the real thief, Janos.  */ DO ~SetGlobal("O#UBHaerDalisJanosReward","GLOBAL",1) AddJournalEntry(@1309,QUEST_DONE)~ EXTERN HABREGA h3
END

CHAIN HABREGA h1
@185 /* Your friend Haer'Dalis was witnessed killing Acton Balthis. I won't say by whom, but we have ascertained the witness isn't lying. */
= @186 /* The intent of the murderer was originally robbery, and a valuable item, a bust of Sune, was taken from the estate. Haer'Dalis made certain admissions regarding it that made the connection obvious. */
END
+ ~Global("O#UBHaerDalisPipTalk","GLOBAL",1)~ + @187 /* Pip, Lord Balthis' manservant, said as much. Have you recovered the bust? */ DO ~SetGlobal("O#UBHaerDalisToldBregaPip","GLOBAL",1)~ EXTERN HABREGA h1.2
++ @188 /* I see. Where could this bust be now? */ EXTERN HABREGA h1.2
++ @189 /* He admired a statue, and he's to be executed for that alone? Very clever. */ EXTERN HABREGA h1.1
+ ~Global("O#UBHaerDalisPipTalk","GLOBAL",0)~ + @190 /* Has this bust been found? */ EXTERN HABREGA h1.2

CHAIN HABREGA h1.1
@191 /* There were other clues, as I said. You are not doing your friend a service with this tone. */
END
IF ~~ EXTERN HABREGA h1.2

CHAIN HABREGA h1.2
@192 /* The bust of Sune hasn't been recovered, but Haer'Dalis would have likely sold it to one of two places: Quataris the art-dealer or the Shadow Thieves. */
END
++ @193 /* Really. The Shadow Thieves, you say. Who are obviously not guilty of anything. */ EXTERN HABREGA h1.2a
++ @194 /* Maybe this Quataris is involved in Lord Balthis' murder? */ EXTERN HABREGA h1.2b
++ @195 /* Who do you think the thief sold it to? */ EXTERN HABREGA h1.2a

CHAIN HABREGA h1.2a
@196 /* The Shadow Thieves would not dare steal from the Vice-Regent. As for Quataris, he says he has done nothing of the sort. */
END
IF ~~ EXTERN HABREGA h1.2b

CHAIN HABREGA h1.2b
@197 /* I cannot ascertain whether he is lying, for traders of his caliber are often protected by amulets and talismans against magical scrying. */
== HABREGA @198 /* Perhaps you should talk to Quataris yourself. His shop is set in the Promenade. */
END
IF ~~ EXTERN HABREGA h1.2d
IF ~!Global("O#UBHaerDalisToldBregaPip","GLOBAL",1)~ EXTERN HABREGA h1.2c

CHAIN HABREGA h1.2c
@199 /* Or visit Lord Balthis' estate in the Bridge District, if you haven't been there already. */
END
IF ~~ EXTERN HABREGA h1.2d

CHAIN HABREGA h1.2d
@200 /* You have little time. The law is the law: your friend Haer'Dalis is due to be executed in three days, no ifs, ands or buts. If you wish to prove his innocence, you should make haste. */
EXIT

CHAIN HABREGA h2.1
@201 /* This is... quite remarkable. You've done a thorough job indeed. */
END
IF ~~ EXTERN HABREGA h2.3

CHAIN HABREGA h2.2
@202 /* While that's not exactly what I was looking for, it certainly sheds some doubt on the matter. */
END
IF ~~ EXTERN HABREGA h2.3

CHAIN HABREGA h2.3
@203 /* I thank you for your resourcefulness. Here is the writ of innocence for your friend. You will need this to free him from the city jail. */
DO ~GiveItemCreate("misc5j",Player1,1,0,0) AddExperienceParty(45000)~
== HABREGA @204 /* Go with my thanks and heartfelt apologies. And remember: should the real culprit be found, there will be a decent reward. */
EXIT

CHAIN HABREGA h3
@205 /* I have already been told by the Bridge District's guards. Again, you have my thanks and the thanks of the city. */
DO ~GiveGoldForce(2000) AddExperienceParty(15500)~
EXIT

// Lieutenant Aegisfield

EXTEND_BOTTOM INSPECT 15
+ ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ + @206 /* What do you know of Lord Balthis' murder? */ EXTERN INSPECT i1
END

CHAIN INSPECT i1
@207 /* Not much. Chief Inspector Brega took over the witnesses. The culprit was a thief, as well, and stole something very valuable from the estate. */
DO ~SetGlobal("O#UBAegisFieldHaerDalisTalked","GLOBAL",1)~
== INSPECT @208 /* The Chief Inspector will probably tell you more. Or you could talk to Pip, Lord Acton's manservant. */
EXIT

I_C_T INSPECT 43 o#ubactonkilledaegis1
== INSPECT IF ~Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBAegisFieldHaerDalisTalked","GLOBAL",0)~ THEN @209 /* You might be interested in helping out with Lord Balthis' murder, as well. Talk to his manservant, Pip, if you haven't already. I am sure Chief Inspector Brega will appreciate your assistance. */
END

// Samuel in the Five Flagons

I_C_T HAERDAJ 73 o#ubsamuelhaerdalisfree1
== FFBART IF ~Global("O#UBHaerDalisInnocent","GLOBAL",1)~ THEN @210 /* Good to hear that <CHARNAME> sorted out that nasty business with Lord Balthis' murder! We were mighty worried. Who would have thought they'd suspect you, aye? */ 
END

EXTEND_TOP FFBART 0 #1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisSamuelTalk","GLOBAL",0)~ + @211 /* Do you know anything about Lord Balthis' murder? */ DO ~SetGlobal("O#UBHaerDalisSamuelTalk","GLOBAL",1)~ EXTERN FFBART f1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",1) Global("O#UBHaerDalisSamuelTalk","GLOBAL",0)~ + @211 /* Do you know anything about Lord Balthis' murder? */ DO ~SetGlobal("O#UBHaerDalisSamuelTalk","GLOBAL",1)~ EXTERN FFBART f2
END

EXTEND_TOP FFBART 8 #1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0) Global("O#UBHaerDalisSamuelTalk","GLOBAL",0)~ + @211 /* Do you know anything about Lord Balthis' murder? */ DO ~SetGlobal("O#UBHaerDalisSamuelTalk","GLOBAL",1)~ EXTERN FFBART f1
+ ~Global("O#UBHaerDalisExecuted","GLOBAL",1) Global("O#UBHaerDalisSamuelTalk","GLOBAL",0)~ + @211 /* Do you know anything about Lord Balthis' murder? */ DO ~SetGlobal("O#UBHaerDalisSamuelTalk","GLOBAL",1)~ EXTERN FFBART f2
END

CHAIN FFBART f1
@212 /* Not a thing. Word is, the Chief Inspector himself is questioning the witnesses, and he is holding his cards close. We are all worried about poor Haer'Dalis. */
END
COPY_TRANS FFBART 2

CHAIN FFBART f2
@213 /* You seem to know better than I. Poor Haer'Dalis has been executed, and the real murderer is still on the loose. I've little else to say. */
END
COPY_TRANS FFBART 2

// Citizens of the Bridge District

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisBMTOWN1","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0)~ THEN BMTOWN1 b1
@214 /* Heard from a cousin in the guards they've solved Lord Acton's murder. Grabbed some bard or other and put him behind the bars. Aye, good for 'em, I say. */
DO ~SetGlobal("O#UBHaerDalisBMTOWN1","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisBFTOWN1","GLOBAL",0) Global("O#UBHaerDalisArrested","GLOBAL",2) Global("O#UBHaerDalisInnocent","GLOBAL",0)~ THEN BFTOWN1 b1
@215 /* I'm so glad they've arrested Lord Acton's killer! That bard always seemed a weird sort to me. */
DO ~SetGlobal("O#UBHaerDalisBFTOWN1","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisBMTOWN11","GLOBAL",0) Global("O#UBHaerDalisInnocent","GLOBAL",1) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ THEN BMTOWN1 b11
@216 /* That bard was innocent, was he? I ain't believin' that. This foreign folk is always up t' somethin'. */
DO ~SetGlobal("O#UBHaerDalisBMTOWN11","GLOBAL",1)~
EXIT

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisBFTOWN11","GLOBAL",0) Global("O#UBHaerDalisInnocent","GLOBAL",1) Global("O#UBHaerDalisExecuted","GLOBAL",0)~ THEN BFTOWN1 b11
@217 /* That bard was released? Hmph. Well I never! */
DO ~SetGlobal("O#UBHaerDalisBFTOWN11","GLOBAL",1)~
EXIT

// 6. Janos, the real killer

CHAIN IF WEIGHT #-1 ~Global("O#UBHaerDalisInnocentBadGuy","GLOBAL",1)~ THEN O#HAJAN j1
@218 /* You! The one who's gotten the bard out of jail! You really shouldn't have done that! */
END
IF ~~ EXTERN O#HAJAN j1.1
IF ~InParty("HaerDalis")~ EXTERN O#HAJAN j1.2

CHAIN O#HAJAN j1.1
@219 /* I'd taken his face, and today I would take your life! Now the real fun begins! */
DO ~SetGlobal("O#UBHaerDalisInnocentBadGuy","GLOBAL",2) Enemy()~
EXIT

CHAIN O#HAJAN j1.2
@220 /* And you have brought the bard with you. Too bad for you, I say! */
END
IF ~~ DO ~SetGlobal("O#UBHaerDalisJanosSaw","GLOBAL",1)~ EXTERN O#HAJAN j1.1
