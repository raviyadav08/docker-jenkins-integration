pipeline {
    agent any
    tools {
        maven 'Maven3.6.0'
        jdk 'openjdk-11'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
		
	stage('SCM Checkout'){
		steps{
			git "https://github.com/raviyadav08/docker-jenkins-integration"
			}
		}
		
		
        stage ('Build') {
            steps {
                sh "mvn -version"
		sh "mvn clean install"
		sh "mvn package"				
            }
            post {
		    always{
				cleanWs()
				}	
            }
        }
    }
}
