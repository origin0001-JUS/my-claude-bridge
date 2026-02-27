FROM node:20-slim

# 1. 필수 도구 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 2. 프로그램 설치
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 고정
ENV CI=true
ENV TERM=linux

# 4. 실행 명령어
CMD ["cokacdir", "start"]
