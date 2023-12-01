module actions

pub fn get_action(a []bool) !string {
	actions_str := ['add', 'remove', 'replace']
	mut actions_temp := []bool{}
	mut is_empty := true
	mut action := ''

	for i := 0; i < a.len; i++ {
		if a[i] == true {
			actions_temp << a[i]
			action = actions_str[i]
			is_empty = false
		}
	}

	if is_empty == true {
		return error('no action provided')
	}

	if actions_temp.len != 1 {
		return error('expected one action, got ${actions_temp.len}')
	}

	return action
}
