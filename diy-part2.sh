#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme to aurora
sed -i 's/luci-theme-bootstrap/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-argon/luci-theme-aurora/g' feeds/luci/collections/luci/Makefile

# Add Aurora theme and config app
git clone https://github.com/eamonxg/luci-theme-aurora.git package/luci-theme-aurora
git clone https://github.com/eamonxg/luci-app-aurora-config.git package/luci-app-aurora-config

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Force install custom feeds to override built-in versions
./scripts/feeds install -a -f -p passwall_packages
./scripts/feeds install -a -f -p passwall
./scripts/feeds install -a -f -p helloworld
