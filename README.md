# Docker based Github wiki to PDF converter

## How to use

(Mostly notes to self at this moment)

1. Build the image
```
docker build -t wikidoc .
```

2. Run the container
```
WIKIDOC_CONTAINER=$(docker run -t -d  wikidoc)
```

3. Clone the repo and copy to 
```
git clone https://github.com/wekan/wekan.wiki.git
# Note: Home.md must be configured as per https://github.com/jobisoft/wikidoc#how-it-works

docker cp ./wekan.wiki/ $WIKIDOC_CONTAINER:/usr/src/app/wiki
```

4. Run conversion
```
docker exec -ti $WIKIDOC_CONTAINER ./wikidoc.py wkhtmltopdf wiki
```
5. Fetch the file
```
docker cp $WIKIDOC_CONTAINER:/usr/src/app/wiki/documentation.pdf ./documentation.pdf
``




