function docker-curl
    docker run --rm --network=$argv[1] curlimages/curl $argv[2]
end
