FROM node:stretch
LABEL Mohammad Mardoud <mhmr81@gmail.com>

RUN apt-get update && apt-get -y install mongodb sudo

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh \
    && mv -f /entrypoint.sh /home/entrypoint.sh 

WORKDIR /home/meshcentral

RUN cd /home/meshcentral \
    && npm install meshcentral 
    
ENV PORT 443  REDIRPORT 80  MPSPORT 4443 EMAIL mail@host HOST host.ltd SMTP smtp.host.ltd USER smtp@user PASS smtppass!  DB netdb MONGODB "mongodb://127.0.0.1:27017/meshcentral" MONGODBCOL "meshcentral"

EXPOSE 25 80 443 4443 27017 27018

ENTRYPOINT ["/home/entrypoint.sh"]
