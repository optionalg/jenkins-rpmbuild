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
        parallel {
            stage('list-ws') {
                steps {
                    node('master') {
                        sh('pwd; ls -la')
                    }
                }
            }
            stage('co-list-ws') {
                steps {
                    node('master') {
                        checkout scm
                        sh('pwd; ls -la')
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
