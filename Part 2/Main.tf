 module "ec2_instance" {
   source = "terraform-aws-modules/ec2-instance/aws"

   name = "single-instance"

   instance_type          = "t3.medium"
   key_name               = "HWC"
   monitoring             = true
   vpc_security_group_ids = ["sg-12345678"]
   ami                    = "ami-0889a44b331db0194"
#   subnet_id              = "subnet-04d80b40554a2f02c" #this will change as the cloud sandbox dies every 4 hours

   tags = {
     Terraform   = "true"
     Environment = "dev"
   }
 }

resource "null_resource" "logstash" {
  provisioner "local-exec" {
    command = "Downloads/logstash-8.7.1/bin/logstash -f pipeline.yml"
    
  }
}

resource "null_resource" "install_logstash" {
  provisioner "local-exec" {
    command = <<EOT
    #script to install logstash
    
    sudo yum install -y java-1.8.0-openjdk

    
    sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch 
    echo "[logstash-8.x]" | sudo tee /etc/yum.repos.d/logstash.repo
    echo "name=Elastic repository for 8.x packages" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "baseurl=https://artifacts.elastic.co/packages/8.x/yum" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "gpgcheck=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "enabled=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "autorefresh=1" | sudo tee -a /etc/yum.repos.d/logstash.repo
    echo "type=rpm-md" | sudo tee -a /etc/yum.repos.d/logstash.repo
    sudo yum update
    sudo yum install -y logstash

    sudo systemctl start logstash
   
    sudo systemctl enable logstash

    EOT    
  }
  
}