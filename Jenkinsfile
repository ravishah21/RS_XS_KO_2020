node{
    stage('Initialize'){
        def dockerHome = '/usr/local/bin/'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('GIT Check')
    {
       git credentialsId: 'git-creds', url: 'https://github.com/ravishah21/RS_XS_KO_2020.git'
    }
    stage ('Build Docker Images'){
        sh 'echo $PATH'
        sh  'docker build -t ravishah21/helloworld:v1.0 .'
    }
    stage('Push Docker image'){
       withCredentials([string(credentialsId: 'secret', variable: 'dockersecret')]) {

        sh "docker login -u ravishah21 -p ${dockersecret}"
       }
        sh 'docker push ravishah21/helloworld:v1.0'
    }
    stage ('remove old container'){
      def result = sh "docker container ls -q"
      echo result
      if ( result == null ){
          echo "No helloworld container exists"
      } else {
          echo "helloworld container exists"
          sh 'docker rm helloworld -f'
      }
    }
    stage ('add new container application'){
      sh 'docker run --name helloworld -d --publish 8081:8080  ravishah21/helloworld:v1.0'
    }
}
