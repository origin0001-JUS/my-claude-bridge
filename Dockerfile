FROM node:20-slim

# 1. 가상 터미널(PTY)을 위한 필수 도구 'expect' 추가 설치
RUN apt-get update && apt-get install -y git python3 make g++ expect

# 2. 프로그램 설치 (철자 cokacdir 확인 완료)
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 설정
ENV CI=true
ENV TERM=xterm
ENV COLUMNS=100
ENV LINES=30

# 4. 'unbuffer' 명령어를 사용하여 가상 터미널을 강제로 할당합니다.
# 이 방법이 'Raw mode' 에러를 잡는 가장 확실한 방법입니다.
CMD ["unbuffer", "cokacdir", "start"]
