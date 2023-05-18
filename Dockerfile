FROM node:16.20.0

EXPOSE 5432 4321 35729

RUN npm i -g gulp@4.0.2 gulp-cli@2.3.0 yo@4.3.1 @microsoft/generator-sharepoint@1.17.2

VOLUME /usr/app/spfx
WORKDIR /usr/app/spfx
RUN apt-get update &&  \
	apt-get install nano &&  \
	useradd --create-home --shell /bin/bash spfx && \
    usermod -aG sudo spfx && \
    chown -R spfx:spfx /usr/app/spfx

USER spfx

CMD /bin/bash
