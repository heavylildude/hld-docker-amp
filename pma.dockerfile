# pma.dockerfile
# This is the blueprint for our new, obedient phpMyAdmin.

# Start with the official PMA image as a base
FROM phpmyadmin/phpmyadmin

# Now, we lay down the law.
# Force our settings to be THE main php.ini. No excuses.
COPY php-overrides.ini /usr/local/etc/php/php.ini
