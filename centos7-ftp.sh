if [ $EUID -ne 0 ]; then
read -n 1 -p "el Script debe ser ejecutado por root, apreta una tecla para continuar."
exit 1
else
clear
echo ########################Instalacion FTP###################
yum install vsftpd -y >> /dev/null
echo #######################configuracion del Servicio##########
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
rm -rf /etc/vsftpd/vsftpd.conf
touch /etc/vsftpd/vsftpd.conf
echo anonymous_enable=NO >> /etc/vsftpd/vsftpd.conf
echo write_enable=YES >> /etc/vsftpd/vsftpd.conf
echo local_enable=YES >> /etc/vsftpd/vsftpd.conf
echo local_umask=022 >> /etc/vsftpd/vsftpd.conf
echo #anon_upload_enable=YES >> /etc/vsftpd/vsftpd.conf
echo #anon_mkdir_write_enable=YES >> /etc/vsftpd/vsftpd.conf
echo dirmessage_enable=YES >> /etc/vsftpd/vsftpd.conf
echo xferlog_enable=YES >> /etc/vsftpd/vsftpd.conf
echo connect_from_port_20=YES >> /etc/vsftpd/vsftpd.conf
echo #chown_uploads=YES >> /etc/vsftpd/vsftpd.conf
echo #chown_username=whoever >> /etc/vsftpd/vsftpd.conf
echo #xferlog_file=/var/log/xferlog >> /etc/vsftpd/vsftpd.conf
echo xferlog_std_format=YES >> /etc/vsftpd/vsftpd.conf
echo #idle_session_timeout=600 >> /etc/vsftpd/vsftpd.conf
echo #data_connection_timeout=120 >> /etc/vsftpd/vsftpd.conf
echo #nopriv_user=ftpsecure >> /etc/vsftpd/vsftpd.conf
echo #async_abor_enable=YES >> /etc/vsftpd/vsftpd.conf
echo #ascii_upload_enable=YES >> /etc/vsftpd/vsftpd.conf
echo #ascii_download_enable=YES >> /etc/vsftpd/vsftpd.conf
echo #ftpd_banner=Welcome to blah FTP service. >> /etc/vsftpd/vsftpd.conf
echo #deny_email_enable=YES >> /etc/vsftpd/vsftpd.conf
echo #(default follows) >> /etc/vsftpd/vsftpd.conf
echo #banned_email_file=/etc/vsftpd/banned_emails >> /etc/vsftpd/vsftpd.conf
echo chroot_local_user=YES >> /etc/vsftpd/vsftpd.conf
echo chroot_list_enable=YES >> /etc/vsftpd/vsftpd.conf
echo chroot_list_file=/etc/vsftpd/chroot_list >> /etc/vsftpd/vsftpd.conf
echo #ls_recurse_enable=YES >> /etc/vsftpd/vsftpd.conf
echo listen=YES >> /etc/vsftpd/vsftpd.conf
echo #listen_ipv6=YES >> /etc/vsftpd/vsftpd.conf
echo pam_service_name=vsftpd >> /etc/vsftpd/vsftpd.conf
echo userlist_enable=YES >> /etc/vsftpd/vsftpd.conf
echo tcp_wrappers=YES >> /etc/vsftpd/vsftpd.conf
setsebool -P allow_ftpd_full_access on
setsebool -P httpd_enable_ftp_server on
setsebool -P ftp_home_dir on
systemctl restart vsftpd
echo ######################################################
read -n 1 -p "Debes configurar firewall para finalizar"
echo ######################################################
fi

 