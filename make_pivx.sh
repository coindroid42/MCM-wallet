#Переиvеноdал файлы и папки два  раза 
#переименовал раммаджем содержимое

#!/usr/local/bin/bash

COIN_NAME="Latinio"
COIN_SOURCE_NAME="PIVX"
ALGO="QUARK"
TIKER="LTN"
WEBSITE="www.sovranocoin.com"
# APP_ICON="./TEST/HILUX.png"
# ASSETS="./TEST"



COLOR_HEX="#dc8e09"


DATE=$(date '+%d/%m/%Y %H:%M:%S');
TIME=$(date +%s) 

COIN_FULLNAME_LOWERCASE=${COIN_NAME,,}
COIN_FULLNAME_UPPERCASE=${COIN_NAME^^}
COIN_NAME_FIRST_CHAR_UPPERCASE=${COIN_FULLNAME_UPPERCASE:0:1}${COIN_FULLNAME_LOWERCASE:1}

COIN_SOURCE_FULLNAME_LOWERCASE=${COIN_SOURCE_NAME,,}
COIN_SOURCE_FULLNAME_UPPERCASE=${COIN_SOURCE_NAME^^}
COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE=${COIN_SOURCE_FULLNAME_UPPERCASE:0:1}${COIN_SOURCE_FULLNAME_LOWERCASE:1}

APP_ICON="${PWD}/icons/${COIN_FULLNAME_LOWERCASE}/app_icon.png"
APP_ICON_WHITE="${PWD}/icons/${COIN_FULLNAME_LOWERCASE}/white.png"
APP_LAUNCH="${PWD}/icons/${COIN_FULLNAME_LOWERCASE}/launch.png"
######################### COLORS
HRED=${COLOR_HEX:1:2}
HGREEN=${COLOR_HEX:3:2}
HBLUE=${COLOR_HEX:5:2}
DRED=$((16#$HRED))
DGREEN=$((16#$HGREEN))
DBLUE=$((16#$HBLUE))
RED=$(bc -q <<< "scale=15; $DRED/255" | sed 's/^\./0./')
GREEN=$(bc -q <<< "scale=15; $DGREEN/255" | sed 's/^\./0./')
BLUE=$(bc -q <<< "scale=15; $DBLUE/255" | sed 's/^\./0./')

################################


if [ "$GREEN" == "0" ]; then
	GREEN="0.0"
fi

if [ "$RED" == "0" ]; then
	RED="0.0"
fi

if [ "$BLUE" == "0" ]; then
	BLUE="0.0"
fi


WALLET_PATH=$PWD/wallets/$COIN_NAME

rm -rf $WALLET_PATH
cp -R $PWD"/sources/"$COIN_SOURCE_NAME"_"$ALGO"/" $WALLET_PATH



cd $WALLET_PATH

########## ICONS #####################################################
APP_IMAGES="${WALLET_PATH}/${COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE}Wallet/Images.xcassets"
APP_ICON_PATH="${APP_IMAGES}/AppIcon.appiconset"
APP_ICON_PATH_TESTNET="${APP_IMAGES}/AppIcon.testnet.appiconset"
WALLET_IMAGES="${WALLET_PATH}/${COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE}Wallet/${COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE}Assets.xcassets"

rm -rf $APP_ICON_PATH/*.png
rm -rf $APP_ICON_PATH_TESTNET/*.png



#PivxWallet/Images.xcassets/AppIcon.appiconset/*.png
mkdir -p $APP_ICON_PATH
mkdir -p $APP_ICON_PATH_TESTNET

# MAINNET
convert $APP_ICON -resize $((40)) $APP_ICON_PATH/Icon-App-40x40@2x.png
convert $APP_ICON -resize $((60)) $APP_ICON_PATH/Icon-App-40x40@3x.png
convert $APP_ICON -resize $((58)) $APP_ICON_PATH/Icon-App-29x29@2x.png
convert $APP_ICON -resize $((87)) $APP_ICON_PATH/Icon-App-29x29@3x.png
convert $APP_ICON -resize $((80)) $APP_ICON_PATH/Icon-App-40x40@2x-1.png
convert $APP_ICON -resize $((120)) $APP_ICON_PATH/Icon-App-40x40@3x-1.png
convert $APP_ICON -resize $((120)) $APP_ICON_PATH/Icon-App-60x60@2x.png!
convert $APP_ICON -resize $((180)) $APP_ICON_PATH/Icon-App-60x60@3x.png!
convert $APP_ICON -resize $((20)) $APP_ICON_PATH/pivx-20.png
convert $APP_ICON -resize $((40)) $APP_ICON_PATH/pivx-20@x2.png
convert $APP_ICON -resize $((29)) $APP_ICON_PATH/pivx-29.png
convert $APP_ICON -resize $((58)) $APP_ICON_PATH/pivx-29@x2.png
convert $APP_ICON -resize $((40)) $APP_ICON_PATH/pivx-40.png
convert $APP_ICON -resize $((80)) $APP_ICON_PATH/pivx-40@x2.png
convert $APP_ICON -resize $((76)) $APP_ICON_PATH/pivx-76.png
convert $APP_ICON -resize $((2*76)) $APP_ICON_PATH/pivx-76@x2.png
convert $APP_ICON -resize $((167)) $APP_ICON_PATH/pivx-83-5@x2.png
convert $APP_ICON -resize $((1024)) $APP_ICON_PATH/icon1024.png

#TESTNET
convert $APP_ICON -negate -resize $((40)) $APP_ICON_PATH_TESTNET/Icon-20@2x.png
convert $APP_ICON -negate -resize $((60)) $APP_ICON_PATH_TESTNET/Icon-20@3x.png
convert $APP_ICON -negate -resize $((58)) $APP_ICON_PATH_TESTNET/Icon-29@2x.png
convert $APP_ICON -negate -resize $((87)) $APP_ICON_PATH_TESTNET/Icon-29@3x.png
convert $APP_ICON -negate -resize $((80)) $APP_ICON_PATH_TESTNET/Icon-40@2x.png
convert $APP_ICON -negate -resize $((120)) $APP_ICON_PATH_TESTNET/Icon-40@3x.png
convert $APP_ICON -negate -resize $((120)) $APP_ICON_PATH_TESTNET/Icon-60@2x.png!
convert $APP_ICON -negate -resize $((180)) $APP_ICON_PATH_TESTNET/Icon-60@3x.png!
convert $APP_ICON -negate -resize $((20)) $APP_ICON_PATH_TESTNET/pivx-20.png
convert $APP_ICON -negate -resize $((40)) $APP_ICON_PATH_TESTNET/pivx-20@x2.png
convert $APP_ICON -negate -resize $((29)) $APP_ICON_PATH_TESTNET/pivx-29.png
convert $APP_ICON -negate -resize $((58)) $APP_ICON_PATH_TESTNET/pivx-29@x2.png
convert $APP_ICON -negate -resize $((40)) $APP_ICON_PATH_TESTNET/pivx-40.png
convert $APP_ICON -negate -resize $((80)) $APP_ICON_PATH_TESTNET/pivx-40@x2.png
convert $APP_ICON -negate -resize $((76)) $APP_ICON_PATH_TESTNET/pivx-76.png
convert $APP_ICON -negate -resize $((2*76)) $APP_ICON_PATH_TESTNET/pivx-76@x2.png
convert $APP_ICON -negate -resize $((167)) $APP_ICON_PATH_TESTNET/pivx-83-5@x2.png
convert $APP_ICON -negate -resize $((1024)) $APP_ICON_PATH_TESTNET/iTunesArtwork@2x.png
#######################################################################################

#IMG NAV LOGO
rm -rf $WALLET_IMAGES/imgNavLogo.imageset/*.png
convert $APP_ICON  -resize $((90)) $WALLET_IMAGES/imgNavLogo.imageset/imgNavLogo.png
convert $APP_ICON  -resize $((180)) $WALLET_IMAGES/imgNavLogo.imageset/imgNavLogo@2x.png
convert $APP_ICON  -resize $((270)) $WALLET_IMAGES/imgNavLogo.imageset/imgNavLogo@3x.png


rm -rf $WALLET_IMAGES/logo.imageset/*.png
convert $APP_ICON_WHITE  -resize $((171)) $WALLET_IMAGES/logo.imageset/logo.png
convert $APP_ICON_WHITE  -resize $((342)) $WALLET_IMAGES/logo.imageset/logo@2x.png
convert $APP_ICON_WHITE  -resize $((513)) $WALLET_IMAGES/logo.imageset/logo@3x.png

rm -rf $WALLET_IMAGES/imgRecieve.imageset/*.png
convert $APP_ICON_WHITE  -resize $((120)) $WALLET_IMAGES/imgRecieve.imageset/imgRecieve.png
convert $APP_ICON_WHITE  -resize $((240)) $WALLET_IMAGES/imgRecieve.imageset/imgRecieve@2x.png
convert $APP_ICON_WHITE  -resize $((360)) $WALLET_IMAGES/imgRecieve.imageset/imgRecieve@3x.png

rm -rf $WALLET_IMAGES/imgSend.imageset/*.png
convert $APP_ICON_WHITE  -resize $((120)) $WALLET_IMAGES/imgSend.imageset/imgSend.png
convert $APP_ICON_WHITE  -resize $((240)) $WALLET_IMAGES/imgSend.imageset/imgSend@2x.png
convert $APP_ICON_WHITE  -resize $((360)) $WALLET_IMAGES/imgSend.imageset/imgSend@3x.png




rm -rf $WALLET_IMAGES/../wallpaper-welcome.imageset/*.png
convert $APP_LAUNCH  -resize $((960)) -gravity center -crop 640x960+0+0 $APP_IMAGES/wallpaper-welcome.imageset/launch-1.png
convert $APP_LAUNCH  -resize $((960)) -gravity center -crop 640x960+0+0 $APP_IMAGES/wallpaper-welcome.imageset/launch.png
convert $APP_LAUNCH  -resize $((1136)) -gravity center -crop 640x1136+0+0 $APP_IMAGES/wallpaper-welcome.imageset/launchRetina.png

rpl -R 'red="0.33' 'red="'$RED $WALLET_PATH
rpl -R 'green="0.27' 'green="'$GREEN $WALLET_PATH
rpl -R 'blue="0.42' 'blue="'$BLUE $WALLET_PATH


rpl -R 'rgb(85, green: 71, blue: 108)' 'rgb('$DRED', green: '$DGREEN', blue: '$DBLUE')' $WALLET_PATH
rpl -R '[UIColor rgb:85 green:71 blue:108 alpha:1]' '[UIColor rgb:'$DRED' green:'$DGREEN' blue:'$DBLUE' alpha:1]' $WALLET_PATH



for i in {1..15}
do
	echo $i
	find $WALLET_PATH -name "*${COIN_SOURCE_FULLNAME_LOWERCASE}wallet*" -print0 | xargs -0 rename  -p --subst-all "${COIN_SOURCE_FULLNAME_LOWERCASE}wallet" "${COIN_FULLNAME_LOWERCASE}wallet"
	find $WALLET_PATH -name "*${COIN_SOURCE_FULLNAME_UPPERCASE}*" -print0 | xargs -0 rename  -p --subst-all $COIN_SOURCE_FULLNAME_UPPERCASE $COIN_NAME_FIRST_CHAR_UPPERCASE
	find $WALLET_PATH -name "*${COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE}*" -print0 | xargs -0 rename  -p --subst-all $COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE $COIN_NAME_FIRST_CHAR_UPPERCASE
done




find $WALLET_PATH -name '*.strings' | xargs rpl $COIN_SOURCE_FULLNAME_LOWERCASE $COIN_FULLNAME_LOWERCASE
find $WALLET_PATH -name '*.strings' | xargs rpl $COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE $COIN_NAME_FIRST_CHAR_UPPERCASE
find $WALLET_PATH -name '*.strings' | xargs rpl $COIN_SOURCE_FULLNAME_UPPERCASE $COIN_FULLNAME_UPPERCASE




rpl -R $COIN_SOURCE_FULLNAME_LOWERCASE'wallet' $COIN_FULLNAME_LOWERCASE'wallet' $WALLET_PATH
rpl -R $COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE'wallet' $COIN_NAME_FIRST_CHAR_UPPERCASE'wallet' $WALLET_PATH
rpl -R $COIN_SOURCE_NAME_FIRST_CHAR_UPPERCASE $COIN_NAME_FIRST_CHAR_UPPERCASE $WALLET_PATH
rpl -R $COIN_SOURCE_FULLNAME_UPPERCASE $COIN_NAME_FIRST_CHAR_UPPERCASE $WALLET_PATH
rpl -R "${COIN_SOURCE_FULLNAME_LOWERCASE} balance" "${COIN_FULLNAME_LOWERCASE} balance" $WALLET_PATH
rpl -R "${COIN_SOURCE_FULLNAME_LOWERCASE} address" "${COIN_FULLNAME_LOWERCASE} address" $WALLET_PATH
rpl -R "send ${COIN_SOURCE_FULLNAME_LOWERCASE}" "send ${COIN_FULLNAME_LOWERCASE}" $WALLET_PATH
rpl -R "${COIN_SOURCE_FULLNAME_LOWERCASE} balance" "${COIN_FULLNAME_LOWERCASE} balance" $WALLET_PATH
rpl -R "dash.org" $WEBSITE $WALLET_PATH

rpl -R PIV $TIKER $WALLET_PATH

find $WALLET_PATH -name '*.strings' -print0 | xargs -0 sed -i '' "s/${COIN_SOURCE_FULLNAME_LOWERCASE}/${COIN_FULLNAME_LOWERCASE}/g"






git init
git add .
git commit -m "${COIN_NAME} init"



# GENESIS, NBITS, SEED
# PORT
# MAGIC (reverse)
# PUBKEY_ADDRESS SCRIPT_ADDRESS SECRET_KEY
# PROTO_VER
# rpl -R '@"pivx"' '@"sovranocoin"'  .
