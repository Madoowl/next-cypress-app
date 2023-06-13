# configurer une image Debian
FROM debian:10 as next-cypress-app-docker

LABEL org.opencontainers.image.source https://github.com/madoowl/next-cypress-app

# installation de nodejs et dépendances
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_18.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

# copier des fichiers dans l'image
ADD . /app/

# définition du répertoire de travail par défault
WORKDIR /app

RUN npm install

RUN npm run build

EXPOSE 3000

CMD npm run start

