#!/bin/sh

# Author:     Héctor Molinero Fernández <hector@molinero.dev>
# License:    MIT, https://opensource.org/licenses/MIT
# Repository: https://github.com/hectorm/hblock

set -eu
export LC_ALL='C'

main() {
	source="${1:?}"
	target="${2:?}"
	hblock="${3:-hblock}"

	export HBLOCK_FOOTER_FILE='builtin'
	export HBLOCK_HEADER=''

	export HBLOCK_FOOTER_FILE='builtin'
	export HBLOCK_FOOTER=''

	export HBLOCK_SOURCES_FILE='builtin'
	export HBLOCK_SOURCES="file://${source:?}"

	export HBLOCK_ALLOWLIST_FILE='builtin'
	export HBLOCK_ALLOWLIST=''

	export HBLOCK_DENYLIST_FILE='builtin'
	export HBLOCK_DENYLIST='hblock-check.molinero.dev'

	export HBLOCK_REDIRECTION='0.0.0.0'
	export HBLOCK_WRAP='1'
	export HBLOCK_TEMPLATE='address=/%D/%R'
	export HBLOCK_COMMENT='#'

	export HBLOCK_LENIENT='false'
	export HBLOCK_REGEX='false'
	export HBLOCK_CONTINUE='false'

	"${hblock:?}" -qO "${target:?}"
}

main "${@-}"
