node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
       sh 'docker build -t localhost:5000/${JOB_NAME}:latest -f Dockerfile .'
    }

    stage('Push image') {
       sh 'docker push localhost:5000/${JOB_NAME}:latest'
       sh 'docker rmi localhost:5000/${JOB_NAME}:latest'
       
        }
    }
}
