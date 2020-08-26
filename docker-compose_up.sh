docker-compose -f docker-compose.yml down
docker-compose -f docker-compose.yml build
docker-compose -f docker-compose.yml up -d -V --force-recreate

read -n 1 -s -r -p "Press any key to exit"