#!/bin/bash
#
# ARG_HELP([A script that walks through the folder structure created for Tesla Sentry videos and "crunches" into a single side-by-side-by-side view as well as a motion based highlight reel])
# ARG_OPTIONAL_SINGLE([motion],[m],[sets a motion threshold for generating highlights],[0.005])
# ARG_POSITIONAL_SINGLE([root],[root directory to search for videos in])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.8.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret=$2
	test -n "$_ret" || _ret=1
	test "$_PRINT_HELP" = yes && print_help >&2
	echo "$1" >&2
	exit ${_ret}
}


begins_with_short_option()
{
	local first_option all_short_options='hm'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_motion="0.005"


print_help()
{
	printf '%s\n' "A script that walks through the folder structure created for Tesla Sentry videos and \"crunches\" \
   into a single side-by-side-by-side view as well as a motion based highlight reel"
	printf '\nUsage: %s [-h|--help] [-m|--motion <arg>] <root>\n' "$0"
	printf '\t%s\n' "<root>: root directory to search for videos in"
	printf '\t%s\n' "-h, --help: Prints help"
	printf '\t%s\n' "-m, --motion: sets a motion threshold for generating highlights (default: '0.005')"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			-m|--motion)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_motion="$2"
				shift
				;;
			--motion=*)
				_arg_motion="${_key##--motion=}"
				;;
			-m*)
				_arg_motion="${_key##-m}"
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'root'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require exactly 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
	test "${_positionals_count}" -le 1 || _PRINT_HELP=yes die "FATAL ERROR: There were spurious positional arguments --- we expect exactly 1 (namely: $_required_args_string), but got ${_positionals_count} (the last one was: '${_last_positional}')." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_root "

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash

for v in $_arg_root/*/*/*front.mp4; do
  /root/bin/crunch.sh $v -m $_arg_motion| sed 's/^/  /'
done

# ] <-- needed because of Argbash