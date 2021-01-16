pipeline {
    agent none
    environment {
        AWS_KEYS = credentials('aws')
        DOCKERHUB_KEYS = credentials('dockerhub')
        DOCKER_IMAGE_NAME = "mtwebapp"
        RELEASE_VERSION = '1.0'
        AMI_NAME_PREFIX = "mtapp-"
    }
    options {
        ansiColor('xterm')
        timestamps ()
    }
    stages {
        stage('STAGE: GITHUB') {
            steps {
                node('master') {
                    echo "Cloning the repository.."
                    git branch: 'main', changelog: false, poll: false, url: 'https://github.com/avasant21/jenkins-practice.git'
                    sh '''
                        #!/bin/bash
                        echo ""
                    '''
                }
            }
        }
        stage('BUILD: DOCKER IMAGE') {
            steps {
                node('master') {
                    echo "Building [${DOCKER_IMAGE_NAME}:${RELEASE_VERSION}].."
                    sh '''
                        #!/bin/bash
                        cd ${WORKSPACE}
                        docker build -t ${DOCKER_IMAGE_NAME}:${RELEASE_VERSION} -f docker/Dockerfile .
                    '''
                }
            }
        }
        stage('ARTIFACTS: DOCKER HUB') {
            steps {
                node('master') {
                    echo "Publishing [${DOCKER_IMAGE_NAME}:${RELEASE_VERSION}].."
                    sh '''
                        #!/bin/bash
                        docker tag ${DOCKER_IMAGE_NAME}:${RELEASE_VERSION} ${DOCKERHUB_KEYS_USR}/${DOCKER_IMAGE_NAME}:${RELEASE_VERSION}
                        docker login -u ${DOCKERHUB_KEYS_USR} -p ${DOCKERHUB_KEYS_PSW}
                        docker push ${DOCKERHUB_KEYS_USR}/${DOCKER_IMAGE_NAME}:${RELEASE_VERSION}
                        docker logout
                        docker image --prune -f -a
                    '''
                }
            }
        }
        stage('ARTIFACTS: AWS AMI') {
            steps {
                node('master') {
                    echo "Developing MTAPP AMI [${AMI_NAME_PREFIX}${RELEASE_VERSION}].."
                    sh '''
                        #!/bin/bash
                        echo ""
                    '''
                }
            }
        }
        stage('DEPLOY: AWS SERVICES') {
            steps {
                node('master') {
                    echo "Deploying [MTAPP-${RELEASE_VERSION}] in AWS Cloud Services.."
                    sh '''
                        #!/bin/bash
                        echo ""
                    '''
                }
            }
        }
    }
}
