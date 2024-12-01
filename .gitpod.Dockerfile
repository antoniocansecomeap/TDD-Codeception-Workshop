FROM gitpod/workspace-full

# Install PHP 8.1
RUN sudo install-packages software-properties-common
RUN sudo add-apt-repository -y ppa:ondrej/php
RUN sudo install-packages \
    php8.1 \
    php8.1-cli \
    php8.1-common \
    php8.1-curl \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-xml \
    php8.1-zip \
    php8.1-xdebug \
    php8.1-intl \
    php8.1-sqlite3

# Install Symfony CLI
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
RUN sudo install-packages symfony-cli

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN sudo install-packages nodejs

# Configure Xdebug
RUN sudo echo "xdebug.mode=debug,coverage" >> /etc/php/8.1/cli/conf.d/20-xdebug.ini
RUN sudo echo "xdebug.start_with_request=yes" >> /etc/php/8.1/cli/conf.d/20-xdebug.ini
RUN sudo echo "xdebug.client_port=9003" >> /etc/php/8.1/cli/conf.d/20-xdebug.ini
RUN sudo echo "xdebug.client_host=localhost" >> /etc/php/8.1/cli/conf.d/20-xdebug.ini

# Install Chrome and ChromeDriver
RUN sudo install-packages chromium-browser chromium-chromedriver

# Install Composer globally
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --quiet \
    && sudo mv composer.phar /usr/local/bin/composer \
    && rm composer-setup.php

# Clear cache
RUN sudo rm -rf /var/lib/apt/lists/*
