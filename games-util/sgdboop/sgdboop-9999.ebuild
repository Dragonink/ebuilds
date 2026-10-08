# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

inherit desktop

DESCRIPTION="A program used for applying custom artwork to Steam using SteamGridDB"
HOMEPAGE="
	https://www.steamgriddb.com/boop
	https://github.com/SteamGridDB/SGDBoop
"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/SteamGridDB/SGDBoop.git"
else
	SRC_URI="https://github.com/SteamGridDB/SGDBoop/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/SGDBoop-${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="ZLIB"
SLOT="0"

RDEPEND="
	net-misc/curl
	=x11-libs/gtk+-3*
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_install() {
	dobin SGDBoop

	domenu res/linux/com.steamgriddb.SGDBoop.desktop

	insinto /usr/share/metainfo
	doins com.steamgriddb.SGDBoop.appdata.xml

	einstalldocs
}
