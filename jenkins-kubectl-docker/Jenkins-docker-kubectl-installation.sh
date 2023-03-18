#Docker installation

sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker.service
sudo docker info
sudo hostnamectl set-hostname docker  
sudo usermod -aG docker ubuntu  #Adding ubuntu to the docker group. 

#Jenkins installation
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# java installation

sudo apt install openjdk-11-jre -y #verify that java was installed with java --version
sudo apt-get update -y             #If Java is not running you will have unauthorized error
sudo apt-get install jenkins -y
# Grant sudo access to jenkins user
sudo echo "jenkins ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/jenkins

# 2. Enable PasswordAuthentication in the server
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
sudo usermod -aG docker jenkins  #Adding Jenkins to the docker group.
sudo hostnamectl set-hostname jenkins
sudo su - jenkins

#Kubectl installation in the jenkins-server

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
 sudo chmod +x ./kubectl
 sudo mv ./kubectl /usr/local/bin/kubectl

#Copy the .kube/config from your kops control-plane to the jenkins. 
#mkdir .kube in jenkins, vi .kube/config and paste the copied .kube/config file.




