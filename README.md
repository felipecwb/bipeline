# bipeline
Bipeline - use a simple bash to pipeline your steps to prod PS: Makefile does it too

### EXAMPLE:

use: `example_pipeline.sh`
```
#!/bin/bash

MYDIR=$(dirname $BASH_SOURCE)
source $MYDIR/bipeline.sh

clean() {
	return 0
}

configure() {
	return 0
}

deps() {
	ldebug "dependencies!"
	return 0
}

build() {
	linfo "build blocks!"
	return 0
}

tests() {
	lsuccess "its a succes"
	lsuccess "failure is experience!"
	return 0
}

deploy() {
	linfo "DEPLOYING!"
	lsuccess "Success!"
	return 0
}


PROJECT=example-bipeline.sh
bipeline $PROJECT $@

```

