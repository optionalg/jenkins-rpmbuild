pipeline {
    node('master') {
        stage("rm-old") {
            sh('docker rmi jenkins-rpmbuild || true')
        }
        stage("build-new") {
            sh('docker build -t jenkins-rpmbuild')
        }
    }
}
