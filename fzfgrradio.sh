#!/bin/bash
#the list is here curl -sL https://raw.githubusercontent.com/CerebruxCode/shelldio/stable/.shelldio/all_stations.txt
#display the rest of the file, with all mystic stuff
thisfile=`basename "$0"`
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ $1 == "dm" ]]; then
  selected="$(cat $SCRIPT_DIR/$thisfile | tail -n+14 | grep "//" | sed 's/#//' | dmenu -l 20)"
else
  selected="$(cat $SCRIPT_DIR/$thisfile | tail -n+14 | grep "//" | sed 's/#//' | fzf -e -i)"
fi

stream="$(echo $selected | cut -d"," -f2 | tr -d '\n')"
audacious $stream

#1055 Rock 105.5,http://radio.1055rock.gr:30000/1055
#88μισό 88.5,http://solid33.streamupsolutions.com:30000/stream
#89 Rainbow,http://62.212.82.197:8000/stream
#9.58 ΕΡΤ3 95.8,http://radiostreaming.ert.gr:80/ert-958fm
#99FM/ράδιο1,http://62.212.82.208:8000/stream
#A 100 FM 107.4,http://bestgreek.info:8104
#Alpha 96.5,http://46.4.121.138:7700/alpha
#Alpha 98.9,http://ample.radiojar.com/xcdg6yggzfeuv
#Amagi Radio,http://amagiradio.com:8000/stream
#Art FM 90.6,http://167.114.246.249:8023/stream
#Athens 106.5,http://148.251.162.206:9400/stream
#Athens DJ 95.2,https://netradio.live24.gr/athensdeejay
#Athens Voice 102.5,https://nitro.live24.gr/nitro4555
#Atlantis FM 105.2,http://85.10.206.222:8012
#Bar Legend Radio,https://solid24.streamupsolutions.com:2199/tunein/nilxzqeg.pls
#BBC World Service,http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-eieuk
#Best Radio 92.6,https://best.live24.gr/best1222
#Black Man 103.1,http://alpha-stream.eu:9326/;.mp3
#Ble.FM 93.1,http://radio.lancom.gr:8006/stream1
#Blue Space Athens 107.2,http://91.121.222.81:8104/stream
#Church of Greece 89.5,http://85.10.206.222:8002/;listen.pls
#Church of Piraeus 91.2,http://136.243.61.157:8310/stream
#City International 106.1,http://50.7.99.155:7519/stream/1/
#Cosmoradio 95.1,http://cosmoradio.gr:80/stream1
#D-Code 962.gr,http://s15.myradiostream.com:13980/;listen.pls
#Derti Radio,http://derti.live24.gr:80/derty1000
#Dromos FM 89.8,http://dromos898.live24.gr:80/dromos898
#Easy 97.2,https://easy972.live24.gr/easy972
#Ellada FM 94.3,https://netradio.live24.gr/ellada943
#En Lefko Athens,http://stream.radiojar.com:80/enlefko877
#Ertopen 106.7,https://netradio.live24.gr/erasport
#Flash 99.4,http://207.154.248.204:8009/stream
#Fly 104,https://eu9.fastcast4u.com/proxy/nicper00?mp=/1
#FM 100.6 Δημοτικό Ραδιόφωνο Θεσσαλονίκης,https://live.fm100.gr/shoutcast/fm1006
#FM 100 Δημοτικό Ραδιόφωνο Θεσσαλονίκης,https://live.fm100.gr/shoutcast/fm100
#Focus FM 103.6,http://focus.greekstream.net:80/
#Fresh Salad 96.1,http://178.33.135.246:5262/stream
#Galaxy 92,https://galaxy.live24.gr/galaxy9292
#Groove Radio,http://213.239.206.179:8090/stream
#Hot FM ,https://hotfm.live24.gr/hotfm
#Imagine 89.7,https://eu9.fastcast4u.com/proxy/nicperet?mp=/1
#Join Radio,http://stream.radiojar.com:80/2uh8e4akb
#Karamela 92.4,http://sc.greekstream.net:4014
#Kiss Extra FM Patra,http://stream.kiisextra.gr:48500/kiis.mp3
#Kiss FM 92.9,https://kissfm.live24.gr/kissfmathens
#Kiss FM Athens,https://kissfm.live24.gr/kiss2111
#KLIK FM Rodos,http://www.111.gr:8042
#Kriti FM,https://mediacp.32bit.gr:8018/stream
#Legend 88.6,http://netradio.live24.gr:80/886athens
#Libero 107.4,http://eco.onestreaming.com:8081/
#Liquid FM,http://ice.streamcloud.mediacdn.com:80/freeradio-1000
#Live FM 98.6,http://167.114.246.249:8001/stream
#Love 106.5,http://server.insms.gr:45104/;stream
#Love Radio 97.5,https://loveradio.live24.gr/loveradio-1000
#MAD Radio 106.2,http://mediaserver.mad.tv:80/stream
#Magico Radio,https://i4.streams.ovh:2199/tunein/trellas-stream.pls
#Melody Patra,http://stream.melody888.gr:48500/melody.mp3
#Metro 89.2 Heraklion,https://stream.crete.ovh:8443/metro
#Metropolis 95.5,https://metropolis.live24.gr/metropolis955thess
#More 103,http://eco.onestreaming.com:8041
#Music 89.2,http://ample-02.radiojar.com:80/k0hua7u1yk5tv?
#Mythos Athens,http://bestgreek.info:8104
#North 98,https://netradio.live24.gr/north98thess
#Nostos 100.6,https://neos.win:37878/stream
#Off Radio,http://46.28.53.118:7062/stream
#Party FM 104,https://radio.streamings.gr:9006/stream
#Patra youfm 100.1,http://www.youfmradio.gr:8880/stream
#Pepper 96.6,https://pepper966.live24.gr/pepperorigin
#Piqeras DeeJay 105.6,http://rosetta.shoutca.st:8270/stream
#Plus Radio 102.6,http://plusradio.gr/stream1
#Point Radio Pop,http://78.46.149.5:8029/stream2
#Point Radio Λαικό,http://78.46.149.5:8029/stream
#Radio Galaxy 99,http://solid1.streamupsolutions.com:11074/stream
#Radio Gold @net,http://radiogold.live24.gr:80/radiogold
#Radio Hot Lips Athens,https://netradio.live24.gr/radiohotlips
#RAT FM Μεσογειακού Πανεπιστημίου Κρήτης (Χανιά),http://78.129.185.84:31467/
#Real FM 107.1,https://realfmthess.live24.gr/realthess
#Real FM 97.8,https://realfm.live24.gr/realfm
#Republic Radio ,https://netradio.live24.gr/republicthess
#Rock FM 96.9,hls://rockfmlive.mdc.akamaized.net/strmRCFm/userRCFm/playlist.m3u8
#Rock Radio 104.7,http://188.165.248.218:8013/stream
#RSO 91.7,http://tachyon.shoutca.st:8594
#Rythmos στούς 94.9,http://rythmos.live24.gr:80/rythmos
#Sfera 102.2,https://sfera.live24.gr/sfera4132
#Smooth ,http://iphone.live24.gr:80/radio998
#Sohos FM 88.7,http://eu7.fastcast4u.com:2046/stream
#Sport 24 Radio 103.3,https://sport24radio.live24.gr/sport24radio
#Sport FM 94.6,https://sportfm.live24.gr/sportfm7712
#Star Athens 107.8,http://95.154.254.129:17498/stream
#Status FM 107.7,http://148.251.179.119:8000/stream
#Studio 3 103.5,http://s1.onweb.gr:8408
#Styl FM 104.9,http://s3.onweb.gr:8530/;
#ThessRadio,http://noc.ezhellas.com:30570/zbutsam
#The Press Project,https://n13.radiojar.com/qgra821mrtwtv
#Velvet 96.8,https://netradio.live24.gr/velvet968thess
#Venus Amaliada Alt.,http://s3.onweb.gr:8808
#Venus Amaliada,http://eco.onestreaming.com:8171
#V FM 91.1,http://176.9.184.196:8177/stream
#We Radio 89.4,https://radioservers.xyz/we-894-live
#Yellow Radio 92.8,http://radio.streamings.gr:8009/stream
#Yes Patra 91.2,http://5.9.17.142:8024
#Zeppelin 106.7,https://radiostreaming.ert.gr/ert-zeppelin
#Zoo Radio 90.8,https://netradio.live24.gr/zoo908thess
#Αθήνα 98.4,https://athina984.live24.gr/athina984
#Δίεση 101.3,https://diesi.live24.gr/diesi1013
#Ελληνικός FM 93.2,https://orange.live24.gr/orange9320
#Επικοινωνία FM 94.0,http://172.93.237.106:8274/;stream.mp3
#ΕΡΑ σπορ 101.8,http://radiostreaming.ert.gr:80/ert-erasport
#ΕΡΤ3,http://radiostreaming.ert.gr:80/ert-102fm
#ΕΡΤ Δεύτερο πρόγραμμα 103.7,http://radiostreaming.ert.gr:80/ert-deftero
#ΕΡΤ Κόσμος 93.6,http://radiostreaming.ert.gr:80/ert-kosmos
#ΕΡΤ Πρώτο πρόγραμμα 91.6,http://radiostreaming.ert.gr:80/ert-proto
#ΕΡΤ Τρίτο πρόγραμμα 90.9,http://radiostreaming.ert.gr:80/ert-trito
#Ερωτικός FM 94.8,http://eu9.fastcast4u.com:5282/;
#Θέμα Radio 104.6,http://stream.radiojar.com:80/cdk030dsvv5tv
#Καλαμαριά FM 101.7,http://sc.greekstream.net:80/;.mp3
#Κανάλι 1 – Δημοτική Ραδιοφωνία Πειραιά 90.4,https://netradio.live24.gr/kanali1peiraia
#Κοινωνικό Ραδιόφωνο Χανίων KPaX Radio,https://c32.radioboss.fm:18563/stream
#Κρήτη FM 87.5,http://s3.onweb.gr:8878
#Λαϊκός FM 87.6,https://netradio.live24.gr/laikos876
#Λάμψη FM 92.3,hls://lampsifmlive.mdc.akamaized.net/strmLampsi/userLampsi/playlist.m3u8
#Λυδία η Φιλιππησία 94.2,http://82.192.84.30:1086/stream
#Λύρα FM 91.4,http://172.93.237.106:8271/stream
#Ματζόρε Πανεπιστημίου Κρήτης (Ρέθυμνο) 89.1 FM,https://rs.radio.uoc.gr:8001/matzore_64.ogg
#Μελωδία 99.2,http://netradio
#Μέντα FM 88.0,http://ample-02.radiojar.com:80/menta
#Μεταδεύτερο FM,https://live.metadeftero.gr/stream
#Μινόρε FM .,https://minorefm.live24.gr/minorefm
#Μουσικός 98.6,https://netradio.live24.gr/mousikos986
#Μύθος FM 93.4,http://s2.free-shoutcast.com:18560/stream
#Ορθόδοξη Παρουσία 106.8,http://www.gwebstream.net:8008/stream
#Πανεπιστημίου Κρήτης (Ηράκλειο) RastaPank 96.7 FM,https://rs.radio.uoc.gr:8001/uoc_128.ogg
#Πανόραμα 98.4,https://netradio.live24.gr/panorama984
#Παραπολιτικά FM 90.1,https://netradio.live24.gr/athinaradio
#Πειρατικός FM 99.5,http://148.251.162.206:9800/stream
#Πρακτορείο 104.9,http://s3.onweb.gr:8436
#Ράδιο Ακρίτες 102.3,http://akritespontou.live24.gr:80/akritespontou
#Ράδιο Άποψη ,http://eco.onestreaming.com:8398/;
#Ράδιο Βερόνικα,http://radioveronica.live24.gr:80/veronicaweb
#Ράδιο Έκρηξη 99.8,http://sc.greekstream.net:4006/
#Ραδιοζώνες 93.8,http://live.stream.radio98fm.org:8000/high
#Ράδιο Θεσσαλονίκη 94.5,http://eu7.fastcast4u.com:6156/stream?type=http&nocache=136596
#Ραδιοκύματα 104.4,http://s1.onweb.gr:8812/
#Ραδιόφωνο 904 90.4,http://icecast.902.gr:8000/904
#ΣΚΑΪ 100.3,https://skai.live24.gr/skai1003-2
#Σοκ FM 104.8 - Χαλκίδα,http://sokfm.lalala.gr:8000
#Στο κόκκινο 105.5,http://stream.radiojar.com:80/kokkino-ath.mp3
#Στο κόκκινο 91.4,http://ample-01.radiojar.com/275p8ssmb?
#Στο Μωβ ,http://stream.radiojar.com:80/kk01hepkb.mp3
#Τρανζίστορ 100.3,https://netradio.live24.gr/tranzistor1003thess
#Χριστιανισμός 104.3,http://eu1.fastcast4u.com:9326/stream
#Χρώμα FM 105.8,https://hroma1058thess.live24.gr/hroma1058thess

