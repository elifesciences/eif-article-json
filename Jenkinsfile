elifeProcess {
    stage 'Checkout'
    checkout scm

    stage 'Generate JSON'
    sh './generate-json.sh'

    stage 'Commit and push'
    sh './auto-commit.sh'
}
