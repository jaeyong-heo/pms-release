# 1. Node.js 이미지 사용
FROM node:20-alpine AS builder

# 2. 작업 디렉터리 설정
WORKDIR /app

# 3. 의존성 설치
COPY package*.json ./
RUN npm install

# 4. 프로젝트 복사 및 빌드
COPY . .
RUN npm run docs:build

# 5. 실제 서비스용 nginx 설정
FROM nginx:alpine

# 6. 빌드된 파일을 nginx html 폴더에 복사
# COPY --from=builder /app/.vitepress/dist /usr/share/nginx/html
COPY --from=builder /app/dist /usr/share/nginx/html

# 7. 포트 노출
EXPOSE 80

# 8. nginx 실행
CMD ["nginx", "-g", "daemon off;"]
