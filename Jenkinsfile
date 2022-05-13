pipeline {

environment {
  imagename = "node-docker-mnt"
  registryCredential = 'azurekv...'
  dockerImage = ''
}
  agent any

  tools {nodejs "NodeJSauto"}
  
  stages{
    stage('checkout'){
    steps{
         echo 'Get files from git'
        git branch: 'feature/Jenkinsfile1.0', url: 'https://github.com/doskochynskyi/MentorGit.git'
        //git 'https://github.com/doskochynskyi/Jenkins.git'
      }
    }
    stage('Install dependencies') {
      steps {
        echo "use config nodejs to install dep"
	//bat 'npm install --global windows-build-tools'
      }
    }

    stage('test'){
      steps{
         echo 'test'
	 //bat 'npm test'
	 //bat 'npm install npm -g'
	 //bat 'npm test'
      }
    }

    stage('builddocker'){
      steps{
         echo 'build docker'
	 //script {
         //  dockerImage = docker.build imagename
         //}      
	 bat 'docker build --tag node-docker-bat .'
         //bat 'terraform apply --auto-approve'
      }
    }
    
    stage('pushimage'){
      steps{
        echo 'push image to ACR'  
	 //docker tag node-docker acrmentor.azurecr.io/node-docker:v1
         //bat 'terraform apply --auto-approve'
      }

    }


  }
}
