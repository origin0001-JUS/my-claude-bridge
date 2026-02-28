FROM node:20

# 1. 필수 라이브러리 설치
RUN apt-get update && apt-get install -y git python3 make g++

# 2. 프로그램 설치 (철자 cokacdir 확인 완료)
RUN npm install -g @anthropic-ai/claude-code cokacdir

WORKDIR /app

# 3. 환경 변수 강제 고정 (화면 에러 방지용 스위치들)
ENV CI=true
ENV TERM=dumb
ENV NO_COLOR=1

# 4. 실행 명령어 (표준 입력을 강제로 연결하여 크래시를 방지합니다)
CMD ["cokacdir", "start", "--no-tui"]
