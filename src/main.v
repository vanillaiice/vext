module main

import os
import flag
import actions

const (
	empty_str = ''
	add_str = 'add'
	remove_str = 'remove'
	replace_str = 'replace'
)

fn main() {
	mut fp := flag.new_flag_parser(os.args)
	fp.version('v0.1.0')
	fp.description('Add, remove, or replace a file extension')
	fp.usage_example('ext --action add --file "foo bar" --extension txt')
	file := fp.string('file', `f`, '', '--file <PATH TO FILE(S)> or -f <PATH TO FILE(S)>')
	ext := fp.string('extension', `e`, '', '--extension <EXTENSION> or -e <EXTENSION>')
	action := fp.string('action', `a`, '', '--action <ACTION> or -a <ACTION> (${add_str}, ${remove_str}, or ${replace_str})')
	fp.finalize() or {
		eprintln(err)
		exit(1)
	}

	if file == empty_str {
		eprintln("ERROR: parameter 'file' not provided, exiting")
		exit(1)
	}

	if action == empty_str {
		eprintln("ERROR: parameter 'action' not provided, exiting")
		exit(1)
	}

	if (action == add_str || action == replace_str) && ext == empty_str {
		eprintln("ERROR: parameter 'extension' not provided, exiting")
		exit(1)
	}
	
	match action {
		add_str { actions.add(file.split(' '), ext) }
		remove_str { actions.remove(file.split(' ')) }
		replace_str { actions.replace(file.split(' '), ext) }
		else {
			eprintln('ERROR: parameter "action" does not match ${add_str}, ${remove_str}, or ${replace_str}')
		}
	}
}
