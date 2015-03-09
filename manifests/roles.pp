class role {
    include profile::base
}

class role::devops inherits role {

}

class role::devops::master inherits role::devops {
    include profile::devops::mypacker
}

class role::www inherits role {

}

class role::www::dev inherits role::www {
    include profile::webserver::dev
}

