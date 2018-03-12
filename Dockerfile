FROM python:3

WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get install -y xvfb libfontconfig wkhtmltopdf

RUN echo '#!/bin/bash\nxvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' > /usr/bin/wkhtmltopdf.sh
RUN cat /usr/bin/wkhtmltopdf.sh
RUN chmod a+x /usr/bin/wkhtmltopdf.sh
RUN ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf
RUN wget https://raw.githubusercontent.com/jobisoft/wikidoc/master/wikidoc.py

# RUN wkhtmltopdf http://www.google.com output.pdf


# RUN wkhtmltopdf http://www.google.com google.pdf

# RUN git clone https://github.com/webpack/webpack.wiki.git





# RUN apt-get -qy update
# RUN apt-get -qqy install software-properties-common python-software-properties python-setuptools
# RUN apt-get -qqy install php7.0-mysql php7.0-pgsql php7.0-redis php7.0-gd php7.0-mbstring
# RUN apt-get -qqy install php7.0-intl php7.0-soap php7.0-tidy nodejs
# RUN easy_install supervisor
# RUN easy_install supervisor-stdout
# RUN apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# WORKDIR "/application"
