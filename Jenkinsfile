pipeline {
    agent {
        label 'AGENT-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
        
    }
   
    stages {
        stage('Init') {
            steps {
               sh """
                cd 01-vpc
                terraform init -reconfigure
               """
            }
        }
        
        }

    stages {
        stage('Plan') {
            steps {
               sh """
                cd 01-vpc
                terraform plan
               """
            }
        }
        
        }    

    stages {
        stage('Deploy') {
            input{
                message "should we continue?"
                ok "Yes, we should ."
            }
            steps {
               sh """
                cd 01-vpc
                terraform apply -auto-approve
               """
            }
        }
        
        }        

    post {
        always {
            echo 'this code always run'
            deleteDir()
        }
        
        success {
            echo 'this will run when code success'
        }
        failure {
            echo 'this will run when code fails'
        }
    }
    }
  
  
