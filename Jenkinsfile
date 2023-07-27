// pipeline {
//     agent {
//         docker {
//             image 'maven:latest'
//             args '-v /root/.m2:/root/.m2'
//         }
//     }
//     options {
//         skipStagesAfterUnstable()
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 sh 'mvn -B -DskipTests clean package'
//             }
//         }
//         stage('Test') {
//             steps {
//                 sh 'mvn test'
//             }
//             post {
//                 always {
//                     junit 'target/surefire-reports/*.xml'
//                 }
//             }
//         }
//         stage('Deliver') {
//             steps {
//                 sh './jenkins/scripts/deliver.sh'
//             }
//         }
//     }
// }

// using tools
pipeline {
  agent any
  environment {
    registry = "randyaji/spring-maven-app"
    registryCredential = 'randyaji'
    dockerImage = ''
    }
  tools {
    maven 'maven-3.9.0'
    jdk 'java-17'
  }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean package'
	    archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
      }
    }
    stage('Building our image') {
      steps {
    script {
      dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
    }
    }
    stage('Deploy our image') {
       steps{
    script {
       docker.withRegistry( '', registryCredential ) {
       dockerImage.push()
            }
            }
       }
        }
    }
}