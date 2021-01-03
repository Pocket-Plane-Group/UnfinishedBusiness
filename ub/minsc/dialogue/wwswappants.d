// Replace all !IsValidForPartyDialog(ue) occurences with !Pants
// This means that the replacement of IsValidForPartyDialog occurences
// in wwinterj.d (next file to be compiled) will not interfere with 
// the negative triggers. Thanks Sim, jcompton.

REPLACE_TRIGGER_TEXT RADEEL
~InParty("Minsc")~
~InParty("Minsc")
PartyHasItem("Misc84")
~

REPLACE_TRIGGER_TEXT GCHILD02
~See("Minsc")~
~See("Minsc")
PartyHasItem("Misc84")~

REPLACE_TRIGGER_TEXT ISHADMT1
~!IsValidForPartyDialogue("MINSC")~
~!Pants~

REPLACE_TRIGGER_TEXT ARAN
~!IsValidForPartyDialogue("MINSC")~
~!Pants~

REPLACE_TRIGGER_TEXT DCLERIC
~!IsValidForPartyDialogue("MINSC")~
~!Pants~

REPLACE_TRIGGER_TEXT Edwin
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Neb
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Viconi
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Anomenj
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Naliaj
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT AERIEJ
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT AERIEJ
~!IsValidForPartyDialogue("MINSC")~
~!Pants~

REPLACE_TRIGGER_TEXT CIRCG1
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Delon
~!InParty("Minsc")~
~!Pirate~

REPLACE_TRIGGER_TEXT Delon
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT Hendak
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT NALIA
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT RAELIS
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT TOLGER
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT VALYGAR
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT BODHI
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT GAAL
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT LYROS
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT TIRDIR
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT ELGEA
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT WELTHER
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT DRUSH
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT GPHIL01
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT UHMAY01
~!IsValidForPartyDialog("Minsc")~
~!Pants~

REPLACE_TRIGGER_TEXT FIRKRA01
~!IsValidForPartyDialog("Minsc")~
~!Pants~

