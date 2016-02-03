#####################################################
# Not Supported in Puppet < 4.0
# To run future parser is required
#  puppet apply --parser future test_iteration.pp
#####################################################


$users = ['david', 'bob']

each($users) |$user| {
  notify { "Current user: $user": }
}
