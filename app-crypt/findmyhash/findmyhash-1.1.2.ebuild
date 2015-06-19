# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit subversion

DESCRIPTION="findmyhash try to crack different types of hashes using free online services."
HOMEPAGE="http://code.google.com/p/findmyhash/"
ESVN_REPO_URI="http://findmyhash.googlecode.com/svn/trunk/"
ESVN_PROJECT="findmyhash-read-only"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND="dev-python/httplib2"

src_prepare() {
	sed -i '1i#!/usr/bin/env python2' ${PN}.py || die "Python-2 env doesn't set up!"
}

src_install() {
	newbin ${PN}.py ${PN}
}
