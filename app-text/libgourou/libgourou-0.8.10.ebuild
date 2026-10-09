# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

DESCRIPTION="Free implementation of Adobe's ADEPT protocol used to add DRM on ePub/PDF files"
HOMEPAGE="https://forge.soutade.fr/soutade/libgourou"
SRC_URI="
	https://forge.soutade.fr/soutade/libgourou/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://git.mopalinski.com/soutade/libgourou/archive/v${PV}.tar.gz -> ${P}.tar.gz
"
S="${WORKDIR}/${PN}"

LICENSE="LGPL-3 BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/libzip
	dev-libs/openssl
	dev-libs/pugixml
	dev-libs/updfparser
	net-misc/curl
	virtual/zlib
"
DEPEND="${RDEPEND}"

pkg_setup() {
	UPDFPARSERLIB="/usr/$(get_libdir)/libupdfparser.so"
	export UPDFPARSERLIB
}

_emake() {
	emake \
		UPDFPARSERLIB="${UPDFPARSERLIB}" \
		BUILD_STATIC=0 BUILD_SHARED=1 BUILD_UTILS=1 \
		"$@"
}

src_compile() {
	mkdir obj lib
	_emake libgourou.so build_utils
}

src_install() {
	_emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="/$(get_libdir)" \
		install install_headers
	einstalldocs
}
