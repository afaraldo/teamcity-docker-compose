FROM jetbrains/teamcity-minimal-agent:latest

USER root

LABEL maintainer=yaronidan@gmail.com

RUN apt-get update && apt-get -y install \
    curl gpg git

RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

RUN curl -sSL https://get.rvm.io -o rvm.sh && curl -sSL https://rvm.io/mpapis.asc | gpg --import -

RUN cat rvm.sh | bash -s stable

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && rvm install jruby-9.1.17.0 --default && gem install bundler -v 1.17.3"

RUN /bin/bash -c "source /etc/profile.d/rvm.sh && gem uninstall -x -i /usr/local/rvm/gems/jruby-9.1.17.0@global bundler"

CMD /bin/bash -c "source /etc/profile.d/rvm.sh && source run-services.sh"
