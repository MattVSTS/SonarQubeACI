# A simple cloud-native SonarQube instance for Azure
This ARM template will deploy four resources:
- An Azure SQL Server
- An Azure SQL Database
- A Storage Account with four File Shares
- An Azure Container Instance running sonarqube:latest

The four file shares are your persistence layer for Elastic Search, extensions, the configuration file and all log files.  

SonarQube is exposed over port 9000, if you want to add a Reverse Proxy you can do so via the sidecar pattern. 

ElasticSearch is configured with ```sonar.search.javaAdditionalOpts=-Dnode.store.allow_mmapfs=false``` to prevent the following error:
```
11:27:21 ERROR: [2] bootstrap checks failed
11:27:21 [1]: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65535]
11:27:21 [2]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```   
You need to populate the variables in the  ```deploy.sh``` with your information. Once done you can run it and perform the deployment, as well as uploading the pre-configured ```sonar.properties``` file to the appropriate folder.