# Cloud_courses_project

INTRODUCTION

The purpose of this project is to:
  - automatically create a scaleway server using Terraform
  - automatically configure this server in order to install Wordpress on it using Ansible
  - create an image of this server and reuse it using Packer

The final result of my project can be found there http://51.158.162.35/

# Terraform

I first created a main.tf file which is the configuration file, then to hide the Organization Id and my private Token I created a var.tf and a var.tfvars file. As the content of the var.tfvars is private you will need to create your own and complete it like this:

token="XXXXX"

organization="XXXXX"

Then you can run the Terraform commands as following:

  - terraform init 
  
  - terraform plan -var-file="var.tfvars" 
  
  - terraform apply -var-file="var.tfvars"
  
Your Scaleway server should now be created and usable for the next step.
  
# Ansible
  
I first wrote the Ansible playbook to deploy Wordpress on my server, which is highly inspired by this tutorial https://www.digitalocean.com/community/tutorials/how-to-automate-installing-wordpress-on-ubuntu-14-04-using-ansible.

(if you just created a server using the Terraform commands above, you will need to update the hosts file)

Then to apply the playbook's content:

  ansible-playbook -i hosts -l playbook.yml

Now, you should be able to access the Wordpress webpage when typing in a browser the IP address of the server you just created.

# Packer

To build a reusable image of your server you can type the following command: (be aware of putting the sensitiv data as environment variables)
 
  packer build  scaleway-cloud-courses.json

You can verify the creation of this image on your scaleway account, when used, it should display the Wordpress homepage, and you will be able to custom it as you wish.
