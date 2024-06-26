FROM ubuntu:18.04

# Webサーバーの動作に必要な設定
RUN apt-get update
RUN apt-get install -y apache2

RUN echo 'Hello World' > /var/www/html/index.html

# Configure apache
# Webサーバーを動かすスクリプト run_apache.sh を作成
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
    echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
    echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
    chmod 775 /root/run_apache.sh

# コンテナが利用するネットワークポートを指定
EXPOSE 80

# コンテナ実行時に動かすコマンドを指定
# 今回はWebサーバーを起動するシェルスクリプトを指定
CMD /root/run_apache.sh
