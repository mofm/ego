# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="ix command line pastebin."
HOMEPAGE="http://ix.io"
SRC_URI="http://ix.io/client"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND="app-shells/bash"

S=${WORKDIR}

src_unpack() { :; }

src_install() {
	newbin ${DISTDIR}/client ix
	doman ${FILESDIR}/ix.1
}

