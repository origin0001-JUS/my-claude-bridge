FROM node:20

# 1. 필수 도구 'bsdutils' 설치 (가상 터미널 생성용)
RUN apt-get update && apt-get install -y git python3 make g++ bsdutils

# 2. 프로그램 설치 (하이픈 없는 cokacdir)
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 설정
ENV CI=true
ENV TERM=xterm

# 4. 실행 명령어 (script 명령어로 가상 터미널을 만들어 에러를 방지합니다)
CMD ["script", "-qec", "cokacdir start", "/dev/null"]
