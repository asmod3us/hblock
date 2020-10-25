#!/bin/sh

# Author:     Héctor Molinero Fernández <hector@molinero.dev>
# License:    MIT, https://opensource.org/licenses/MIT
# Repository: https://github.com/hectorm/hblock

set -eu
export LC_ALL='C'

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "${0:?}")" && pwd -P)"

main() {
	hblock="${1:-hblock}"

	# shellcheck disable=SC1090
	. "${SCRIPT_DIR:?}"/env.sh

	expected="$(cat -- "${SCRIPT_DIR:?}"/test-009.out)"
	obtained="$("${TEST_SHELL:?}" "${hblock:?}" -qO- --header=/no/such/file 2>&1 ||:)"

	if [ "${obtained?}" = "${expected?}" ]; then
		printf -- 'Test 009 - OK\n'
		exit 0
	else
		printf -- 'Test 009 - FAIL\n' >&2
		printf -- 'Expected:\n\n%s\n\n' "${expected?}" >&2
		printf -- 'Obtained:\n\n%s\n\n' "${obtained?}" >&2
		exit 1
	fi
}

main "${@-}"