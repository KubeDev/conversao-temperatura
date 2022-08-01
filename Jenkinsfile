pipeline {
    agent any
    environment {
        PROJECT_NAME = "conversor-temperatura"
        REPOSITORY = "gabriel2012rissi/${env.PROJECT_NAME}"
        PROJECT_VERSION = "v1.0.0"
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    // Obtendo o hash do commit atual
                    COMMIT = "${GIT_COMMIT.substring(0,8)}"
                    if ("${env.BRANCH_NAME}" == "main") {
                        IMAGE_TAG = "${env.PROJECT_VERSION}"
                    } else {
                        IMAGE_TAG = "${env.BRANCH_NAME}"
                    }
                }
            }
        }
        stage('SonarQube Analysis') {
            environment {
                sonarHome = tool 'SONAR_SCANNER'
            }
            steps {
                // SonarQube Scanner
                sh """
                   ${sonarHome}/bin/sonar-scanner -e \
                   -Dsonar.projectKey=${env.PROJECT_NAME} \
                   -Dsonar.branch.name=${env.BRANCH_NAME} \
                   -Dsonar.sources=. \
                   -Dsonar.host.url=http://sonarqube:9000 \
                   -Dsonar.login=4221c6f3ead8ddd762ef9c8615f50957e7ab1d97
                   """
            }
        }
        stage('Build Application') {
            steps {
                script {
                    appImage = docker.build("${env.REPOSITORY}:${COMMIT}", "./src")
                }
            }
        }
        stage('Run API') {
            steps {
                script {
                    // Criando a rede 'jenkins_test'
                    sh "docker network create jenkins_test-${env.BUILD_NUMBER} || true"

                    // Criando o container 'api'
                    sh """
                       docker run \
                       --detach \
                       --name app-${env.BUILD_NUMBER} \
                       --publish 8080:8080 \
                       --network jenkins_test-${env.BUILD_NUMBER} \
                       --network-alias app \
                       ${appImage.id}
                       """
                }
            }
            post {
                always {
                    echo 'Cleanning up...'

                    // Removendo o container 'api'
                    sh "docker rm -f app-${env.BUILD_NUMBER} || true"

                    sleep 10

                    // Removendo a rede 'jenkins_test'
                    sh "docker network rm jenkins_test-${env.BUILD_NUMBER} || true"
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Enviar as imagens para o repositório do Docker Hub
                    docker.withRegistry("https://registry.hub.docker.com", "dockerhub") {
                        if ("${env.BRANCH_NAME}" == "main") {
                            appImage.push("latest")
                            appImage.push("${IMAGE_TAG}")
                        } else {
                            appImage.push("${IMAGE_TAG}")
                        }
                    }
                }
            }
        }
    }
}