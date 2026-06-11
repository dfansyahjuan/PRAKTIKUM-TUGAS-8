pipeline {
    agent any 
    stages {
        stage('Clone Repository') {
            steps {
                // Di sini URL sudah dipastikan mengarah ke repositori asli Anda
                git 'https://github.com/dfansyahjuan/PRAKTIKUM-TUGAS-8.git'
            }
        }
        stage('Install Dependencies') {
            agent {
                docker { image 'php:8.1-cli' }
            }
            steps {
                sh 'echo "Mempersiapkan dependensi aplikasi..."'
                sh 'php -v'
            }
        }
        stage('Unit Test') {
            agent {
                docker { image 'php:8.1-cli' }
            }
            steps {
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Membuat Docker Image Lokal...'
                sh 'docker build -t php-app-lokal .'
                
                echo 'Menghapus container lama jika ada...'
                sh 'docker rm -f running-php-app || true'
                
                echo 'Menjalankan container aplikasi PHP di port 8085...'
                sh 'docker run -d -p 8085:80 --name running-php-app php-app-lokal'
            }
        }
    }
}
