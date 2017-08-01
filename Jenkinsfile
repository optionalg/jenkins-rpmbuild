pipeline {
    agent none

    stages {
        stage 'rm-old' {
            steps {
                node 'master' {
                    sh 'docker rmi jenkins-rpmbuild || true'
                }
            }
        }
        stage 'parallel-demo' {
            steps {
                parallel sles12sp2: {
                    node 'master' {
                        sh 'pwd; ls -la'
                    }
                },
                sles12sp3: {
                    node 'master' {
                        sh 'pwd; ls -la'
                    }
                }
            }
        }
        stage 'build-new' {
            steps {
                node 'master' {
                    checkout scm
                    sh 'ls -la ; docker build ./ -t jenkins-rpmbuild'
                }
            }
        }
    }
}
