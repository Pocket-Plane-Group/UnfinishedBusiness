#!/bin/bash

# /* this initializes the values for the different variables referenced in compatible_games */
bash "../ModPackaging/utilities/ie_games.sh"

# /* MODIFY: set the values of the 3 variables below to reflect the current mod version */
export mod_name="Unfinished Business"
export mod_version="v26"
export mod_folder="ub"

# /* MODIFY: list here which IE games the mod is compatible with, from this list of possibilities: */
# /* ${bg1}, ${bg2}, ${bgt}, ${tutu}, ${bgee}, ${bgiiee}, ${iwd1}, ${iwdee}, ${iwd2}, ${iwd2ee}, ${iwd-in-bg2}, ${pst}, ${pstee}, ${eet} */
export compatible_games="${bg2}, ${bgt}, ${bgiiee} or ${eet}"

# /* MODIFY: these variables have sensible default values but they may need to be tweaked to match your particular mod */
# /* the ico_folder is where your .ico files are stored, which is usually the mod's backup or style folder */
# /* the audio_folder is where your sox and oggdec.exe utilities are stored (leave alone if you have no audio) */
# /* the tispack_folder is the root directory that contains the win32, osx, and unix subfolders where your tisunpack utilities are stored (leave alone if you have no tilesets)  */
# /* the iconv_folder is where your iconv.exe utility is stored (leave alone if you are not converting charsets for BGEE) */
# /* the mod_readme link should point to the online readme and work fine as-is if the mod uses the standard G3 naming scheme */
export ico_folder="${mod_folder}/style"
export audio_folder="${mod_folder}/audio"
export tispack_folder="${mod_folder}/tiz"
export iconv_folder="${mod_folder}/languages/iconv"
export mod_readme="http://www.gibberlings3.net/readmes/readme-${mod_folder}.html"

# /* MODIFY: if you don't need to build a specific package, you can disable it by setting the appropriate variable below to 0 */
export build_windows=1
export build_osx=1
export build_linux=1

# /* MODIFY: if you want to avoid making filenames lowercase, you can disable that by setting the variable below to 0 */
export lowercase_filenames=0

# /* this performs the actual packaging */
bash "../ModPackaging/utilities/complete_packaging.sh"


