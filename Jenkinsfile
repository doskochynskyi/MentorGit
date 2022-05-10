pipeline {
  agent any
  stages{
    stage('checkout'){
    steps{
         echo 'Get files from git'
        git branch: 'feature/Jenkinsfile1.0', url: 'https://github.com/doskochynskyi/MentorGit.git'
        //git 'https://github.com/doskochynskyi/Jenkins.git'
      }
    }
    stage('test'){
      steps{
         echo 'install'
	 bat 'npm install'
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
