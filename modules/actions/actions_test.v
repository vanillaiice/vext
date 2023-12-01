module actions

import os

fn test_prepare_add() {
	assert prepare_add('foo', 'txt') == 'foo.txt'
}

fn test_prepare_remove() {
	assert prepare_remove('foo.txt') == 'foo'
}

fn test_add() {
	files := ['tmp/foo', 'tmp/bar', 'tmp/baz']

	os.mkdir('tmp')!

	for f in files {
		os.create(f)!
	}

	files_ := ['foo.txt', 'bar.txt', 'baz.txt']

	add(files, 'txt') or { panic(err) }

	files_ext_added := os.ls('tmp')!

	for f in files_ {
		assert f in files_ext_added
	}

	os.rmdir_all('tmp')!
}

fn test_remove() {
	files := ['tmp1/foo.txt', 'tmp1/bar.txt', 'tmp1/baz.txt']

	os.mkdir('tmp1')!

	for f in files {
		os.create(f)!
	}

	files_ := ['foo', 'bar', 'baz']

	remove(files) or { panic(err) }

	files_ext_removed := os.ls('tmp1')!

	for f in files_ {
		assert f in files_ext_removed
	}

	os.rmdir_all('tmp1')!
}

fn test_replace() {
	files := ['tmp2/foo.txt', 'tmp2/bar.db', 'tmp2/baz.zip']

	os.mkdir('tmp2')!

	for f in files {
		os.create(f)!
	}

	files_ := ['foo.txt', 'bar.txt', 'baz.txt']

	replace(files, 'txt') or { panic(err) }

	files_ext_replaced := os.ls('tmp2')!

	for f in files_ {
		assert f in files_ext_replaced
	}

	os.rmdir_all('tmp2')!
}
