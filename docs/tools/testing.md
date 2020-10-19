# tools for testing

## test websites/http

- https://github.com/hakluke/hakrawler - web crawler - `hakrawler -url google.de -plain | hakcheckurl`
- https://github.com/hakluke/hakcheckurl - HTTP Code checker for lists - `hakrawler -url google.de -plain | hakcheckurl`
- https://github.com/Rowno/medic - bulk URL status checks + comparing - `cat urls.txt | medic -p check_before.log`
- https://github.com/tomnomnom/assetfinder - find related domains and subdomains - `assetfinder target.com | hakrawler`
- https://github.com/atomicptr/crab - check status code and response time of lists - `crab crawl:list urlstocheck`