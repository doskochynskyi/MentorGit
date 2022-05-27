pipeline {

environment {
  imagename = "node-docker-mnt"
  registryCredential = 'azurekv...'
  dockerImage = ''
  BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
  FULL_BRANCH_NAME = "${GIT_BRANCH}"
  LOCAL_BRANCH_NAME = "${GIT_LOCAL_BRANCH}"
  GIT_COMMIT_SHORT = GIT_COMMIT.substring(0, 7)
}
  agent {label 'Windows'}

  tools {nodejs "NodeJSauto"}
  
  stages{
    stage('checkout'){
    steps{
        echo 'Get files from git'
	echo GIT_URL
	echo GIT_COMMIT
	echo GIT_COMMIT_SHORT
	echo BRANCH_NAME
	echo FULL_BRANCH_NAME
	echo LOCAL_BRANCH_NAME
        git branch: BRANCH_NAME, url: GIT_URL
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
	 bat 'docker build --tag %imagename%:%GIT_COMMIT_SHORT% .'
      }
    }
    
    stage('pushimage'){
      steps{
        echo 'push image to ACR'  
	//bat 'az login --identity'
	//bat 'az acr login --name acrmentor'
	bat 'docker tag %imagename%:%GIT_COMMIT_SHORT% acrmentor.azurecr.io/%imagename%:%GIT_COMMIT_SHORT%'
	bat 'docker push acrmentor.azurecr.io/%imagename%:%GIT_COMMIT_SHORT%'

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
          echo '${DEV_TAG}'
	  powershell returnStdout: true, script: '''
	      set-content start.txt 'tag section started'
              git config user.name 'Ivan'
              git config user.email 'ivan.doskochynskyi@gmail.com'
	      set-content setlocal.txt 'set tag in local repo'
              git tag -a $env:GIT_COMMIT_SHORT -m "jenkins tag"
              set-content startpush.txt 'start push tag to remote repo'
	      #git push origin --tags
              set-content finishpush.txt 'finish push tag to remote repo'
          '''
          
	  /*
	  withCredentials([usernamePassword(credentialsId: 'UsernamePwDoskochynskyiGit', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME', gitToolName: 'GitAuto')]) {
	       powershell 'set-content withcred.txt $env:GIT_USERNAME'
	       powershell 'git push https://$env:GIT_USERNAME`:$env:GIT_PASSWORD@github.com/doskochynskyi/MentorGit.git --tags'
	       //powershell 'set-content withcredpush.txt https://$env:GIT_USERNAME`:$env:GIT_PASSWORD@github.com/doskochynskyi/MentorGit.git '
                      //powershell ('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@GIT_URL')
          }
          */

	  withCredentials([gitUsernamePassword(credentialsId: 'tokenforjenkins', gitToolName: 'GitAuto')]) {
              powershell 'git push  https://github.com/doskochynskyi/MentorGit.git $env:GIT_COMMIT_SHORT'
          }

          withCredentials([gitUsernamePassword(credentialsId: 'tokenforjenkins', gitToolName: 'GitAuto')]) {
              powershell '''
		rmdir IaC -Recurse -Force 
		mkdir IaC
		cd IaC
		git clone  https://github.com/doskochynskyi/MentorIaC.git
		#git pull origin
		cd MentorIaC
                git config user.name 'Ivan'
                git config user.email 'ivan.doskochynskyi@gmail.com'
		git checkout dev
		set-content Ansible.yaml $env:GIT_COMMIT_SHORT
		git add .
		git commit -m "Add new commit"
		git push origin dev
		'''
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
