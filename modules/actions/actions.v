module actions

import os { mv }

const (
	dot_str = '.'
)

fn add_mock(file string, extension string) string {
	return [file, extension].join('.')
}

fn remove_mock(file string) string {
	return file.all_before_last(dot_str)
}

pub fn add(file []string, extension string) {
	for f in file {
		mv(f, add_mock(f, extension)) or {
			eprintln(err)
			exit(1)
		}
	}
}

pub fn remove(file []string) {
	for f in file {
		mv(f, remove_mock(f)) or {
			eprintln(err)
			exit(1)
		}
	}
}

pub fn replace(file []string, extension string) {
	for f in file {
		mv(f, add_mock(remove_mock(f), extension)) or {
			eprintln(err)
			exit(1)
		}
	}
}
