FROM node:20

# 1. 필수 도구 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 2. 프로그램 설치 (하이픈 없이 cokacdir)
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 설정 (에러 방지용)
ENV CI=true
ENV TERM=dumb

# 4. 실행 명령어 (가장 중요한 부분: node를 빼고 cokacdir만 실행)
CMD ["cokacdir", "start"]
