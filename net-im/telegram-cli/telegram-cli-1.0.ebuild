# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

IUSE="lua json libconfig"
DESCRIPTION="Command line interface client for Telegram"
HOMEPAGE="https://github.com/vysheng/tg"
EGIT_REPO_URI="https://github.com/vysheng/tg.git"
EGIT_BRANCH="master"
EGIT_HAS_SUBMODULES=1

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-libs/readline
	dev-libs/openssl
	dev-libs/libevent 
    libconfig? ( dev-libs/libconfig )
	lua? ( dev-lang/lua )
	json? ( dev-libs/jansson )"

src_unpack() {
	git-2_src_unpack
	cd $EGIT_SOURCEDIR
	git submodule update --init --recursive
}

src_configure() {
	econf \
	    $(use_enable lua liblua ) \
		$(use_enable json json ) \
		$(use_enable libconfig libconfig )
}

src_install() {
    newbin bin/telegram-cli telegram-cli

	insinto /etc/telegram-cli/
	newins tg-server.pub server.pub
}
