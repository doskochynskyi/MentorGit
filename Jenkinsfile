pipeline {

environment {
  imagename = "node-docker-mnt"
  registryCredential = 'azurekv...'
  dockerImage = ''
  BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
  FULL_BRANCH_NAME = "${GIT_BRANCH}"
  LOCAL_BRANCH_NAME = "${GIT_LOCAL_BRANCH}"
}
  agent {label 'Windows'}

  tools {nodejs "NodeJSauto"}
  
  stages{
    stage('checkout'){
    steps{
        echo 'Get files from git'
	echo BRANCH_NAME
	echo FULL_BRANCH_NAME
	echo LOCAL_BRANCH_NAME
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
         //  dockerImage = docker.build ("${imagename}:${env.BRANCH_NAME}")
         //}      
	 bat 'docker build --tag %imagename%:%BRANCH_NAME% .'
      }
    }
    
    stage('pushimage'){
      steps{
        echo 'push image to ACR'  
	bat 'az login --identity'
	bat 'az acr login --name acrmentor'
	bat 'docker tag %imagename%:%BRANCH_NAME% acrmentor.azurecr.io/%imagename%:%BRANCH_NAME%'
	bat 'docker push acrmentor.azurecr.io/%imagename%:%BRANCH_NAME%'

        //docker.withRegistry('https://acrmentor.azurecr.io') {

        //def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        //dockerImage.push()
        //}
        //bat 'terraform apply --auto-approve'
      }

    }

    stage('set tag'){
      steps{
        echo 'set tag'
	  script {
                    DEV_TAG = powershell returnStdout: true, script: 'git rev-parse --short HEAD'

                }
          echo DEV_TAG
	  script {
	      //git config user.name 'Ivan'
              powershell returnStdout: true, script: 'git config user.email 'ivan.doskochynskyi@gmail.com''
              //git tag -a DEV_TAG 
                
          }
        //DEV_TAG = bat 'git rev-parse --short HEAD'
	//echo %DEV_TAG%
        //TAG = git rev-parse --short HEAD
        //echo $TAG
        //echo %TAG%
      }
    }

    stage('deploy'){
      steps{
	echo 'deploy step'
        //bat 'az container create --resource-group RGContainer --name nodemnt --image acrmentor.azurecr.io/%imagename%:%BRANCH_NAME% --acr-identity eea7fecd-81d4-4cc8-9943-d4769d3d46c8 --dns-name-label nodemnt --ports 80'
      }
    }

  }
}
