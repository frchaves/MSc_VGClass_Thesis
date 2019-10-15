
library('textreuse')
library('sentimentr')
# library('RSentiment')
# library('tokenizers')



##Construct_All_DataCSV.csv all answered itens
## all 20k comments 

MyData = read.csv(file = "Construct_All_DataCSV20k.csv", header=TRUE, sep =",")

################## CONSTRUCTS ############################################

extra_itens_info_quality_1 = list(c("graphics", "design", "visual", "colorful", "beautiful", "pretty", "effect", "slowdown", "4k", "color", "vibrant", "detail", 
                                    "realism", "hdr", "ultra", "high", "medium", "light", "attention"))

extra_itens_info_quality_2 = list(c("gameplay", "boring", "bland", "hilariously", "monotonous", "old", "modern", "new", "simplified", "function", "inertia",
                                    "real", "pleasure", "judge", "humor", "feature", "dynamic"))

extra_itens_info_quality_3 = list(c("bugs", "crash", "buggy", "hardware", "technical", "issue", "glitch", "bug", "reboot", "flawless", "invest", "smooth", "impression"
                                    , "nag"))

extra_itens_info_quality_4 = list(c("accurate", "controls", "tight", "precise", "combo","realistic", "fair", "clunk", "controller", "zone", "stiff", 
                                    "control", "memorizing", "button", "random", "X", "Y", "cancel", "triangle", "square", "circle", "r1", "r2", "w", "a","s","d", 
                                    "space", "list", "navigate", "trigger", "scheme"))

extra_itens_info_quality_5 = list(c("multi-platform", "mobile", "sony", "playstation", "microsoft", "xbox", "nintendo", "pc", "computer", "generation",
                                    "exclusive", "vr", "virtual", "production", "store"))

extra_itens_info_quality_6 = list(c("mechanics", "jump", "run", "shoot", "climb", "dialogue", "explosion", "explosive", "action", "combat", "fight", 
                                    "live-action", "driving", "drive", "physics", "kill", "roleplay", "throw", "target", "attack", 
                                    "sound", "song", "soundtrack", "music", "audio", "sfx", "voice", "adventure", "weather", "bullet", "fire"))

extra_itens_info_quality_7 = list(c("technical", "complex", "basic", "home", "sense of pride and accomplishment", "evolve",
                                    "reward", "microtransactions", "purpose", "mark", "choice", "main", "save", "attitude", "experience", 
                                    "artist", "micro", "transactions", "progress", "wheel", "simulator", "simulation", "cinema"))

extra_itens_info_quality_8 = list(c("enemies", "enemy", "weapon", "develop", "system", "baddies", "dead", "alive", "damage", "respawn",
                                    "npc", "catalog", "rpg", "health", "stamina", "travel", "object", "item", "secret", "easter", "egg", "rune", "style", 
                                    "death", "spawn"))


itens_info_quality = c(extra_itens_info_quality_1,extra_itens_info_quality_2, extra_itens_info_quality_3, extra_itens_info_quality_4, extra_itens_info_quality_5, 
                       extra_itens_info_quality_6,extra_itens_info_quality_7, extra_itens_info_quality_8)

construct_info_quality_counter = 0

#######In the construct System Quality

extra_itens_sys_quality_1 = list(c("lag", "delay", "performance", "broken", "wonky", "30 fps", "60 fps", "framerate", "frame", 
                                   "stable",  "slow", "animation", "peak", "impossible",  "amazing", "sheer"))

extra_itens_sys_quality_2 = list(c("tutorial", "hard", "easy", "difficult", "skill", "tree",  "hardcore", "side", "mini", "fundamental", 
                                   "mid", "core", "abilities", "root", "tough", "ez"))

extra_itens_sys_quality_3 = list(c("quest", "mission", "playthrough", "checkpoint", "save", "scene", "engaging", "interactive", "open", "world", "shallow", 
                                   "terrain", "destructible", "environment", "sandbox", "plain", "city", "location", "floor", "structure", "multiplayer", "co-op", 
                                   "coop", "landscape", "scenery", "empty", "loot", "map", "gamer", "session", "room"))

extra_itens_sys_quality_4 = list(c("paced", "casual", "flexible", "fresh",  "strategy",  "confusing", "unintuitive", "acting", "pain", 
                                   "quirk", "slug", "inventory", "punitive", "pace", "movement", "tiresome", "interface", "ui", "ux", "fast"))

extra_itens_sys_quality_5 = list(c("story", "level", "campaign", "singleplayer", "single-player", "boss", "gameover", "leader", "intro", "end",
                                   "begin", "center", "background", "history", "historical", "narrative", "lore", "universe", "freedom", "theme"))



itens_sys_quality <- c(extra_itens_sys_quality_1, extra_itens_sys_quality_2, extra_itens_sys_quality_3, extra_itens_sys_quality_4, extra_itens_sys_quality_5)

construct_sys_quality_counter = 0


########In the construct Service Quality

extra_itens_serv_quality_1 = list(c("customer support", "developer", "studio", "polish", "figure out", "fan", "dedicated server", "server", "opponent",
                                    "free content", "exclusive content", "game pass", "gamepass", "psn", "whole", "system"))

extra_itens_serv_quality_2 = list(c("patches", "updates", "updated", "outdated", 
                                    "innovative", "expansion", "sequel", "limited", "version", "backbone", "content", "iteration",
                                    "dlc", "downloadable", "remake", "series", "patch", "prequel"))

itens_serv_quality <- c(extra_itens_serv_quality_1, extra_itens_serv_quality_2)

construct_serv_quality_counter = 0


########In the construct System Usage/User intentions


extra_itens_userintent_1 = list(c("hours per week", "game hours"," h ", "longevity", "hour", "minute", "addictive", "repetitive", "time", 
                                  "bed", "mins", "quick", "pun", "week", "day", "hr", "routine", "addict"))

extra_itens_userintent_2 = list(c("total hours", "franchise", "replay", "return",  "friend", "community", 
                                  "campaign hours", "short", "long", "completion", "limit", "play", "flow"))

extra_itens_userintent_3 = list(c("knowledge", "cult", "classic", "learn", "favor",  "personality", "true", "false", 
                                  "chore", "frustrating", "industry", "gaming", "feedback", "site"))




itens_userintent <- c(extra_itens_userintent_1, extra_itens_userintent_2, extra_itens_userintent_3)

construct_userintent_counter = 0

#########In the construct User Satisfaction

extra_itens_usersatisf_1 = list(c("like", "hate", "bad", "good", "solid", "fun", "enjoyable", "quality", "inexcusable", "awful", "horrible", "dated", "perfect", 
                                  "disappoint", "outrageous",  "unapologetically", "best", "trash", "mediocre", "great", "awesome", "nonsense", "cool", "disaster", 
                                  "okay", "excellent", "poor", "entertain", "flaw", "forget", "masterpiece", "unfortunately", "mess", "mixed", "tedium",
                                  "frustation", "damn", "problem", "tedious", "lazy", "weak", "slight", "mindless", "dull", "tragic", "emphasis", "headache",
                                  "suck", "crap", "mind", "hell", "troll", "*",  "attractive", "bizarre"))

extra_itens_usersatisf_2 = list(c(" 0 "," 10 "," 100 "," 5 ", "zero", "ten","$", "€", "%", "1","2","3","4","5","6","7","8","9"))

extra_itens_usersatisf_3 = list(c("goty", "disappointment", "game of the year", "lose", "win", "overall", "better", "wrong", "overrated", 
                                  "professional", "amateur", "lack", "special", "decade", "generation", "era","goat", "buy", "pre-order", "hater", "preorder"
                                  , "fail", "epic", "nothing", "pros", "cons", "review", "comment", "love",  "critic", "seal", "candidate", "video"))

itens_usersatisf <- c(extra_itens_usersatisf_1, extra_itens_usersatisf_2, extra_itens_usersatisf_3)

construct_usersatisf_counter = 0

########In the construct Net System Benefits

extra_itens_netsysbenf_1 = list(c("successful", "solid game", "improvement", "minimum", "standards",  "functional", "success", "all", "bare",
                                  "good game", "worst game", "memorable", "rating", "above", "dull", "taste")) 

extra_itens_netsysbenf_2 = list(c("hype", "lots of hype", "year", "trailer", "delayed", "wait", "expectation", "ambition",
                                  "release", "fortune",  "impress", "fault", "expect"))

extra_itens_netsysbenf_3 = list(c("profit", "millions of dollars", "value", "price", "free", "expensive", "cheap", "product", 
                                  "purchase", "tag", "release", "millions", "huge community", "aaa", "full triple a", "dollar", "money", "euro"))

itens_netsysbenf <- c(extra_itens_netsysbenf_1, extra_itens_netsysbenf_2, extra_itens_netsysbenf_3)


#List with all the construct itens

constructs_list = list(itens_info_quality, itens_sys_quality, itens_serv_quality, itens_userintent, itens_usersatisf, 
                       itens_netsysbenf)



constructs_itens = c("IQ 1", "IQ 2", "IQ 3", "IQ 4", "IQ 5", "IQ 6", "IQ 7", "IQ 8",
                          "SQ 1", "SQ 2", "SQ 3", "SQ 4", "SQ 5", "SRVQ 1", "SRVQ 2", "UNIT 1",
                          "UNIT 2", "UNIT 3", "USAT 1", "USAT 2", "USAT 3", "NETB 1", "NETB 2","NETB 3")



#############################################################


MyTest = MyData[1]


# print(MyTest)

construct_total_list = c()
review_scores = c()
constructs_occurred = c()
review_phrases = c()

for(construct in constructs_list){
  construct_total_list = c(construct_total_list, construct)
}



# print(construct_total_list)
# 
# test_number = match(constructs_list[1][[1]][[1]], construct_total_list)
# # print(constructs_list[1][[1]])
# 
# print(constructs_list[1][[1]][[1]])
# 
# print(test_number)


avg_scores_constructs = vector(mode ="double", length = 24)
avg_scores_final = vector(mode ="double", length = 24)

avg_score_all = c()
construct_number_item = 0

# print(avg_scores_constructs)

# 1:length(MyData[,]) 

# 1:2


for (i in 1:length(MyData[,])){
  
  avg_scores_constructs = vector(mode ="double", length = 24)
  avg_scores_final = vector(mode ="double", length = 24)
  construct_number_item = 0
  
  
  for(construct_item in construct_total_list){
    
    construct_number_item = construct_number_item + 1
    
    for(word in construct_item){
     
      phrase_position = 0
      
      review_filtered = paste0(MyData[i,])
      review_filtered = gsub("\\.", "\n", review_filtered)
      review_comment = review_filtered
      
      review_filtered = textreuse::tokenize_sentences(review_filtered)
      review_filtered = get_sentences(review_filtered)
      
      
      # keyword = grepl(word, review_filtered, fixed = TRUE)
      # print(keyword)
      
      for (keyword in grepl(word, review_filtered, fixed = TRUE)){
        
        phrase_position = phrase_position + 1
        
        if(keyword == TRUE){
           
           phrase_score = sentiment(review_filtered)
           
           # print(phrase_score$sentiment)
           
           # print(construct_number_item)
           
           
           # print(avg_scores_constructs)
           # print(avg_scores_constructs[construct_number_item])
         
           avg_scores_constructs[construct_number_item] = avg_scores_constructs[construct_number_item] + phrase_score$sentiment[phrase_position]
           

          #GET CONSTRUCT_ITEM NUMBER, CALCULATE SCORE, SAVE SCORE and ADD in the position of CONSTRUCT_ITEM for that review,
       # divide all scores by the number of phrases to get avg
          
        }
      }
        
    }
    
  }
  
  review_phrases = c(review_phrases, review_comment)
  
  all_item = 0
  construct_number_item = 0


  # for (item in avg_scores_constructs){
  #   # print(length(review_filtered))
  # 
  #   construct_number_item = construct_number_item + 1
  #   all_item = sum(item)/length(review_filtered)
  #   avg_scores_final[construct_number_item] = all_item
  # 
  # }
  # print(avg_scores_final)
  
  avg_score_all = c(avg_score_all, c(avg_scores_constructs))
  # avg_score_all = c(avg_score_all, c(avg_scores_final))
    
}


# print(avg_scores_constructs)

# print(length(review_phrases))

# 
#
# 
# gc()
# 

# 
# sentiment_matrix_final = cbind(sentiment_matrix_final, df_scores)

m1 = matrix(avg_score_all, nrow = length(review_phrases), ncol=24, byrow=TRUE)

sentiment_matrix_final = data.frame (Comment = review_phrases)

sentiment_matrix_final = cbind(sentiment_matrix_final, m1)


# sentiment_matrix_final = data.frame (Comment = review_phrases, Score = avg_score_all)

# str(sentiment_matrix_final)


# Write CSV in R
write.csv(sentiment_matrix_final, file = "Score_sentiment_test.csv")