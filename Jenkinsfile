pipeline {
    agent none

    stages {
        stage('rm-old') {
            steps {
                node('master') {
                    sh('docker rmi jenkins-rpmbuild || true')
                }
            }
        }
        stage('build-new') {
            steps {
                node('master') {
                    sh('docker build ./ -t jenkins-rpmbuild')
                }
            }
        }
    }
}
