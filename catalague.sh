echo -e "\e[35m downloding rpm setup file \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[35minstalling nodejs \e[0m"
yum install nodejs -y
echo -e "\e[35adding user as roboshop \e[0m"
useradd roboshop
echo -e "\e[35creating a dir \e[0m"
mkdir /app
echo -e "\e[35m downloding catalague setup file \e[0m"
curl -L -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
echo -e "\e[35mchange app dir \e[0m"
cd /app
echo -e "\e[35munzip catalague setup file \e[0m"
unzip /tmp/catalogue.zip
echo -e "\e[35mchange app dir \e[0m"
cd /app
echo -e "\e[35mnpm installation \e[0m"
npm install
echo -e "\e[35mcoping catalogue services file for roboshop \e[0m"
cp /configs/catalogue.services /etc/systemd/system/catalogue.service
echo -e "\e[35mdeamon reload \e[0m"
systemctl daemon-reload
echo -e "\e[35menabling catalague \e[0m"
systemctl enable catalogue
echo -e "\e[35mstarting catalague \e[0m"
systemctl start catalogue
echo -e "\e[35mcoping mongodb file services file for roboshop \e[0m"
cp /configs/mogodb.repo /etc/yum.repos.d/mongo.rep
echo -e "\e[35minstalling mongodb \e[0m"
yum install mongodb-org-shell -y
echo -e "\e[35mloading schema \e[0m"
mongo --host mongodb-dev.mogilipalli.online </app/schema/catalogue.js
