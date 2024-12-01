FROM gitpod/workspace-full

# Install PHP 8.1
RUN sudo add-apt-repository ppa:ondrej/php
RUN sudo apt-get update
RUN sudo apt-get install -y \
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
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN echo 'export PATH="$HOME/.symfony5/bin:$PATH"' >> ~/.bashrc

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    sudo mv composer.phar /usr/local/bin/composer

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - && \
    sudo apt-get install -y nodejs

# Install Selenium standalone
RUN sudo npm install -g selenium-standalone
RUN sudo selenium-standalone install

# Configure Xdebug
RUN echo "xdebug.mode=debug,coverage" | sudo tee -a /etc/php/8.1/cli/conf.d/20-xdebug.ini && \
    echo "xdebug.start_with_request=yes" | sudo tee -a /etc/php/8.1/cli/conf.d/20-xdebug.ini && \
    echo "xdebug.client_port=9003" | sudo tee -a /etc/php/8.1/cli/conf.d/20-xdebug.ini && \
    echo "xdebug.client_host=localhost" | sudo tee -a /etc/php/8.1/cli/conf.d/20-xdebug.ini

# Install Chrome and ChromeDriver for Selenium
RUN sudo apt-get update && \
    sudo apt-get install -y chromium-browser chromium-chromedriver

# Clean up
RUN sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*