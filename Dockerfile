FROM node:20-slim

# 1. 필수 도구 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 2. 클로드 코드 및 코각DIR 설치
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 강제 고정
ENV CI=true
ENV TERM=dumb

# 4. 실행 명령어 (입력 대기를 위해 표준 입력을 연결함)
CMD ["cokacdir", "start"]
