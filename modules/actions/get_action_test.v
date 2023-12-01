module actions

fn test_get_action() {
	a := [true, false, false]
	a1 := [false, true, false]
	a2 := [false, false, true]
	a3 := [false, false, false]
	a4 := [false, true, true]
	a5 := [true, true, true]

	assert get_action(a)! == 'add'
	assert get_action(a1)! == 'remove'
	assert get_action(a2)! == 'replace'
	assert get_action(a3) or { '${err}' } == 'no action provided'
	assert get_action(a4) or { '${err}' } == 'expected one action, got 2'
	assert get_action(a5) or { '${err}' } == 'expected one action, got 3'
}
