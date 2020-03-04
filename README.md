[<img align="center" src="icons/NBIS.png" width="200" height="100"
/>](http://rshiny.nbis.se) 
## Homepage for the NBIS rshiny server
The NBIS rshiny server can be accessed at http://rshiny.nbis.se

## Deploying NBIS rshiny web-server by Docker

1. Download apps by the script [getapp.sh](src/getapp.sh) by running

        src/getapp.sh <path-of-your-apps>

2. Define the ENV `PATH_APPS` for docker-compose by the following command

        echo "PATH_APPS=<path-of-your-apps>" > .env

3. Set the ports for the HOST and CONTAINER

        echo -e "PORT_HOST=13838\nPORT_CONTAINER=13838" >> .env

4. Deploy the web-server container using

        docker-compose up -d


After success deployment, you should be able to access the server at
http://localhost:3838

or if you add the line

```
127.0.0.1 rshiny.nbis.se
```

to the host file `/etc/hosts`, the server can also be accessed at
http://rshiny.nbis.se:3838

