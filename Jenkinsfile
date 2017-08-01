pipeline {
    agent none

    stages {
        stage('rm-old') {
            steps {
                node('master') {
                    checkout scm
                    sh('docker rmi jenkins-rpmbuild || true')
                }
            }
        }
        stage('parallel-demo') {
            steps {
                parallel Dockerfile: {
                    node('master') {
                        checkout scm
                        sh('cat Dockerfile')
                    }
                },
                Jenkinsfile: {
                    node('master') {
                        checkout scm
                        sh('cat Jenkinsfile')
                    }
                }
            }
        }
        stage('build-new') {
            steps {
                node('master') {
                    sh('ls -la ; docker build ./ -t jenkins-rpmbuild')
                }
            }
        }
    }
}
