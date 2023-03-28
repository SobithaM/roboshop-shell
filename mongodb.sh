echo -e "\e[35mcoping mogodb repo file for roboshop \e[0m"
cp /configs/mongodb.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[35m installing mongo-org \e[0m"
yum install mongodb-org -y
echo -e "\e[35menabling mongdb \e[0m"
systemctl enable mongod
echo -e "\e[35mstarting mongdb \e[0m"
systemctl start mongod
echo -e "\e[35mrestarting mongdb \e[0m"
systemctl restart mongod


#Update listen address from 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf
