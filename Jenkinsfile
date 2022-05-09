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
         echo 'test'
	 npm test
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
