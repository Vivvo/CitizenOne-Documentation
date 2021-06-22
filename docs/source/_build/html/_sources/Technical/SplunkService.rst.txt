Splunk Service
===============

Glossary
********
- **SPLUNK:** Software used for searching monitoring and analyzing big data. 
- **HEC:** HTTP Event Controller enables you to send data events to splunk deployments over https using a token-based authentication model. 
- **TLS:** Transport Layer Security is a cryptographic protocol that provides end-to-end communications security over networks and is widely used for internet communications and online transactions.
- **AUDIT DATABASE:** Holds all audited events in a given C1 instance.



About the Service
******************

We created a service which pushes new logs to a Splunk instance. The service itself is fairly straightforward. It simply polls the Audit Database for new logs every 5 seconds. Upon a new log, the service wraps the logs into a Splunk Event Dto and forwards to a Splunk Event Collector. Of course all the communication TLS'd. Meaning, we communicate with the Splunk service via a certificate provided by customer. The call also needs a HEC key or token as authorization for token Splunk.
