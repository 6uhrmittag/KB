# elastic stack

## general
- bind to 0.0.0.0: `server.host : 'localhost'` -> `server.host : '0.0.0.0'`

## ELK Stack
- https://www.guru99.com/elk-stack-tutorial.html -> overview
- https://medium.com/@abhidrona/elasticsearch-deployment-best-practices-d6c1323b25d7
- https://www.elastic.co/assets/blt2614227bb99b9878/architecture-best-practices.pdf
- https://medium.com/@brunoamaroalmeida/enabling-centralized-application-logging-using-the-elastic-elk-stack-from-stratch-a-15-minutes-eba501230b3d
    - https://github.com/brunoamaroalmeida/awesome-quickstart-containers/tree/master/elastic-stack
    
### https://thoughts.t37.net/designing-the-perfect-elasticsearch-cluster-the-almost-definitive-guide-e614eabc1a87
> Storage = throughput * events size * retention period.

> The caches you need to monitore are:
> 
> the indexing buffer: it is used to buffer data during the indexing process.
> the buffer_pools.

### metrics to check health
- https://www.oreilly.com/ideas/10-elasticsearch-metrics-to-watch
- https://blogs.manageengine.com/application-performance-2/appmanager/2018/10/04/key-metrics-elasticsearch-performance-monitoring.html


### nginx
- https://www.elastic.co/de/blog/playing-http-tricks-nginx
- https://gist.github.com/Dev-Dipesh/2ac30a8a01afb7f65b2192928a875aa1

# ES_PATH_CONF must be set to the configuration path
root@ip-172-31-10-132:/etc/elasticsearch/es-01# export ES_PATH_CONF=/etc/elasticsearch/es-01
root@ip-172-31-10-132:/etc/elasticsearch/es-01# /usr/share/elasticsearch/bin/elasticsearch-plugin install ingest-geoip

#geopip
probleme via puppet installation.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@     WARNING: plugin requires additional permissions     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
* java.lang.RuntimePermission accessDeclaredMembers
* java.lang.reflect.ReflectPermission suppressAccessChecks
See http://docs.oracle.com/javase/8/docs/technotes/guides/security/permissions.html
for descriptions of what these permissions allow and the associated risks.