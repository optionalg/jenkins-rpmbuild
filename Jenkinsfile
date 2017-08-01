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
        stage('parallel-demo') {
            steps {
                parallel sles12sp2: {
                    node('master') {
                        sh('echo This might be executed on sles12sp2')
                    }
                },
                sles12sp3: {
                    node('master') {
                        sh('echo This might be executed on sles12sp3')
                    }
                }
            }
        }
        stage('build-new') {
            steps {
                node('master') {
                    checkout scm
                    sh('ls -la ; docker build ./ -t jenkins-rpmbuild')
                }
            }
        }
    }
}
