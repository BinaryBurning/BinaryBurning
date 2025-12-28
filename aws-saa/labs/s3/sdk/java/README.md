```
mvn archetype:generate \
-DgroupId=com.mycompany.app \
-DartifactId=my-app \
-DarchetypeArtifactId=maven-archetype-quickstart \
-DarchetypeVersion=1.4 \
-DinteractiveMode=false
```

```
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_EAST_1 \
 -DarchetypeVersion=2.21.29 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```

<!-- don't have maven installed so used AI to get the below -->

```
gradle init \
 --type java-application \
 --project-name myapp \
 --package com.example.myapp
```

```
gradle init \
 --type java-library \
 --project-name myapp \
 --package com.example.myapp
```
