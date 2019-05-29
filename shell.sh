#!/bin/bash
for i in $(cat imageList.txt); do
    #regex is for slicing the url based on /
    regex='^([^/]+)//([^/]+)/([^/]+)/([^/]+)/([^/]+)/(.*)$' ; [[ $i =~ $regex ]] && 
    name="${BASH_REMATCH[6]}" && echo $name
    #bash rematch is for capturing the group in the above case its capturing the 6th group
    #example url: https://example.com/productimages/sawdsa/asd/2328011a-40.jpg
    #will get the 2328011a-40.jpg
    content="$(curl -A "Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0" -O "$i"  )"
    #faking the user agent and downloading the file using the webname
done