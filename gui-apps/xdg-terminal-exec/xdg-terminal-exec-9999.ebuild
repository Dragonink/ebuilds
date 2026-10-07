# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

DESCRIPTION="XDG Default Terminal Execution"
HOMEPAGE="https://github.com/Vladimir-csp/xdg-terminal-exec"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Vladimir-csp/xdg-terminal-exec.git"
else
	SRC_URI="https://github.com/Vladimir-csp/xdg-terminal-exec/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="
	test
"
RESTRICT="
	!test? ( test )
"

RDEPEND="
	app-shells/bash
"
BDEPEND="
	app-text/scdoc
	test? ( dev-util/bats )
"

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install
	einstalldocs
}
