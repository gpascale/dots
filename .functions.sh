
function mingz () {
    curl -sL wzrd.in/standalone/"$1"|uglifyjs -mc 2>/dev/null|gzip -c|wc -c;
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
