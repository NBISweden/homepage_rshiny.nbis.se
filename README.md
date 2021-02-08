[<img align="center" src="icons/NBIS.png" width="200" height="100"
/>](http://rshiny.nbis.se) 

## Homepage for the NBIS rshiny server

The NBIS rshiny server can be accessed at http://rshiny.nbis.se

## Adding a new app

1. Fork this [github repo](https://github.com/NBISweden/homepage_rshiny.nbis.se)

   1.1 Update the Dockfile to include dependencies (linux and R packages)
   
   1.2 Add link entry in **web/index.html** like  
   `<li><a href="/shiny-server-apps/awesome-app">Awesome App</a></li>`
   
   1.3 Add link entry in **web/apps/index.html**
   ```
        <li><a href="/shiny-server-apps/awesome-app">Awesome App</a>
        (Awesome App)
        <a href="https://github.com/app-url">GitHub repo</a>
        </li>
   ```
   
   1.4 Send a pull request.
   
2. On the server, go to `/media/storage/server/homepage_rshiny.nbis.se/shiny-server-apps` and run `git clone app-url` to clone the app and place it inside a directory, say `awesome-app`.
3. The app should now be available through `http://rshiny.nbis.se/shiny-server-apps/awesome-app/`.

## Deploying NBIS rshiny web-server by Docker locally

1. Download apps by the script [getapp.sh](src/getapp.sh) by running

        src/getapp.sh <path-of-your-apps>

2. Define the ENV `PATH_APPS` for docker-compose by the following command

        echo "PATH_APPS=<path-of-your-apps>" > .env

3. Deploy the web-server container using

        docker-compose -f docker-compose-local.yml up -d


After success deployment, you should be able to access the server at
http://localhost


