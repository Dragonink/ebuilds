# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: amd64-v3.eclass
# @MAINTAINER:
# Dragonink <Dragonink@users.noreply.github.com>
# @AUTHOR:
# Dragonink <Dragonink@users.noreply.github.com>
# @BLURB: configure amd64-v3 (aka. x86-64-v3) USE flag

_AMD64_V3_FLAGS=(
	# v2
	cpu_flags_x86_popcnt
	cpu_flags_x86_sse3
	cpu_flags_x86_sse4_1
	cpu_flags_x86_sse4_2
	cpu_flags_x86_ssse3
	# v3
	cpu_flags_x86_avx
	cpu_flags_x86_avx2
	cpu_flags_x86_bmi1
	cpu_flags_x86_bmi2
	cpu_flags_x86_f16c
	cpu_flags_x86_fma3
)

IUSE="
	${_AMD64_V3_FLAGS[*]}
	amd64-v3
"
REQUIRED_USE="amd64-v3? ( amd64 ${_AMD64_V3_FLAGS[*]} )"
