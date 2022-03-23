package gowebservice

import (
	"testing"

	. "gopkg.in/check.v1"
)

func Test(t *testing.T) { TestingT(t) }

type MySuite struct{}

var _ = Suite(&MySuite{})

func (s *MySuite) TestHelloWorld(c *C) {
	result := HelloWorld()
	c.Assert(result, Matches, "Hello, World or Cedric!!!")
}
