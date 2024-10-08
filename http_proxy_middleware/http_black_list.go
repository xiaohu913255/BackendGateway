package http_proxy_middleware

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/pkg/errors"
	"github.com/xiaohu913255/BackendGateway/dao"
	"github.com/xiaohu913255/BackendGateway/middleware"
	"github.com/xiaohu913255/BackendGateway/public"
	"strings"
)

// 匹配接入方式 基于请求信息
func HTTPBlackListMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {

		serverInterface, ok := c.Get("service")
		if !ok {
			middleware.ResponseError(c, 2001, errors.New("service not found"))
			c.Abort()
			return
		}
		serviceDetail := serverInterface.(*dao.ServiceDetail)

		whileIpList := []string{}
		if serviceDetail.AccessControl.WhiteList != "" {
			whileIpList = strings.Split(serviceDetail.AccessControl.WhiteList, ",")
		}
		fmt.Println("whileIpList:", whileIpList)
		blackIpList := []string{}
		if serviceDetail.AccessControl.BlackList != "" {
			blackIpList = strings.Split(serviceDetail.AccessControl.BlackList, ",")
		}
		fmt.Println("blackIpList:", blackIpList)
		if serviceDetail.AccessControl.OpenAuth == 1 && len(whileIpList) == 0 && len(blackIpList) > 0 {
			if public.InStringSlice(blackIpList, c.ClientIP()) {
				middleware.ResponseError(c, 3001, errors.New(fmt.Sprintf("%s in black ip list", c.ClientIP())))
				c.Abort()
				fmt.Println("----------")
				return
			}
		}
		c.Next()
	}
}
