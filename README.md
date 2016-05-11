<h2> Tutorial </h2>
<p align="justify">
Este projeto apresenta um classificador de documentos, criado a partir do Apache Hadoop e Apache Mahout. Criamos esta arquitetura a partir de uma plataforma Linux (Ubuntu 14) 64 bits e Docker 1.10.3. Os  procedimentos a seguir descrevem passo a passo a configuração do ambiente de classificação.
</p>
<p align="justify">
Após descarregar o projeto, entre no diretório e execute o seguinte comando para executar a build do Docker:
</p>

> docker build -t instance-name .

<p align="justify" style="padding-top: 15px;">
Certifique-se de que a build foi executada corretamente e de que todos os downloads foram executados. Agora você pode criar uma instância Docker dessa máquina. Veja:
</p>

> docker run -d -P --name instance-name instance-name

<p align="justify" style="padding-top: 15px;">
Execute o comando a seguir para descobrir a porta ssh que a instância foi disponibilizada:
</p>

> docker port instance-name

<p align="justify" style="padding-top: 15px;">
Agora você pode se conectar a instância usando ssh. A senha é: 'screencast'.
</p>

> ssh root@localhost -p ssh-port


<p align="justify" style="padding-top: 15px;">
Depois de conectar na máquina virtual, basta executar o comendo: 
</p>

> chmod 755 run.sh
> ./run.sh
