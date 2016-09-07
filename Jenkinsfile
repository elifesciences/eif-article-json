elifeProcess {
    stage 'Checkout'
    checkout scm

    stage 'Generate JSON'
    sh './generate-json.sh'

    stage 'Commit and push'
    elifeGitAutoCommit "Regenerated dist/", "dist/"
    def commit = elifeGitRevision()
    elifeGitMoveToBranch commit, 'master'
}
