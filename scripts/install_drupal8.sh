#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
rm ../www/.keep
docker-compose exec web sh -c "sed -i -e 's/www\/html/www\/html\/web/g' /etc/apache2/sites-enabled/000-default.conf"
docker-compose exec web sh -c "sed -i -e 's/www\/html/www\/html\/web/g' /etc/apache2/sites-enabled/default-ssl.conf"
docker-compose exec --user=1000:1000 web sh -c "composer create-project drupal/recommended-project /var/www/html/"
docker-compose exec --user=1000:1000 web sh -c "composer require drush/drush"
docker-compose exec --user=1000:1000 web sh -c 'vendor/bin/drush si standard --db-url=mysql://root:123@db/drupal8 -y'