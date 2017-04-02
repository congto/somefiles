git config --global gitreview.username idan-hefetz
git config --global user.name "Idan Hefetz"
git config --global user.email idan.hefetz@nokia.com
git config --global gitreview.scheme https
git config --global gitreview.port 443
git config --global remote.gerrit.url ssh://idan-hefetz@review.openstack.org:29418/openstack/vitrage.git
git config --global remote.gerrit.fetch +refs/heads/*:refs/remotes/gerrit/*
sudo apt-get install git-review
cd /opt/stack/vitrage
cat /home/stack/.ssh/id_rsa.pub  (AND COPY TO GERRIT)
git review -s
