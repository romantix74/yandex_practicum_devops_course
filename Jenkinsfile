pipeline {
    agent any // Выбираем Jenkins агента, на котором будет происходить сборка: нам нужен любой

    triggers {
        pollSCM('H/5 * * * *') // Запускать будем автоматически по крону примерно раз в 5 минут
    }

    tools {
        maven 'MAVEN' // Для сборки бэкенда нужен Maven
        jdk 'JDK16' // И Java Developer Kit нужной версии
        nodejs 'nodejs_path' // А NodeJS нужен для фронта
    }

    stages {
        stage('Build & Test backend') {
            steps {
                dir("backend") { // Переходим в папку backend
                    sh 'mvn package' // Собираем мавеном бэкенд
                }
            }

            post {
                success {
                    junit 'backend/target/surefire-reports/**/*.xml' // Передадим результаты тестов в Jenkins
                }
            }
        }

        stage('Build frontend') {
            steps {
                dir("frontend") {
                    sh 'npm install' // Для фронта сначала загрузим все сторонние зависимости
                    sh 'npm run build' // Запустим сборку
                }
            }
        }
        
        stage('Save artifacts') {
            steps {
                archiveArtifacts(artifacts: 'backend/target/sausage-store-0.0.1-SNAPSHOT.jar')
                archiveArtifacts(artifacts: 'frontend/dist/frontend/*')
            }

            post {
                success {
                    sh 'curl -s -X POST https://api.telegram.org/bot5933756043:AAE8JLL5KIzgrNBeTP5e-1bkbJy4YRoeGjs/sendMessage -d chat_id=-1001771539978 -d text="Алексеев Роман собрал приложение" '
                }
            }
        }
    }
}