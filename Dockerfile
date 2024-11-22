FROM stilliard/pure-ftpd
ENV FTP_USER_NAME=usuario
ENV FTP_USER_PASS=contraseña
ENV FTP_USER_HOME=/home/usuario
EXPOSE 21 30000-30009
