
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
function docker-run-and-attach() {
    local pid=$(docker run $@)
    echo $pid
}

function docker-full-reset() {
    docker-kill-all
    docker-remove-all-containers
    docker-remove-all-images
}

function killbypid() {
}

function killbyname() {
    procs=(${(f)"$(ps aux | grep "$1" | grep -v grep | tr -s ' ')"})
    for proc in $procs; do
	pid=$(echo $proc | cut -d ' ' -f 2)
	name=$(echo $proc | cut -d ' ' -f 11)
	echo "killing $name ($pid)"
	kill -9 $pid
    done
}

function get_port_user() {
    echo "$(lsof -nP -iTCP -sTCP:LISTEN | grep $1)"
    pid=$(lsof -nP -iTCP -sTCP:LISTEN | grep $1 | awk  '{print $2}')
    echo "\npid: $pid\n"
    lsof -p $pid
    echo ""
}