module actions

import os { mv }

fn prepare_add(file string, extension string) string {
	return [file, extension].join('.')
}

fn prepare_remove(file string) string {
	return file.all_before_last('.')
}

pub fn add(file []string, extension string) ! {
	for f in file {
		mv(f, prepare_add(f, extension)) or { return err }
	}
}

pub fn remove(file []string) ! {
	for f in file {
		mv(f, prepare_remove(f)) or { return err }
	}
}

pub fn replace(file []string, extension string) ! {
	for f in file {
		mv(f, prepare_add(prepare_remove(f), extension)) or { return err }
	}
}
