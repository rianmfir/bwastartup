package transaction

import "BWA_Startup/user"

type GetCampaignTransactionsinput struct {
	ID   int `uri:"id" binding:"required"`
	User user.User
}
