cd /atm/home

java -jar /atm/java/spring-format-0.1.0-SNAPSHOT-jar-with-dependencies.jar 

cat /atm/java/commit.json > "$ATOMIST_PUSH"

