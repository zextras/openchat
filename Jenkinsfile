pipeline {
    agent {
        node {
            label 'nodejs-agent-v1'
        }
    }
    environment {
        JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Dfile.encoding=UTF8 -Duser.timezone=Europe/Rome"
        TZ="Europe/Rome"
    }
    stages {
        stage('Make') {
            steps {
                sh '. $NVM_DIR/nvm.sh && make all'
            }
        }
    }
}
