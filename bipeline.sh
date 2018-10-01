
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

bipeline() {
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

	if type $TARGET 1>/dev/null 2>&1; then
		step_exec $TARGET
		exit $?
	fi

	_help $PROJECT
}

