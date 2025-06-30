# pms-release

# 다운로드 파일 관리
/home/ubuntu/downloads 폴더 아래 버전별 빌드파일 관리

###### ex )
    - /home/ubuntu/downloads
    -- v.1.0.1
    --- pms-db.tar
    --- pms-web.tar
    --- pms-api.tar     
    --- package.zip     (전체 패키지)

docker run -d -p7080:80 -v /home/ubuntu/downloads:/usr/share/nginx/html/downloads vitepress-docs:latest
