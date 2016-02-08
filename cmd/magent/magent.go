package main

import (
	"github.com/elct9620/magent"
)

// Start magent server
// It didn't provide daemon mode, and suggest run inside docker.
func main() {

	// TODO(elct9620): Load environment and setup server

	server := magent.NewServer("0.0.0.0", 8080)
	server.Run()

	// TODO(elct9620): Graceful down the server, do something after server is down

}
