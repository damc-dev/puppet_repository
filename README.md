# puppet_repository

### Clone this repo

### Install r10k
```
puppet module install zack/r10k
puppet apply configure_r10k.pp
```

### Configure Puppet Master to use Directory Environments
``` 
puppet module install puppetlabs/inifile
puppet apply configure_directory_environments.pp
```

### Backup / Delete Existing Directory Environments
```
mv /etc/puppet/environments /etc/puppet/backup_environments
```

### Deploy Environment
```
r10k deploy environment -pv
```

