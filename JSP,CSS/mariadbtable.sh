-- 데이터베이스 생성 (필요한 경우)
CREATE DATABASE IF NOT EXISTS cloud_air;
USE cloud_air;

-- 'register' 테이블 생성
CREATE TABLE IF NOT EXISTS register (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 인덱스 추가 (선택적)
-- 이메일(사용자 이름)에 대한 검색 최적화를 위해 인덱스를 추가합니다.
CREATE INDEX idx_username ON register (username);

-- 사용자 권한 부여
-- 먼저 사용자가 있는지 확인하고 없으면 생성합니다. 이후 권한을 부여합니다.
GRANT INSERT, SELECT, UPDATE, DELETE ON cloud_air.register TO 'ec2-user'@'여기 본인의 IP로 수정';
GRANT ALL PRIVILEGES ON cloud_air.* TO 'ec2-user'@'여기 본인의 IP로 수정' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;


