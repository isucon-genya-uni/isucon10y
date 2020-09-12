build:
	go build -o $(ISU_APPNAME)

deploy:
	GOOS=linux GOARCH=amd64 go build -o isuumo
	rsync -avzr isuumo isucon1-server:/home/isucon/isuumo/webapp/go/isuumo
	rsync -avzr isuumo isucon2-server:/home/isucon/isuumo/webapp/go/isuumo
	rsync -avzr isuumo isucon3-server:/home/isucon/isuumo/webapp/go/isuumo
	
	rsync -avzr bin/ isucon1-server:/home/isucon/isuumo/webapp/go/bin
	rsync -avzr bin/ isucon2-server:/home/isucon/isuumo/webapp/go/bin
	rsync -avzr bin/ isucon3-server:/home/isucon/isuumo/webapp/go/bin
	
	rsync -avzr ../mysql/db/0_Schema.sql isucon1-server:/home/isucon/isuumo/webapp/mysql/db
	rsync -avzr ../mysql/db/0_Schema.sql isucon2-server:/home/isucon/isuumo/webapp/mysql/db
	rsync -avzr ../mysql/db/0_Schema.sql isucon3-server:/home/isucon/isuumo/webapp/mysql/db
	HOST=isucon1-server ./restart.sh
	HOST=isucon2-server ./restart.sh
	HOST=isucon3-server ./restart.sh
