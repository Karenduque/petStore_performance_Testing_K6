# WARNING!
# The grafana/k6:master-with-browser image launches a Chrome browser by setting the
# 'no-sandbox' argument. Only use it with trustworthy websites.
#
# As an alternative, you can use a Docker SECCOMP profile instead, and overwrite the
# Chrome arguments to not use 'no-sandbox' such as:
# docker container run --rm -i -e K6_BROWSER_ARGS='' --security-opt seccomp=$(pwd)/chrome.json grafana/k6:master-with-browser run - <script.js
#
# You can find an example of a hardened SECCOMP profile in:
# https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json.
rm -rf ./screenshots
rm -rf ./output

docker run --rm -i \
    -v $(pwd)/screenshots:/screenshots \
    -v $(pwd)/output:/output \
    -v $(pwd)/scripts:/scripts \
    grafana/k6:master-with-browser run --out json=/output/result.json /scripts/script.js