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

# deploy.pl
    Usage: ./deploy.pl [opts]
    
    Config Options:
	    --nick			- IRC nick
	    --name			- IRC name
	    --host			- IRC server host
	    --port			- IRC server port
	    --adminhosts		- IRC admin hostnames (ex: *!*@domain.tld,*!ab@ex.co)
	    --chans			- IRC channels (ex: #lobby,#bots,#shaow)
	    --cmdchan			- IRC logging channel
	    --puburl			- Web Admin public URL (ex http://hostname:port/)
	    --container-name		- Docker container name
