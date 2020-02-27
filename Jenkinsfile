node{
    stage('Initialize'){
        def dockerHome = '/usr/local/bin/'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
    stage('GIT Check')
    {
       git credentialsId: '47139ef4-ee07-46d8-ba1a-80e4700e21ba', url: 'https://github.com/ravishah21/RS_XS_KO_2020.git'
    }
    stage ('Build Docker Images'){
        sh 'echo $PATH'
        sh  'docker build -t docker build - < Dockerfile -t ravishah21/helloworld:v1 .'
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
