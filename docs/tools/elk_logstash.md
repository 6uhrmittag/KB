# ELK-Stack / Logstash

A collection of notes and things to think about before using ELK-Stack.

## Notes
### Security, Permissions, Authentication
- Elasticsearch + Kibana doesn't include any security out of the box(besides binding to localhost)
- There is almost no way so secure Elasticsearch + Kibana for free without using a proxy(like nginx)
     -  Even the X-Pack alternatives require a paid license for complex permission/authentication
- Alternatives
    - https://search-guard.com
    - https://github.com/sscarduzio/elasticsearch-readonlyrest-plugin/pulls
### X-Pack / Elastic Stack Features
All enterprise-grade features require a paid subscription called X-Pack/Elastic Stack Features(newer name).
- Apparently its >4000$/node([Source](https://www.reddit.com/r/elasticsearch/comments/62n2h6/pricing_for_xpack_gold/))
- Apparently minimum 3 nodes/licenses are required([Source](https://www.reddit.com/r/elasticsearch/comments/62n2h6/pricing_for_xpack_gold/))

### Kibana
- There is no "read-only" user/dashboard without buying X-Pack

### Java
- Elastic apps require Java
    - Different Versions require different Java Versions. See: [Support Matrix](https://www.elastic.co/support/matrix#matrix_jvm)
- [Starting with Version 7, Elastic apps come with a bundled JDK](https://www.elastic.co/de/blog/elasticsearch-7-0-0-released)
    - Installing Java after installing Elasticsearch can mess up your JAVA_HOME and prevent Elastic from starting
    
### OSS - 100% Apache 2.0 App
[Starting with version 6.3, all apps exist in OSS and non OSS versions](https://www.elastic.co/de/products/x-pack/open).
- OSS apps doesn't come with the free X-Pack features
    - [OSS doesn't include the monitoring feature](https://www.elastic.co/guide/en/kibana/current/monitoring-settings-kb.html)
- [OSS and non OSS apps are in separate repositories](https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html)


### Versions
- Check compatibility with all used apps within the pipeline
- New versions can easily include breaking changes or changes in field-names
- Plugins have precise version requirements

### Plugins
- Check the required version before planning to using them

### Puppet / Configurationmanagement
#### Elasticsearch
- https://forge.puppet.com/elastic/elasticsearch
- Version 6.3 uses the concept of instances. [This feature will be dropped soon](https://github.com/elastic/puppet-elasticsearch/issues/1025).
- Check the included default configurations. The current JVM configs are not [compatible with Elasticsearch 7](https://github.com/elastic/puppet-elasticsearch/issues/1032).

#### Filebeat
- https://forge.puppet.com/slauger/filebeat
    - Supports filebeat modules
- https://forge.puppet.com/pcfens/filebeat
    - Not tried yet.
- https://forge.puppet.com/hetzner/filebeats
    - Doesn't support filebeat modules
    
### Backup& Restore


## Checklist - Questions that need answers
- [ ] Setup
- [ ] Security
- [ ] Authentication
- [ ] User-Management
- [ ] Data retention
- [ ] Backup
