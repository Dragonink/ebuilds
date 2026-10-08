# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

inherit amd64-v3

MY_PN="${PN%-bin}"
MY_PV="$(ver_cut 1-2)-$(ver_cut 4)"

DESCRIPTION="Proton fork with CachyOS patches"
HOMEPAGE="https://github.com/CachyOS/proton-cachyos"
SRC_URI="
	amd64? (
		amd64-v3? ( https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${MY_PV}-slr/proton-cachyos-${MY_PV}-slr-x86_64_v3.tar.xz )
		!amd64-v3? ( https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${MY_PV}-slr/proton-cachyos-${MY_PV}-slr-x86_64.tar.xz )
	)
	arm64? ( https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${MY_PV}-slr/proton-cachyos-${MY_PV}-slr-arm64.tar.xz )
"
S="${WORKDIR}"

LICENSE="
	BSD
	LGPL-2 LGPL-2.1
	MIT
	MPL-2.0
	ZLIB
"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RDEPEND="
	games-util/steam-launcher[steamruntime(+)]
"

src_install() {
	local PREFIX='/usr/share/steam/compatibilitytools.d'
	dodir "${PREFIX}"
	cp --recursive "proton-cachyos-${MY_PV}-slr"-* "${D}${PREFIX}/${MY_PN}"

	einstalldocs
}
