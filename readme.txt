sudo docker build -t mining .
sudo docker run -d -v /home/dextra/Downloads/text-mining:/root/shared -P --name mining mining
sudo docker port mining
ssh root@localhost -p ssh-port
