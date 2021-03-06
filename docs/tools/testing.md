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
- https://webcookies.org - all-in-one security check. HTTP cookies, Flash, HTML5 localStorage, sessionStorage, CANVAS, Supercookies, Evercookies. Includes a free SSL/TLS, HTML and HTTP vulnerability
  scanner and URL malware scanner.
- https://pentest-tools.com/website-vulnerability-scanning/website-scanner - Discover common web application vulnerabilities and server configuration issues
- https://app.upguard.com/webscan - security assessment
- https://sitecheck.sucuri.net - security check & malware scanner
- https://hackertarget.com/wordpress-security-scan- wordpress security scanner
- https://securityheaders.com - CSP Header check
- https://csp-evaluator.withgoogle.com - View CSP Header of URLs(CSP Debugger)

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
