
step_exec() {
	step=$1; shift

	linfo ""
	linfo "RUNNING ${step}"
	$step $@ \
		| while read line; do \
			echo -n "$(linfo "[$step]") "; \
			echo "$(log "$line")"; \
	       	done

	if [[ "$?" != "0" ]]; then 
		linfo "#${step^^} > Done! status: $?"
	fi

	return $?
}

