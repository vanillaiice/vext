module main

import os
import flag
import actions

const (
	add_str     = 'add'
	remove_str  = 'remove'
	replace_str = 'replace'
)

fn main() {
	mut fp := flag.new_flag_parser(os.args)
	fp.version('v0.1.0')
	fp.description('Add, remove, or replace a file extension')
	fp.usage_example('vext --add txt --file "foo bar"')

	add := fp.bool('add', `a`, false, '--add or -a')
	remove := fp.bool('remove', `r`, false, '--remove or -r')
	replace := fp.bool('replace', `p`, false, '--replace or -p')

	extension := fp.string('extension', `e`, '', '--extension <EXTENSION> or -e <EXTENSION>')

	file := fp.string('file', `f`, '', '--file <FILE(S)> or -f <FILE(S)>')

	fp.finalize() or {
		eprintln(err)
		exit(1)
	}

	action := actions.get_action([add, remove, replace]) or {
		eprintln(err)
		exit(1)
	}

	if file == '' {
		eprintln("parameter 'file' not provided, exiting")
		exit(1)
	}

	if extension == '' {
		eprintln("parameter 'extension' not provided, exiting")
		exit(1)
	}

	match action {
		add_str {
			actions.add(file.split(' '), extension) or { panic(err) }
		}
		remove_str {
			actions.remove(file.split(' ')) or { panic(err) }
		}
		replace_str {
			actions.replace(file.split(' '), extension) or { panic(err) }
		}
		else {
			eprintln("parameter 'action' does not match ${add_str}, ${remove_str}, or ${replace_str}")
			exit(1)
		}
	}
}
