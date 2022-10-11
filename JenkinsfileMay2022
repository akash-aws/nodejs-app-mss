pipeline {
	agent {
		node {
			label "built-in"
			customWorkspace "/mnt/aexonic"
		}
	}
	tools {
		nodejs 'nodejs'
	}
	environment {
		tag = "$BUILD_ID"
		PORT = "100$BUILD_ID"
	}
	stages {
		stage ('SCM checkout') {
			steps {
				git 'https://github.com/akash-aws/nodejs-app-mss.git'
			}
		}
		stage('build-image') {
            steps {
				sh '''service docker start
					docker build -t akash7775/nodejs:$tag .'''
            }
        }
		stage('push-image') {
            steps {
			withCredentials([string(credentialsId: 'Dockerpwd', variable: 'DOCKER')]){
			    sh "docker login -u akash7775 -p ${DOCKER}"
                sh 'docker push akash7775/nodejs:$tag'
			}
			}
		}
		stage('RUN-CONTAINER') {
            steps {
				sh '''docker run -itd -p $PORT:9981 --name akash$tag akash7775/nodejs:$tag'''
            }
        }
	}
}



