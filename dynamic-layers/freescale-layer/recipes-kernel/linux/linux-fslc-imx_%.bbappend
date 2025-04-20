FILESEXTRAPATHS:prepend := "${UNIT_EBPF_LAYERDIR}/recipes-kernel/linux/files:"

require recipes-kernel/linux/unit-ebpf.inc

# Snippet copied from linux-yocto.inc, needed for eBPF but is not included by linux-fslc-imx 
# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
