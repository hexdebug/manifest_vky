# P10_BuildSETUP
build setup guide for treble P10 / Plus

# Prepare Computer (ubuntu 14.04 LTS)
sudo add-apt-repository ppa:openjdk-r/ppa

sudo apt-get update

sudo apt-get install openjdk-8-jdk

sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib maven tmux screen w3m ncftp lunzip phablet-tools 

sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev


# Resurrection REMIX

mkdir -p ~/RR

cd ~/RR

repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo

git clone https://github.com/BadWolf-alfa/manifest_vky .repo/local_manifests

repo sync -f --force-sync --no-clone-bundle

sudo rm -r packages/apps/Settings && git clone -b oreo https://github.com/Huawei-Dev/Resurrection_packages_apps_Settings packages/apps/Settings

sudo rm -r frameworks/base && git clone -b oreo https://github.com/Huawei-Dev/android_frameworks_base frameworks/base

. patcher/patch.sh

. fixestreble/patch.sh

cd device/rr/sepolicy && git am --skip && cd ../../..

. build/envsetup.sh

breakfast vky

lunch rr_vky-userdebug

export USE_CCACHE=1

~/RR/prebuilts/misc/linux-x86/ccache/ccache -M 25G

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

export WITH_SU=true

make -j8





# Rebuild Resurrection Remix after changes

repo sync --force-sync

sudo rm -r packages/apps/Settings && git clone -b oreo https://github.com/Huawei-Dev/Resurrection_packages_apps_Settings packages/apps/Settings

sudo rm -r frameworks/base && git clone -b oreo https://github.com/Huawei-Dev/android_frameworks_base frameworks/base

. patcher/patch.sh

. fixestreble/patch.sh

cd device/rr/sepolicy && git am --skip && cd ../../..

source build/envsetup.sh

breakfast vky

lunch rr_vky-userdebug

export USE_CCACHE=1

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

export WITH_SU=true

make -j8


# OUTPUT FILE:

ARE LOCATED ON: ~/RR/out/target/product/vky/system.img
