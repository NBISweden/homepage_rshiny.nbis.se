[<img align="center" src="web/icons/NBIS.png" width="200" height="100"
/>](https://nbis.se) 

# Homepage for the NBIS rshiny server

The NBIS rshiny server can be accessed at https://rshiny.nbis.se

## Adding a new app

1. Make sure your app is a git repo on a git repository (GitHub, GitLab etc.). The directory should contain minimum `app.R` or `ui.R/server.R` files. Other dependencies if needed must be in this directory.

2. On GitHub

   2.1 Fork this [github repo](https://github.com/NBISweden/homepage_rshiny.nbis.se) and update the files described below.

   2.2. Update the Dockerfile to include dependencies (linux and R packages) if it doesn't already exist.

   2.3. Add link entry in **web/index.html**, for example:  
   `<li><a href="/shiny-server-apps/awesome-app">Awesome App</a></li>`

   2.4. Add link entry in **web/apps/index.html**, for example:  
   ```
        <li><a href="/shiny-server-apps/awesome-app">Awesome App</a>
        (Awesome App)
        <a href="https://github.com/app-url">GitHub repo</a>
        </li>
   ```

   2.5. Send a pull request. For example, see [here](https://github.com/NBISweden/homepage_rshiny.nbis.se/commit/40fb51b079f763a13aeb367068e661f1f45ea948).
   
3. On the server

   3.1 For access to server, contact [nanjiangshu](https://github.com/nanjiangshu).
 
   3.2 Go to `/media/storage/server/homepage_rshiny.nbis.se/shiny-server-apps` and run `git clone app-url` to clone the app. `app-url` is the URL location from step 1. The directory will be the same name as the repo you are cloning from. To use a different directory name, run for example: `git clone app-url awesome-app`.
 
4. The app should now be available through `http://rshiny.nbis.se/shiny-server-apps/awesome-app/`. You might have to wait a few minutes for the change.

## Deploying NBIS rshiny web-server by Docker locally

1. Clone this repository by 

        git clone https://github.com/NBISweden/homepage_rshiny.nbis.se

2. Change to the cloned folder and download apps by the script [getapp.sh](src/getapp.sh) by running

        src/getapp.sh <path-of-your-apps>

3. Define the ENV `PATH_APPS` for docker-compose by the following command

        echo "PATH_APPS=<path-of-your-apps>" > .env

4. Deploy the web-server container using

        docker-compose -f docker-compose-local.yml up -d


After success deployment, you should be able to access the server at
http://localhost


## Deploying NBIS rshiny web-server by Docker on the production server

Perform steps 1-3 the same as depolying locally and then depoly the web-server
with the command 

    docker-compose up -d

Note that every time when you run `docker-compose down` and `docker-compose
up`, the microservice `letsencrypt-nginx-proxy-companion` will try to obtain
a new token from LetsEncrypt. To ensure the certificate retrieval will not
exceeds the [rate limits](https://letsencrypt.org/docs/rate-limits/) set by
LetsEncrypt. It is recommended to restart shiny services by the following
command if there are any updates

    docker-compose stop shinymain shinymetamex && docker-compose up -d 

