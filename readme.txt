sudo docker build -t mining .
sudo docker run -d -P --name mining mining
sudo docker port mining
ssh root@localhost -p ssh-port
