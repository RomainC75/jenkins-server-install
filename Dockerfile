FROM jenkins/jenkins:lts-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# install azure-cli
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN add-apt-repository 'deb http://repos.azulsystems.com/ubuntu stable main'
RUN apt-get update
RUN apt-get install --auto-remove --no-install-recommends --no-install-suggests --show-upgraded --yes \
  zulu-21

RUN apt-get update && apt-get install -y docker-ce-cli zulu21-jdk

# install azure cli
# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
# RUN apt-add-repository "deb http://repos.azul.com/azure-only/zulu/apt stable main"
# RUN apt-get -q update
# RUN apt-get -y install zulu-8-azure-jdk

USER jenkins