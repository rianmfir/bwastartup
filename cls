[1mdiff --git a/campaign/formatter.go b/campaign/formatter.go[m
[1mindex fba1af5..10dbc60 100644[m
[1m--- a/campaign/formatter.go[m
[1m+++ b/campaign/formatter.go[m
[36m@@ -1 +1,40 @@[m
 package campaign[m
[32m+[m
[32m+[m[32mtype CampaignFormatter struct {[m
[32m+[m	[32mID               int    `json:"id"`[m
[32m+[m	[32mUserID           int    `json:"user_id"`[m
[32m+[m	[32mName             string `json:"name"`[m
[32m+[m	[32mShortDescription string `json:"short_description"`[m
[32m+[m	[32mImageURL         string `json:"image_url"`[m
[32m+[m	[32mGoalAmount       int    `json:"goal_amount"`[m
[32m+[m	[32mCurrentAmount    int    `json:"current_amount"`[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mfunc FormatCampaign(campaign Campaign) CampaignFormatter {[m
[32m+[m	[32mcampaignFormatter := CampaignFormatter{}[m
[32m+[m	[32mcampaignFormatter.ID = campaign.ID[m
[32m+[m	[32mcampaignFormatter.UserID = campaign.UserID[m
[32m+[m	[32mcampaignFormatter.Name = campaign.Name[m
[32m+[m	[32mcampaignFormatter.ShortDescription = campaign.ShortDescription[m
[32m+[m	[32mcampaignFormatter.GoalAmount = campaign.GoalAmount[m
[32m+[m	[32mcampaignFormatter.CurrentAmount = campaign.CurrentAmount[m
[32m+[m	[32mcampaignFormatter.ImageURL = ""[m
[32m+[m
[32m+[m	[32mif len(campaign.CampaignImages) > 0 {[m
[32m+[m		[32mcampaignFormatter.ImageURL = campaign.CampaignImages[0].FileName[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn campaignFormatter[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mfunc FormatCampaigns(campaigns []Campaign) []CampaignFormatter {[m
[32m+[m	[32mif len(campaigns) == 0 {[m
[32m+[m		[32mreturn []CampaignFormatter{}[m
[32m+[m	[32m}[m
[32m+[m	[32mvar campaignsFormatter []CampaignFormatter[m
[32m+[m
[32m+[m	[32mfor _, campaign := range campaigns {[m
[32m+[m		[32mcampaignFormatter := FormatCampaign(campaign)[m
[32m+[m		[32mcampaignsFormatter = append(campaignsFormatter, campaignFormatter)[m
[32m+[m	[32m}[m
[32m+[m	[32mreturn campaignsFormatter[m
[32m+[m[32m}[m
[1mdiff --git a/handler/campaign.go b/handler/campaign.go[m
[1mindex a700bec..5b15b82 100644[m
[1m--- a/handler/campaign.go[m
[1m+++ b/handler/campaign.go[m
[36m@@ -33,7 +33,7 @@[m [mfunc (h *campaignHandler) GetCampaigns(c *gin.Context) {[m
 		c.JSON(http.StatusBadRequest, response)[m
 		return[m
 	}[m
[31m-	response := helper.APIResponse("List of campaigns", http.StatusOK, "success", campaigns)[m
[32m+[m	[32mresponse := helper.APIResponse("List of campaigns", http.StatusOK, "success", campaign.FormatCampaigns(campaigns))[m
 	c.JSON(http.StatusOK, response)[m
 	return[m
 }[m
