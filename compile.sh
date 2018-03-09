cd RR
repo sync --force-sync
. patcher/patch.sh
. fixestreble/patch.sh
cd device/rr/sepolicy && git am --skip && cd ../../..
. build/envsetup.sh
breakfast vky
lunch rr_vky-userdebug
export USE_CCACHE=1
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
export WITH_SU=true
make -j8
