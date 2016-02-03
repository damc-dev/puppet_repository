class accounts {
  @accounts::virtual {'david':
    uid      => 11111,
    realName => 'David McElligott',
  }  
  
  @accounts::virtual {'test_user':
    uid      => 99999,
    realName => 'Temporary User',
  }

}
