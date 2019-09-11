pipeline {
    agent any
    parameters {
        string(name: 'project_name', defaultValue: 'Packer Pipeline', description: 'Jenkins Pipeline for terraform?')
    }
    environment {
        terraform_version = '0.11.11'
        packer_version = '1.4.3'
        access_key = 'input_your_access_key'
        secret_key = 'input_your_secret_key'
    }
    stages {
          stage('Install Terraform') {
              steps {
                    sh "sudo yum install wget zip -y"
                    sh "sudo cd /tmp"
                    sh "sudo curl -o bin_terraform.zip https://releases.hashicorp.com/terraform/'$terraform_version'/terraform_'$terraform_version'_linux_amd64.zip"
                    sh "ls -l; pwd;sudo unzip -o bin_terraform.zip"
                    sh "sudo mv terraform /usr/bin"
                    sh "sudo rm -rf bin_terraform.zip"
                    sh "sudo terraform version"
              }
          }
          stage('Install Packer') {
              steps {
                    sh "sudo yum install wget zip -y"
                    sh "cd /tmp"
                    sh "curl -o bin_packer.zip https://releases.hashicorp.com/packer/$packer_version/packer_'$packer_version'_linux_amd64.zip"
                    sh "unzip bin_packer.zip"
                    sh "sudo mv packer /usr/bin"
                    sh "rm -rf bin_packer.zip"
                    sh "packer version"
              }
          }
          stage('code checkout') {
               steps {
                    git branch: 'master', url: 'https://github.com/aleti-pavan/packer-ansible-terraform-demo.git'
                    }
          }
          stage('Build AMI') {
                steps {
                    dir('./packer'){
                     sh 'packer build template.json'
                    }
                }
          }
          stage('Deploy??') {
                steps {
                    script {
                       timeout(time: 2, unit: 'MINUTES') {
                          input(id: "Deploy Gate", message: "Want to Destroy ${params.project_name}?", ok: 'Deploy??')
                       }
                    }
                }
          }
         stage('Terraform Deploy'){
             steps {
                 dir('./terraform'){

                 sh  """
                     terraform init; terraform plan; terraform apply -auto-approve -input=false
                     """

                 }

             }
         }
    }
}
