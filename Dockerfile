# Usar la imagen base de pure-ftpd
FROM stilliard/pure-ftpd

# Configurar variables de entorno
ENV FTP_USER=usuario
ENV FTP_USER_PASS=contraseña
ENV FTP_USER_HOME=/home/usuario

# Exponer los puertos necesarios
EXPOSE 21 30000-30009

# Crear el usuario FTP
RUN (echo $FTP_USER_PASS; echo $FTP_USER_PASS) | pure-pw useradd $FTP_USER -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d $FTP_USER_HOME && \
    pure-pw mkdb

# Iniciar el servidor FTP
CMD ["pure-ftpd", "-c", "50", "-C=10", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R"]