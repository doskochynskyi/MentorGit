pipeline {
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
	 bat 'npm test'
	 //bat 'npm install npm -g'
	 //bat 'npm test'
      }
    }
    stage('apply'){
      steps{
         echo 'apply'
         //bat 'terraform apply --auto-approve'
      }
    }
  }
}
