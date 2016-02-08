package magent

import (
	"fmt"
	"github.com/labstack/echo"
	mw "github.com/labstack/echo/middleware"
)

// Magent server
// It save the http server, and keep necessary information to start server.
type Server struct {
	echo *echo.Echo
	Host string
	Port int
}

// Bootstrap magnet server
func NewServer(host string, port int) *Server {
	server := echo.New()

	server.Use(mw.Gzip())
	server.Use(mw.Recover())

	server.HTTP2(true)

	return &Server{
		echo: server,
		Host: host,
		Port: port,
	}
}

// Start the server
func (s *Server) Run() {
	address := fmt.Sprintf("%s:%d", s.Host, s.Port)
	s.echo.Run(address)
}
