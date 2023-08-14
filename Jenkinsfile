pipeline {
    agent any
    stages {
        stage("Verifying Tooling") {
            steps {
                sh "docker version"
                sh "docker compose version"
                sh "curl --version"
                sh "jq --version"
            }
        }
        
        stage("Prune Docker Data") {
            steps {
                sh 'docker system prune -a --volumes -f'
            }
        }

        stage("Start Container") {
            steps {
                sh 'docker compose up -d --no-color --wait'
                sh 'docker compose ps'
            }
        }

        stage("Check Response") {
            steps {
                sh 'curl http://localhost'
            }
            post {
                always {
                    sh 'docker compose down --remove-orphans -v'
                    sh 'docker compose ps'
                }
            }
        }
    }
}
