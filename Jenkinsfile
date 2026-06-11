pipeline {
    agent any 
    stages {
        stage('Clone Repository') {
            steps {
                // a) Clone repo
                git 'https://github.com/USERNAME_GITHUB_ANDA/php-app.git'
            }
        }
        stage('Install Dependencies') {
            agent {
                docker { image 'php:8.1-cli' }
            }
            steps {
                // b) Simulasi instalasi dependensi / pembersihan lingkungan
                sh 'echo "Menyiapkan dependensi PHP..."'
                sh 'php -v'
            }
        }
        stage('Unit Test') {
            agent {
                docker { image 'php:8.1-cli' }
            }
            steps {
                // c) Jalankan unit test sederhana
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
        stage('Deploy') {
            steps {
                // d) Deploy aplikasi menggunakan Docker image lokal di host Windows
                echo 'Membangun Docker Image Lokal...'
                sh 'docker build -t php-app-lokal .'
                
                echo 'Membersihkan container lama jika ada...'
                sh 'docker rm -f running-php-app || true'
                
                echo 'Menjalankan container PHP baru di port 8085...'
                sh 'docker run -d -p 8085:80 --name running-php-app php-app-lokal'
            }
        }
    }
}