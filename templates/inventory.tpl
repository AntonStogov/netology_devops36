[webservers]
%{ for i, ip in webservers ~}
web-${i + 1} ansible_host=${ip} fqdn=${web_fqdns[i]}
%{ endfor ~}

[databases]
%{ for i, ip in databases ~}
db-${i + 1} ansible_host=${ip} fqdn=${db_fqdns[i]}
%{ endfor ~}

[storage]
storage ansible_host=${storage} fqdn=${storage_fqdn}
