properties([parameters([[$class: 'ChoiceParameter', choiceType: 'PT_SINGLE_SELECT', filterLength: 1, filterable: false, name: 'Terraform_actions', randomName: 'choice-parameter-1301191851874874', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: 'return[\'Select an terraform action\', \'apply\', \'destroy\']']]], [$class: 'CascadeChoiceParameter', choiceType: 'PT_CHECKBOX', filterLength: 1, filterable: true, name: 'Terraform_destroy_options', randomName: 'choice-parameter-1301191854393341', referencedParameters: 'Terraform_actions', script: [$class: 'GroovyScript', fallbackScript: [classpath: [], sandbox: false, script: ''], script: [classpath: [], sandbox: false, script: '''def tfstate() {
    String tfstatefilepath = \'/var/lib/jenkins/workspace/aws-terraform/tfstate-donotdelete.txt\'
    File tfstatefile = new File(tfstatefilepath)
    def tfaction = []
    tfaction.add(\'all\')
    tfstatefile.eachLine {
        line -> tfaction.add(line)
    }
    return tfaction
}
if (Terraform_actions.equals(\'destroy\')) {
   tfstate()
}''']]]])])

pipeline{
    agent any

// # This is required when you need automatic tools installation through jenkins
    // tools {
    //     terraform 'terraform_0_13_5'
    //     dockerTool 'docker_latest'
    // }

    options {
        buildDiscarder(logRotator(numToKeepStr: '1'))
        //  timestamps()  - # This will print the time stamp in logs with each line
        ansiColor('xterm')
    }

    // parameters {
    //     choice(name: 'Terraform_Action', choices: ['Select an action', 'apply', 'destroy'], description: '')
    // }

    stages{
        stage('Git Secrets Scan') {
            agent {
                docker {
                    image 'gitguardian/ggshield:latest'
                }
            }
            environment {
                GITGUARDIAN_API_KEY = credentials('GITGUARDIAN_API_KEY')
            }
            steps {
                sh 'ggshield scan ci'
            }
        }

        stage("Terraform Initialization") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'AWS_CICD_ADMIN',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform init'
                }
            }
        }

            stage('Code Linting') {
            steps {
                sh 'terraform fmt'
                sh 'terraform validate'
            }
        }

        stage("Terraform plan") {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'AWS_CICD_ADMIN',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform plan'
                }
            }
        }

        stage("Terraform apply") {
            when {
                expression { params.Terraform_actions == 'apply' }
            }
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'AWS_CICD_ADMIN',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh 'terraform apply --auto-approve'
                    sh 'terraform state list > ${WORKSPACE}/tfstate-donotdelete.txt'
            }
        }
    }

        stage("Terraform destroy"){
            when {
                expression { params.Terraform_actions == 'destroy' }
            }
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS_CICD_ADMIN',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        if (Terraform_destroy_options.equals('all')) {
                            sh 'terraform destroy --auto-approve'
                            sh 'terraform state list > ${WORKSPACE}/tfstate-donotdelete.txt'
                        }
                        else {
                            sh 'terraform destroy -target=${Terraform_destroy_options} --auto-approve'
                            sh 'terraform state list > ${WORKSPACE}/tfstate-donotdelete.txt'
                        }
                    }
                }
            }
        }
    }
}
