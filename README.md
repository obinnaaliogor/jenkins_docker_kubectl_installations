What this does?

After installation:
#Add ubuntu to the docker group. 
#Add Jenkins to the docker group.
#verify that java was installed with java --version
#If Java is not running you will have unauthorized error

NOTABLE COMMANDS: 
ls -l /var/run/docker.sock 
sudo chown jenkins /var/run/docker.sock  #Change the ownership to jenkins owner.
systemctl enable jenkins

