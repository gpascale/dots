
function mingz () {
    curl -sL wzrd.in/standalone/"$1"|uglifyjs -mc 2>/dev/null|gzip -c|wc -c;
}

docker_attach () {
    #do things with parameters like $1 such as
    docker exec -it "$1" /bin/bash
}

function docker-kill-all() {
    docker kill $(docker ps -qa)
}
function docker-remove-all-containers() {
    docker rm $(docker ps -qa)
}
function docker-remove-all-images() {
    docker rmi $(docker images -qa)
}

function docker-full-reset() {
    docker-kill-all
    docker-remove-all-containers
    docker-remove-all-images
}
