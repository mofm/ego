# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Linux namespaces sandbox program"
HOMEPAGE="https://l3net.wordpress.com/projects/firejail/"
SRC_URI="https://downloads.sourceforge.net/project/${PN}/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="+seccomp +chroot +bind"

src_prepare() {
	epatch "${FILESDIR}/${P}-pre_strip.patch"
	epatch "${FILESDIR}/${P}-fortify_source.patch"
}

src_configure() {
	econf \
		$(use_enable seccomp ) \
		$(use_enable chroot ) \
		$(use_enable bind )
}

src_compile() {
	emake || die "emake failed!"	
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
