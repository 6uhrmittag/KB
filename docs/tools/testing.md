# tools for testing

## cli tools

### websites/http - performance

- https://github.com/hakluke/hakrawler - web crawler - `hakrawler -url google.de -plain | hakcheckurl`
- https://github.com/hakluke/hakcheckurl - HTTP Code checker for lists - `hakrawler -url google.de -plain | hakcheckurl`
- https://github.com/Rowno/medic - bulk URL status checks + comparing - `cat urls.txt | medic -p check_before.log`
- https://github.com/tomnomnom/assetfinder - find related domains and subdomains - `assetfinder target.com | hakrawler`
- https://github.com/atomicptr/crab - check status code and response time of lists - `crab crawl:list urlstocheck`

### curl

````
echo "www.google.de" >> testurls
for url in $(cat testurls); do curl -I -L -S -s -w "%{url_effective} %{http_version}" https://$url -o /dev/null ;echo ; done | column -t -s' ' | grep -E --color "200|$"
````

Variables see: https://curl.haxx.se/docs/manpage.html

````
http_code
http_version
num_connects
redirect_url
size_download
size_header
speed_download
````

### httping

https://linux.die.net/man/1/httping

````cli
httping $URL -b -l -s -W -i 1  | ts
````

### cli - CI/testing

- https://k6.io/unit-testing-for-performance - Like Unit Testing, for Performance

## online tools

### websites/http - all-in-one/general

- https://observatory.mozilla.org - all-in-one
- https://internet.nl - check if your site uses Modern Internet Standards
- https://check-your-website.server-daten.de

### websites/http - linting

- https://webhint.io - webhint is a customizable linting tool that helps you improve your site's accessibility, speed, cross-browser compatibility, and more

### websites/http - security

- https://www.hardenize.com - security configuration monitoring
- ~~https://webcookies.org - all-in-one security check. HTTP cookies, Flash, HTML5 localStorage, sessionStorage, CANVAS, Supercookies, Evercookies. Includes a free SSL/TLS, HTML and HTTP vulnerability scanner and URL malware scanner.~~ [offline]
- https://pentest-tools.com/website-vulnerability-scanning/website-scanner - Discover common web application vulnerabilities and server configuration issues
- https://app.upguard.com/webscan - security assessment
- https://sitecheck.sucuri.net - security check & malware scanner
- https://hackertarget.com/wordpress-security-scan- wordpress security scanner
- https://securityheaders.com - CSP Header check
- https://csp-evaluator.withgoogle.com - View CSP Header of URLs(CSP Debugger)
- https://github.com/lirantal/is-website-vulnerable

### websites/http - https/tls

- https://www.ssllabs.com/ssltest/ - check TLS
- https://crt.sh/ - detailt info about Certificates on websites
- https://hstspreload.org - check status and add sites to Chromes HSTS preload list
- https://www.jitbit.com/sslcheck - search for non-secure images, scripts and css-files that will trigger a warning message in browsers
- https://tls.imirhil.fr/ - view important details fast

### websites/http - privacy

- https://webbkoll.dataskydd.net/en - check what data-protecting measures a site has taken
- https://privacyscore.org - PrivacyScore

### websites/http - speed

- https://gtmetrix.com - speedtest and optimization opportunities
- https://tools.pingdom.com - load time, analyze it, and find bottlenecks

### websites/http - seo

- https://seositecheckup.com - Search Engine Optimization Made Easy
- https://www.seowebpageanalyzer.com - check out your pages for search engine optimisation

### websites/http - misc

- https://httpstatus.io - bulk check HTTP Status
- https://web.dev - modern capabilities on your own sites
- https://realfavicongenerator.net/favicon_checker - Is your favicon perfect
- https://favicomatic.com/favicon-test - check if your website looks pretty on every browser and device

## privacy

- https://gdprchecklist.io - The GDPR Compliance Checklist

## File linting/analyzing

- https://jeremylong.github.io/DependencyCheck/analyzers/

# http2

## apache

https://documentation.help/httpd-2.4/mod_http2.html
https://httpd.apache.org/docs/current/howto/http2.html

## server checking

- nghttp - useful to visualize the HTTP/2 frames and get a better idea of the protocol.
    - https://nghttp2.org/documentation/nghttp.1.html
- h2load - useful to stress-test your server.
    - https://nghttp2.org/documentation/h2load-howto.html
- https://blog.cloudflare.com/tools-for-debugging-testing-and-using-http-2/
### h2load

https://nghttp2.org/documentation/h2load-howto.html

````shell
sudo apt install nghttp2
````

````shell
-n - The number of total requests. Default: 1
-c - The number of concurrent clients. Default: 1
-m - The max concurrent streams to issue per client. Default: 1
````
````shell
h2load  https://domain.tld/ -n 90 -c 30 -H 'Authorization: Basic dfgdfg' -m5 --h1
h2load  https://domain.tld/ -n 90 -c 30 -H 'Authorization: Basic Ydfgdfg'
````

### nghttp
````shell
sudo apt install nghttp2
````

https://nghttp2.org/documentation/nghttp.1.html

````shell
--get-assets
--verbose
 --null-out
--header=<HEADER>
````

````shell
nghttp -nv https://nghttp2.org
````


## nginx 

- https://github.com/yandex/gixy
- https://github.com/temoto/nginx-lint
- https://github.com/irvinlim/SublimeLinter-contrib-nginx-lint
- https://github.com/jhinch/nginx-linter
- https://github.com/digitalocean/nginxconfig.io

npm install -g nginx-linter
pip install gixy


## docker

- https://github.com/docker/docker-bench-security
- generate BOM of image - https://github.com/anchore/syft/
  - syft `image:tag`
- scan image packages for vulnerabilities - https://github.com/anchore/grype
  - grype `image:tag`


# Hardware 
## Keyboard & Mouse

- online, keyboard only, feedback sound + event-details *best for keyboard*
  - https://config.qmk.fm/#/test
- online, keyboard only
  - https://kbs.im/
- offline, keyboard & mouse, LED-Test, no Feedback sound, 30-day trail
  - https://www.passmark.com/products/keytest/index.php
- offline, keyboard events only, freeware by Nirsoft
  - https://www.nirsoft.net/utils/keyboard_state_view.html
