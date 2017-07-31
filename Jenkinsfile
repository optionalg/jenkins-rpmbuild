pipeline {
    agent none

    stages {
        stage('rm-old') {
            steps {
                sh('docker rmi jenkins-rpmbuild || true')
            }
        }
        stage('build-new') {
            steps {
                sh('docker build -t jenkins-rpmbuild')
            }
        }
    }
}
