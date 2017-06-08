// Aerie and Jan banter about Jan's great-grandfather slaying a dragon

ADD_STATE_TRIGGER BAERIE 44 ~InParty("Jan") See("Jan") !StateCheck("Jan",CD_STATE_NOTVALID) Global("CDAerieJanBanter","LOCALS",0)~
ADD_TRANS_ACTION BAERIE BEGIN 44 END BEGIN END ~SetGlobal("CDAerieJanBanter","LOCALS",1)~


// Aerie and Minsc talk about the forest

ADD_STATE_TRIGGER BAERIE 76 ~InParty("Minsc") See("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID) Global("CDAerieMinscBanter","LOCALS",0) AreaType(FOREST)~
ADD_TRANS_ACTION BAERIE BEGIN 76 END BEGIN END ~SetGlobal("CDAerieMinscBanter","LOCALS",1)~


// Haer'Dalis and Mazzy have a brief aside

ADD_STATE_TRIGGER BHAERDA 2 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) Global("CDHaerdalisMazzyBanter","LOCALS",0)~
ADD_TRANS_ACTION BHAERDA BEGIN 2 END BEGIN END ~SetGlobal("CDHaerdalisMazzyBanter","LOCALS",1)~


// Valygar and Korgan discuss dwarves

ADD_STATE_TRIGGER BVALYGA 65 ~InParty("Korgan") See("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID) Global("CDValygarKorganBanter","LOCALS",0)~
ADD_TRANS_ACTION BVALYGA BEGIN 65 END BEGIN END ~SetGlobal("CDValygarKorganBanter","LOCALS",1)~


// Viconia packs four taunts in two lines with Mazzy

ADD_STATE_TRIGGER BVICONI 7 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) Global("CDViconiaMazzyBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 7 END BEGIN END ~SetGlobal("CDViconiaMazzyBanter","LOCALS",1)~


// Viconia doesn't trust Yoshimo

ADD_STATE_TRIGGER BVICONI 8 ~InParty("Yoshimo") See("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID) Global("CDViconiaYoshimoBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 8 END BEGIN END ~SetGlobal("CDViconiaYoshimoBanter","LOCALS",1)~


// Viconia and Jan briefly exchange barbs

ADD_STATE_TRIGGER BVICONI 24 ~InParty("Jan") See("Jan") !StateCheck("Jan",CD_STATE_NOTVALID) Global("CDViconiaJanBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 24 END BEGIN END ~SetGlobal("CDViconiaJanBanter","LOCALS",1)~


// Yoshimo praises Boo's battle prowess

REPLACE_STATE_TRIGGER BYOSHIM 71 ~InParty("Minsc") See("Minsc") HPLT("Minsc",20) !StateCheck("Minsc",CD_STATE_NOTVALID) CombatCounter(0) Global("BYoshimo13","LOCALS",1)~ // triggers present, but commented out and false'd


// Boo--certainly not Minsc!--was scared about losing Mazzy

ADD_STATE_TRIGGER BMINSC 30 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID) Global("CDMinscMazzyBanter","LOCALS",2)~
ADD_TRANS_ACTION BMINSC BEGIN 30 END BEGIN END ~SetGlobal("CDMinscMazzyBanter","LOCALS",3)~


// Yoshimo is happy to see Aerie's return

ADD_STATE_TRIGGER BYOSHIM 0 ~InParty("Aerie") See("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID) Global("CDYoshimoAerieBanter","LOCALS",2)~
ADD_TRANS_ACTION BYOSHIM BEGIN 0 END BEGIN END ~SetGlobal("CDYoshimoAerieBanter","LOCALS",3)~


