# shadow-docker
Shadow Docker Image

# Enviornment Overrides Variables

    IRC_HOST            - IRC Server Host
    IRC_PORT            - IRC Server Port
    IRC_NICK            - IRC Nickname
    IRC_NAME            - IRC Real Name
    IRC_CHANS           - List of IRC Channels (ex: #lobby,#bots)
    IRC_CMDCHAN         - Logging Channel
    IRC_ADMINHOSTS      - List of Admin Hostmasks (ex: *!*@staff.example.org)
    HTTP_PUBURL         - Public URL for WebAdmin (ex: http://10.0.0.104:1337/)

# Usage
    docker run -d -p 1337:1337 -e IRC_NICK=MyBot ab3800/shadow
