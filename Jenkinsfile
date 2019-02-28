pipeline {
    agent {
        node {
            label 'nodejs-agent-v1'
        }
    }
    stages {
        stage('Make') {
            steps {
                sh '. $NVM_DIR/nvm.sh && make all'
            }
        }
    }
}
