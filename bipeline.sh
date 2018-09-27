
BIPELINEDIR=$(dirname $BASH_SOURCE)

# includes
source $BIPELINEDIR/log.sh
source $BIPELINEDIR/tag.sh
source $BIPELINEDIR/step.sh
source $BIPELINEDIR/targets.sh

_help() {
	ldebug "Targets [clean|deps|configure|build|deploy|default]"
        exit 1
}

bipeline () { run_bipeline $@; }

run_bipeline() {
	PROJECT=${PROJECT:-$1}
	TARGET="${2:-default}"
	
	if [[ -z "$PROJECT" ]]; then
		lerror "NO PROJECT SELECTED!"
		exit 3
	fi

	linfo "+-------------------------------------"
	linfo "| BIPELINE for $PROJECT"
	linfo "| TARGET: $TARGET"
	linfo "+-------------------------------------"

	case "$TARGET" in
		clean|deps|configure|build|deploy)
			step_exec $TARGET
			exit $?
			;;
		default)
			default
			exit $?
			;;
		*)
			_help $PROJECT
			;;
	esac
}

