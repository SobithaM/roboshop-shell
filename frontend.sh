code-dir=$(pwd)
echo -e "\e[35minstalling nginx \e[0m"
yum install nginx -y
echo -e "\e[35mremoving old content  \e[0m"
rm -rf /usr/share/nginx/html/*
echo -e "\e[35mdownloding frontend content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[35mextracting downloded content \e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo -e "\e[35mcoping nginx config for roboshop \e[0m"
cp ${code-dir}/configs/ngnix-roboshop.conf /etc/nginx/default.d/roboshop.conf
echo -e "\e[35menabling nginx \e[0m"
systemctl enable nginx
echo -e "\e[35mrestart nginx \e[0m"
systemctl restart nginx



