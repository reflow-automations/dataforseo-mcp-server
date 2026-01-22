FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
# Dit is de bridge die NetworkChuck noemt om tools toegankelijk te maken:
CMD ["npx", "-y", "@modelcontextprotocol/inspector", "build/main/main/cli.js"]
