# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="UnixBench is to provide a basic indicator of the performance of a Unix-like system"
HOMEPAGE="http://byte-unixbench.googlecode.com/"
SRC_URI="http://byte-unixbench.googlecode.com/files/UnixBench${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="graphic"

DEPEND="graphic? ( x11-apps/x11perf )
	dev-lang/perl"

S="${WORKDIR}/UnixBench"

src_prepare() {
	epatch "${FILESDIR}/${P}-gentoo-dir.patch"
	if use graphic; then
		cd "${S}"
		sed -i 's/^# GRAPHIC_TESTS =/GRAPHIC_TESTS =/g' Makefile || die "Graphic test not enabled!"
	fi
}

src_compile() {
	cd ${S}
	emake || die "emake failed"
}

src_install() {
	exeinto /usr/share/unixbench
	doexe ${S}/Run
	exeinto /usr/share/unixbench/pgms/
	doexe ${S}/pgms/*
	insinto /usr/share/unixbench
	doins -r ${S}/testdir
	dobin "${FILESDIR}/ubench"
}
