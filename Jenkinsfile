elifeProcess {
    stage 'Checkout'
    checkout scm

    stage 'Generate JSON'
    sh './generate-json.sh'

    stage 'Commit and push'
    elifeGitAutoCommit "Automated commit", "article-json/*.json"
    def commit = elifeGitRevision()
    elifeGitMoveToBranch commit, 'master'
}
