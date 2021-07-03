FROM jetbrains/teamcity-minimal-agent:latest

USER root

LABEL maintainer=yaronidan@gmail.com

RUN apt-get update && apt-get -y install \
    curl gpg git xvfb wget apt-utils xvfb wget fonts-liberation libnspr4 libnss3 xdg-utils dbus \
    ## for google-chrome
    libasound2 libatk-bridge2.0-0 libatk1.0-0 libatspi2.0-0 libcairo2 libcups2 libgbm1 libgtk-3-0 libpango-1.0-0 libgtk-3-0 libxkbcommon0 \
    gawk g++ make

#============================================
# Google Chrome
#============================================
# 
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb
RUN /etc/init.d/dbus start

USER buildagent

WORKDIR /home/buildagent

RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

RUN curl -sSL https://get.rvm.io -o rvm.sh && curl -sSL https://rvm.io/mpapis.asc | gpg --import -

RUN cat rvm.sh | bash -s stable

RUN /bin/bash -c "source /home/buildagent/.rvm/scripts/rvm && rvm install jruby-9.1.17.0 --default"

RUN /bin/bash -c "source /home/buildagent/.rvm/scripts/rvm && gem uninstall -x -i /home/buildagent/.rvm/gems/jruby-9.1.17.0@global bundler"

RUN /bin/bash -c "source /home/buildagent/.rvm/scripts/rvm && rvm use --default jruby-9.1.17.0@global"

RUN /bin/bash -c "source /home/buildagent/.rvm/scripts/rvm && gem install bundler -v 1.17.3"

CMD /bin/bash -c "source /home/buildagent/.rvm/scripts/rvm && source /run-services.sh"
