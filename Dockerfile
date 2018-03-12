FROM python:3

WORKDIR /usr/src/app

RUN apt-get update -y
RUN apt-get install -y xvfb libfontconfig pandoc

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvJf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
RUN cp wkhtmltox/bin/wkhtmlto* /usr/bin/

RUN wget https://github.com/jgm/pandoc/releases/download/2.1.2/pandoc-2.1.2-linux.tar.gz
RUN tar xvzf pandoc-2.1.2-linux.tar.gz  --strip-components 1 -C /usr/bin/

COPY ./wikidoc.py wikidoc.py
RUN chmod +x wikidoc.py
