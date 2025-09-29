FROM node:18-alpine

WORKDIR /app

# Копируем package.json отдельно для кеширования
COPY package.json ./

# Устанавливаем зависимости с флагами для стабильности
RUN npm install --production --silent --no-optional

# Копируем остальные файлы
COPY . .

EXPOSE 3000

# Запускаем приложение
CMD ["node", "server.js"]
