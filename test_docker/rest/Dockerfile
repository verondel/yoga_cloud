# Используем базовый образ Node.js 16
FROM node:16

# Устанавливаем папку приложения
WORKDIR /app

# Копируем файлы 
COPY . ./

# Устанавливаем зависимости приложения
RUN npm install

# чтобы все знали, что этот порт
EXPOSE 3001

# Запускаем приложение
CMD [ "npm", "run", "dev" ]
