cd /atm/home

java -jar ../spring-format-0.1.0-SNAPSHOT-jar-with-dependencies.jar 

cat ../commit.json > "$ATOMIST_PUSH"

