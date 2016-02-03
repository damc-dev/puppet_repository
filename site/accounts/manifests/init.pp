class accounts {
  @accounts::virtual {'david':
    uid        => 11111,
    realName   => 'David McElligott',
    sshKeyType => 'ssh-rsa',
    sshKey     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsMHpX+9b1fCr+IKKWG+3HoBA8ToN+CLZ2Eb3tvP1TZt/o5JVj4pmEFF9Um1f25RZIiZ4lGbm8kfliy6R+/WNh3Wm83e/qPwevD6DDPDN7/nyb5q2VzpkUj1Y0Ov21EwVs5nWwkQJrEn11qGjO7ndXPRR+48p4Xo6CpAulL5CD2yoCG/kZhUCf5ajIml4/99tEzFWpmdtDpbus7mXeLmxW9z5JhOHUuxMy0wqr1OeiYD0nYBErpOVIryHTz4LO0kSJbts2vNoORm7mjLmoVFLJpKltlFPQQAnfjsYlSgFVTMZUwZ6+CthKVAQXtsEbG0+YyQZHZzszmBJcxq/BQcl',
  }  
  
  @accounts::virtual {'test_user':
    uid      => 99999,
    realName => 'Temporary User',
    sshKeyType => 'ssh-rsa',
    sshKey     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDFsMHpX+9b1fCr+IKKWG+3HoBA8ToN+CLZ2Eb3tvP1TZt/o5JVj4pmEFF9Um1f25RZIiZ4lGbm8kfliy6R+/WNh3Wm83e/qPwevD6DDPDN7/nyb5q2VzpkUj1Y0Ov21EwVs5nWwkQJrEn11qGjO7ndXPRR+48p4Xo6CpAulL5CD2yoCG/kZhUCf5ajIml4/99tEzFWpmdtDpbus7mXeLmxW9z5JhOHUuxMy0wqr1OeiYD0nYBErpOVIryHTz4LO0kSJbts2vNoORm7mjLmoVFLJpKltlFPQQAnfjsYlSgFVTMZUwZ6+CthKVAQXtsEbG0+YyQZHZzszmBJcxq/BQcl',
  }

}
