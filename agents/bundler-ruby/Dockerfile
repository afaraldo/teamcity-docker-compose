FROM jetbrains/teamcity-minimal-agent:latest

USER root

LABEL maintainer=yaronidan@gmail.com

RUN apt-get update && apt-get -y install \
    curl gpg git xvfb wget

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

RUN apt install -y ./google-chrome-stable_current_amd64.deb

RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

RUN curl -sSL https://get.rvm.io -o rvm.sh && curl -sSL https://rvm.io/mpapis.asc | gpg --import -

RUN cat rvm.sh | bash -s stable

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install jruby-9.1.17.0 --default"

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && gem uninstall -x -i /usr/local/rvm/gems/jruby-9.1.17.0@global bundler"

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm use --default jruby-9.1.17.0@global"

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && gem install bundler -v 1.17.3"

CMD /bin/bash -c "source /etc/profile.d/rvm.sh && source run-services.sh"
