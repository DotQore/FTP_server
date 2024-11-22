# Usar la imagen base de pure-ftpd
FROM stilliard/pure-ftpd

# Configurar variables de entorno
ENV FTP_USER=usuario
ENV FTP_USER_PASS=contraseña
ENV FTP_USER_HOME=/home/usuario

# Crear el directorio de contraseñas y el archivo
RUN mkdir -p /etc/pure-ftpd/passwd && \
    touch /etc/pure-ftpd/passwd/pureftpd.passwd

# Crear el usuario FTP
RUN (echo $FTP_USER_PASS; echo $FTP_USER_PASS) | pure-pw useradd $FTP_USER -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d $FTP_USER_HOME && \
    pure-pw mkdb

# Exponer los puertos necesarios
EXPOSE 21 30000-30009

# Iniciar el servidor FTP
CMD ["pure-ftpd", "-c", "50", "-C=10", "-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-E", "-j", "-R"]
