echo hello world
ls
docker stop nuvepro
docker rm -f nuvepro
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 418843764796.dkr.ecr.ap-south-1.amazonaws.com
docker pull 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:nuvepro-${BUILD_NO}
docker run -d -p 8080:8083 --name nuvepro 418843764796.dkr.ecr.ap-south-1.amazonaws.com/nuvepro:nuvepro-${BUILD_NO}
