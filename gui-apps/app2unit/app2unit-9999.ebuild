# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=9

inherit optfeature

DESCRIPTION="Launch Desktop Entries as systemd user units"
HOMEPAGE="https://github.com/Vladimir-csp/app2unit"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Vladimir-csp/app2unit.git"
else
	SRC_URI="https://github.com/Vladimir-csp/app2unit/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	app-shells/bash
	sys-apps/systemd
"
BDEPEND="
	app-text/scdoc
"

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install-bin

	scdoc < app2unit.1.scd > app2unit.1
	doman app2unit.1

	einstalldocs
}

pkg_postinst() {
	optfeature "XDG Terminal support" gui-apps/xdg-terminal-exec
	optfeature "desktop notifications" x11-libs/libnotify
}
