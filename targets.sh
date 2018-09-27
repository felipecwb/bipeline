
default() {
	set -e

	step_exec clean
	step_exec configure
	step_exec deps
	step_exec build
	step_exec tests
	step_exec deploy
}

clean() {
	lwarn "Nothing implemented!"
	return 2
}

configure() {
	lwarn "Nothing implemented!"
	return 2
}

deps() {
	lwarn "Nothing implemented!"
	return 2
}

build() {
	lwarn "Nothing implemented!"
	return 2
}

tests() {
	lwarn "Nothing implemented!"
	return 2
}

deploy() {
	lwarn "Nothing implemented!"
	return 2
}

