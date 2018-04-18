node mysql-master {

  include ::mysql::server

}

node mysql-slave {

  include ::mysql::server

}
