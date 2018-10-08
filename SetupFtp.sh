yum install vsftpd
chmod 777 /var/ftp
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
sed 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config > ~/selinuxconfig
mv -f ~/selinuxconfig /etc/selinux/config
sed -i '/tcp_wrappers=YES/a ssl_enable=YES\nallow_anon_ssl=NO\nforce_local_data_ssl=YES\nforce_local_logins_ssl=YES\nssl_tlsv1=YES\nssl_sslv2=NO\nssl_sslv3=NO\nrsa_cert_file=/etc/vsftpd/vsftpd.pem\nuserlist_deny=NO\nuserlist_enable=NO\ntcp_wrappers=YES\nlocal_root=/var/ftp' /etc/vsftpd/vsftpd.conf
