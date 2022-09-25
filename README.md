# Simple Server Setup
This small utility will help you setup your homelab server. It will guide you and setup as per your inputs.
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
        
  - Just run the start.sh