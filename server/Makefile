mongo:
	mongod --dbpath db/ --port 1338 &
run:
	coffee app.coffee
debug-brk: mongo
	node-inspector &
	coffee --nodejs --debug-brk app.coffee
	killall mongod
debug: mongo
	node-inspector &
	coffee --nodejs --debug app.coffee
	killall mongod
clean:
	rm *.js *~
