FROM alpine:3.12

VOLUME ["/var/repo"]

# - git, because that gets us the git-http-backend CGI script
# - fcgiwrap, because that is how nginx does CGI
# - spawn-fcgi, to launch fcgiwrap and to create the unix socket
RUN apk add --no-cache bash git git-daemon fcgiwrap spawn-fcgi 
RUN git config --system http.postBuffer 10485760

# - set params for fcgi
ENV SCRIPT_FILENAME="/usr/libexec/git-core/git-http-backend"
ENV GIT_PROJECT_ROOT="/var/repo"
ENV GIT_HTTP_EXPORT_ALL=""
ENV PS1="\u@gitsrv:\w> "

CMD echo "gitsrv started"; \
    /usr/bin/spawn-fcgi -n -p 9000 -F 4 /usr/bin/fcgiwrap

