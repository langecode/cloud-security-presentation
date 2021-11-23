#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "Project required as parameter"
    exit 42
fi

PROJECT=$1

echo "Starting Sonarqube.."

# Run sonarqube - wait a few minutes until it has started
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

echo "Waiting for Sonarqube.."
until `docker logs sonarqube | grep -q "SonarQube is up"`
do
    echo -n "."
    sleep 0.2;
done
echo "Sonarqube is up. Scanning source code.."
curl -u admin:admin -X POST "http://localhost:9000/api/users/change_password?login=admin&previousPassword=admin&password=sqDemo2021"

# Scan the source code
docker run --rm -ti -v $(pwd)/$PROJECT:/usr/src --link sonarqube -e SONAR_HOST_URL="http://sonarqube:9000" sonarsource/sonar-scanner-cli -Dsonar.projectKey=$PROJECT -Dsonar.login=admin -Dsonar.password=sqDemo2021

echo See "http://localhost:9000/dashboard?id=$PROJECT"
