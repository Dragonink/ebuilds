# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

MY_PN="${PN%-bin}"
MY_PV="$(ver_cut 1-2)-$(ver_cut 4)"

DESCRIPTION="Proton fork with Dawn Winery patches"
HOMEPAGE="https://dawn.wine/dawn-winery/dwproton"
SRC_URI="https://dawn.wine/dawn-winery/dwproton/releases/download/dwproton-${MY_PV}/dwproton-${MY_PV}-x86_64.tar.xz"
S="${WORKDIR}"

LICENSE="
	BSD
	LGPL-2 LGPL-2.1
	MIT
	MPL-2.0
	ZLIB
"
SLOT="0"
KEYWORDS="-* ~amd64"

RDEPEND="
	games-util/steam-launcher[steamruntime(+)]
"

src_install() {
	local PREFIX='/usr/share/steam/compatibilitytools.d'
	dodir "${PREFIX}"
	cp --recursive "dwproton-${MY_PV}"-* "${D}${PREFIX}/${MY_PN}"

	einstalldocs
}
