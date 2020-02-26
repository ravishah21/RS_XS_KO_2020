node{
    stage('Initialize'){
        def dockerHome = '/usr/local/bin/'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('Scm Checkout')
    {
       git credentialsId: 'git-creds', url: 'git@bitbucket.org:vbmehtabitbucket/2020digitalinovation.git'
    }
    stage ('Build Docker Images'){
        sh 'echo $PATH'
        sh  'docker build -t vbmehtasdocker/pyapp:1.0 .'
    }
    stage('Push Docker image'){
       withCredentials([string(credentialsId: 'dockersecret', variable: 'secret')]) {

        sh "docker login -u vbmehtasdocker -p ${secret}"
       }
        sh 'docker push vbmehtasdocker/pyapp:1.0'
    }
    stage ('undeploy previous application on Dev box'){
      sh 'docker rm pyapp -f'
    }
    stage ('Run Contianer application on Dev box'){
      sh 'docker run --name pyapp -d --network jenkins --publish 8081:8080  vbmehtasdocker/pyapp:1.0'
    }
}
