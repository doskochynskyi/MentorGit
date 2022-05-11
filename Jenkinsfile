pipeline {
  agent any

  tools {nodejs "node"}

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
         echo 'test'
	 bat 'npm install npm -g'
	 bat 'npm test'
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
