# P10_BuildSETUP
build setup guide for treble P10 / Plus

# Prepare Computer

sudo apt-get install openjdk-8-jdk

sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib maven tmux screen w3m ncftp lunzip


# Resurrection REMIX

mkdir -p ~/bin

mkdir -p ~/RR

curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

chmod a+x ~/bin/repo

cd ~/RR

repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b oreo

git clone https://github.com/BadWolf-alfa/manifest_vky .repo/local_manifests

repo sync -f --force-sync --no-clone-bundle

. patcher/patch.sh

. fixestreble/patch.sh

cd device/rr/sepolicy && git am --skip && cd ../../..

. build/envsetup.sh

breakfast vky

lunch rr_vky-userdebug

export USE_CCACHE=1

~/RR/prebuilts/misc/linux-x86/ccache/ccache -M 50G

export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

export WITH_SU=true

make -j8





# Rebuild Resurrection Remix after changes

repo sync --force-sync

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

ARE LOCATED ON: out/target/product/vky/system.img
