package main

import (
	"BWA_Startup/auth"
	"BWA_Startup/handler"
	"BWA_Startup/user"
	"log"

	"github.com/gin-gonic/gin"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func main() {
	dsn := "falcon:1234567890@tcp(localhost)/db_bwastartup?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})

	if err != nil {
		log.Fatal(err.Error())
	}

	userRepository := user.NewRepository(db)
	userService := user.NewService(userRepository)
	authService := auth.NewService()

	userHandler := handler.NewUserHandler(userService, authService)

	router := gin.Default()
	api := router.Group("/api/v1")

	api.POST("/users", userHandler.RegisterUser)
	api.POST("/sessions", userHandler.Login)
	api.POST("/email_checkers", userHandler.CheckEmailAvailability)
	api.POST("/avatars", userHandler.UploadAvatar)

	router.Run(":7000")
}

/*
   middleware
   ambil nilai header Authorization: Bearer 'tokentokentoken'
   dari header Authorization, kita ambil nilai tokennya saja
   kita validasi token
   kita ambil user_id
   ambil user dari db berdasarkan user_id lewat service
   kita set context isinya user
*/
