FROM opensuse:leap
RUN \
    zypper install -y openssh java-1_7_0-openjdk-headless rpm-build git createrepo_c && \
    groupadd -g 484 jenkins && \
    useradd -u 486 -g jenkins -m -d /home/jenkins -p jenkins jenkins 
