# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

inherit flag-o-matic git-r3

DESCRIPTION="Very simple PDF parser that will load PDF objects without interpretation"
HOMEPAGE="https://forge.soutade.fr/soutade/uPDFParser"
EGIT_REPO_URI="
	https://forge.soutade.fr/soutade/uPDFParser.git
	https://git.mopalinski.com/soutade/uPDFParser.git
"

LICENSE="LGPL-3"
SLOT="0"

src_prepare() {
	append-ldflags -Wl,-soname,libupdfparser.so
	default
}

src_compile() {
	emake LDFLAGS="${LDFLAGS}" \
		BUILD_STATIC=0 BUILD_SHARED=1
}

src_install() {
	dolib.so libupdfparser.so
	doheader include/*.h

	einstalldocs
}
