# Simple Server Setup
This small utility will help you setup your server. It can use an existing server.config file and setup accordingly. Else it will guide you and setup as per your inputs.
  - It has following functionalities
      1. System Update
            - It installs and runs ucaresystem-core 
      2. System Date Update
            - It sets server timezone
      3. Install apps
            - It will install apps as per your input names
      4. Install Docker
            - It will install Docker and Docker compose
      5. Reset Docker
            - It will remove all running containers and delete all images, volumes, etc.
      6. Deploy Docker Containers
            -  It supports following container which you can choose:
                1) Portainer
                2) Watchtower
                3) File Browser
                4) Qbittorrent
                5) Jellyfin
                6) CoadingWS
        
  - Finally It will create a server.config file which you can use to setup the server next time with exact same settngs.
  - Just run the start.sh with sudo