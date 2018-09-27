
declare -A LOG_COLORS
LOG_COLORS[DEFAULT]="\e[49m\e[39m"
LOG_COLORS[DEBUG]="\e[104m"
LOG_COLORS[INFO]="\e[36m"
LOG_COLORS[WARNING]="\e[91m"
LOG_COLORS[ERROR]="\e[41m"
LOG_COLORS[OK]="\e[32m"
LOG_COLORS[SUCCESS]="\e[42m"

logger() {
	_type="${1^^}"
	_color="${LOG_COLORS[DEFAULT]}"
	if [[ -n "${LOG_COLORS[$_type]}" ]]; then
		_color="${LOG_COLORS[$_type]}"
		shift
	else
		_type=DEFAULT
	fi

	echo -e "$_color$@${LOG_COLORS[DEFAULT]}"
}

log()    { logger DEFAULT $@; }

ldebug() { logger DEBUG   $@; }

linfo()  { logger INFO    $@; }
lwarn()  { logger WARNING $@; }
lerror() { logger ERROR   $@; }

lok()      { logger OK      $@; }
lsuccess() { logger SUCCESS $@; }

