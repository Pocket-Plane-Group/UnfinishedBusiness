// Add where is Perth dialogue to

ADD_TRANS_TRIGGER TRINNK01 1 
++ ~Have you noticed a druid named Perth around here?~ + GennaTalk

ADD_TRANS_TRIGGER TRINNK01 10
++ ~Have you noticed a druid named Perth around here?~ + GennaTalk

ADD_TRANS_TRIGGER TRINNK01 11
++ ~Have you noticed a druid named Perth around here?~ + GennaTalk

APPEND TRINNK01

IF ~~ GennaTalk
SAY ~You won't likely find a druid here in my inn. I don't need the trouble.~
= ~But I do remember Genna mentioning a fellow named Perth. She's been waiting for her supplies to arrive, so you'd likely find her near the gate.~
  IF ~~ THEN REPLY #44292 /* ~What do you know about what's going on here?~ */ GOTO 2
  IF ~Global("geniesgone","GLOBAL",0)~ THEN REPLY #44293 /* ~Do you have any supplies for sale?~ */ GOTO 7
  IF ~Global("geniesgone","GLOBAL",1)~ THEN REPLY #44294 /* ~Do you have any supplies for sale?~ */ GOTO 11
  IF ~~ THEN REPLY #44295 /* ~I'd like to see your services, please.~ */ GOTO 12
  IF ~~ THEN REPLY #44296 /* ~I'll be on my way.~ */ GOTO 13
END


END


BEGIN ~WWGEN~

// 1605, 770 = 1901 Perth in Druid Grove
// 1030, 848 = 2008 Merchant Genna in Temple of Waukeen

// Druids and Djinn solved
IF ~Dead("cefald01")
	Global("geniesgone","GLOBAL",1)~ THEN 1a
SAY ~By Waukeen! Your timing couldn't be better. Not too long ago you would have been assaulted by foul Calamshite thieves and animals gone mad!~
= ~The ones hardest hit have been us honest merchants. My supplies still haven't come in, though our troubles are over.~
   + ~G("WWBooGone",1)~ + ~I'd like to ask you some questions.~ + 2
   ++ ~Oops. Bye.~ + 6
END

// Druids unsolved, Djinn doesn't matter
IF ~!Dead("cefald01")~ THEN 1b
SAY ~By Waukeen! How ever did you get past those mad animals? My supplies have all but dried up because nobody can get through to Trademeet!~
   + ~G("WWBooGone",1)~ + ~I'd like to ask you some questions.~ + 2
   ++ ~Oops. Bye.~ + 6
END

// Druids solved, Djinn doesn't matter
IF ~Dead("cefald01")~ THEN 1c
SAY ~By Waukeen! You're wasting your time if you want to look at my wares. My supplies still haven't come in even though those wild animals have stopped guarding the city gates.~
   + ~G("WWBooGone",1)~ + ~I'd like to ask you some questions.~ + 2
   ++ ~Oops. Bye.~ + 6
END


IF ~~ 2
SAY ~What did you want to know?~
   ++ ~Have you noticed a druid around, possibly carrying a hamster? His name is Perth.~ + 3
   ++ ~Never mind.~ + 6
   + ~!Dead("cefald01")~ + ~What's going on with the animals outside the gates?~ + 2a
   + ~!Global("geniesgone","GLOBAL",1)~ + ~Who are the strange merchants in the coloured tents outside town?~ + 2a
END

IF ~~ 2a
SAY ~I don't know much about them - only that they're stopping us honest merchants from getting our rightful supplies! What would Waukeen think, I ask you?~
   ++ ~Have you noticed a druid around, possibly carrying a hamster? His name is Perth.~ + 3
   ++ ~Never mind.~ + 6
END

IF ~~ 3
SAY ~That druid was an absolute fool! We were having enough troubles with his kind, cursing the animals to attack us and what-not.~
= ~Suddenly he comes, strolling up to the gates in broad daylight, brandishing a *hamster* at us, expecting to be welcomed!~
= ~Well the guards gave him a smart rap with the quarterstaff. I last saw him running for the hills. Probably making straight for that grove of theirs.~
= ~Say.. you're not a druid are you? You're looking quite scruffy... like their lot.~
   + ~Class(Player1,DRUID)~ + ~I am a druid, although I can assure you that the balance dictates that I cause no harm here. There has been chaos enough.~ + 4
   + ~!Class(Player1,DRUID)~ ~You're mistaken. I'm not a druid.~ + 5
   ++ ~It's none of your business, but thanks for the information.~ + 5
   + ~G("loganjob2",2)~ + ~I'll have you know that I'm a hero of Trademeet!~ + 8
END

IF ~~ 4
SAY ~Well, just watch out. If the guards catch a sniff of trouble out of you, you'll be thrown out of the city or thrown into jail. Don't know which is worse really.~
   ++ ~Where is this grove you mentioned?~ + 7
END

IF ~~ 5 
SAY ~Hmph. Well, be careful. Strangers aren't too welcome around here. What's the world come to when you don't welcome a new customer? Trademeet'll never be the same again after this.~
   ++ ~Where is this grove you mentioned?~ + 7
END

IF ~~ 6
SAY ~Good day to you.~
END

IF ~~ 7
SAY ~Off for a friendly visit, like? Well, I'll mark it on your map, though I don't expect you'll get a warm welcome.~)
   ++ ~Thank you for your help.~ THEN DO ~RevealAreaOnMap("ar1900")~ + 6
   ++ ~Oh, I'm sure I'll make it nice and hot for them. Thanks.~ THEN DO ~RevealAreaOnMap("ar1900")~ + 6
END

IF ~~ 8
SAY ~Hero, eh? Well I'm too busy chasing up my supplies to worry about heros.~
   ++ ~Where is this grove you mentioned?~ + 7
END



1. Perth: Why are you disturbing me?
	++ I believe you have something that belongs to us. ->2
	++ Hand over the hamster, or you're dead meat! ->3

2. Perth: What possessions I have are all my own. I do not brook with accusations.

3. Perth: Hamster? Oh, the hamster! A nice little fellow.
