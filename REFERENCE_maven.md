# Maven reference

```shell
# Use Maven in offline mode (-o or --offline)
mvn -o package
# Install my service module, building and installing persistence and common code first
# cd to the top of the multi-module project
mvn -pl group:project-commons,group:project-persistence,group:project-services install
# Or, a bit shorter version
mvn -pl group:project-persistence -am install
# The reverse (build & install persistence & everything that depends on it)
mvn -pl group:project-persistence -amd install
# A bit more fancy, build (and install) project-services and everything
# it depends on, while outputting to standard out and a log file
mvn -pl group:project-services -am install 2>&1 | tee build.log
# Download all of the javadocs for your dependencies
mvn dependency:resolve -Dclassifier=javadoc
# Package this module and then scp the .war's to deploy on a jboss server
mvn package && scp $(find . -name "*.war") <user>@<host name>:/srv/jboss-6.0.0/server/default/deploy/
```

##### Testing
```shell
# Clean & rebuild everything, then run 1 integration test class
mvn -Dtest=MyTestIT verify
# Since the maven lifecycle now contains an "integration-test" phase, it'll run before verify.
# http://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html
# Alternatively you could use
mvn integration-test
# In some environments, you may have to run integration tests with this form:
mvn test -Dtest=**/*IT.java
# Run 1 unit test
mvn -Dtest=MyTest#someTestMethod test

# Skip test execution
-DskipTests
# Skip test compilation step AND skip test execution
-Dmaven.test.skip=true
```
