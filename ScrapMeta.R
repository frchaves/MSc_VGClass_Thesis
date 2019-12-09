#Loading the rvest package
library('rvest')

#Specifying the url for desired website to be scraped
#Example
# url <- 'https://www.metacritic.com/game/xbox-one/crackdown-3/user-reviews?sort-by=most-helpful&num_items=100'


#LIST OF GAMES
# url = 'https://www.metacritic.com/game/playstation-4/red-dead-redemption-2/user-reviews?page='

# https://www.metacritic.com/game/playstation-3/the-last-of-us/user-reviews?page=18

# https://www.metacritic.com/game/pc/no-mans-sky/user-reviews?page=6

# https://www.metacritic.com/game/pc/the-elder-scrolls-v-skyrim/user-reviews?page=23

# https://www.metacritic.com/game/pc/the-witcher-3-wild-hunt/user-reviews?page=14

# https://www.metacritic.com/game/pc/anthem/user-reviews?page=12

# https://www.metacritic.com/game/pc/minecraft/user-reviews?page=12

# https://www.metacritic.com/game/pc/league-of-legends/user-reviews?page=8

# https://www.metacritic.com/game/pc/duke-nukem-forever/user-reviews?page=

# https://www.metacritic.com/game/switch/the-legend-of-zelda-breath-of-the-wild

# https://www.metacritic.com/game/wii-u/the-legend-of-zelda-breath-of-the-wild

# https://www.metacritic.com/game/pc/grand-theft-auto-v/user-reviews?page=7

# https://www.metacritic.com/game/playstation-4/uncharted-4-a-thiefs-end/user-reviews?page=17

"OCARINA OF TIME"


url = 'https://www.metacritic.com/game/playstation-4/dishonored-2/user-reviews?page='


#Size of all reviews pages 
size_pages = 1

review_aux_all_data = c()


for (i in 0:size_pages){
  
  url_new = paste(url, i, sep ='')
  


#Reading the HTML code from the website
webpage <- read_html(url_new)

#Using CSS selectors to scrap the review grade section

#Review Grades
review_grade_data_html <- html_nodes(webpage,'.review_grade')


########### FOR EXTENSIVE REVIEWS #################
# review_grade_data_html = html_nodes(webpage, '.indiv')

#####################################################

#Review Comments
review_c_data_html <- html_nodes(webpage,'.review_body')

#reviews_data_html <- html_nodes(webpage,'.review_grade')


#Converting the ranking data to numeric
review_g_data <- html_text(review_grade_data_html)
review_g_data <- as.numeric(review_g_data)


#Converting the review comments data to text
review_c_data <- html_text(review_c_data_html)

review_c_data <- gsub("\n","",review_c_data)


review_c_data = tolower(review_c_data)


#review_c_data <- gsub(" ","",review_c_data)

review_g_data = review_g_data[!is.na(review_g_data)]


#Cycle to clean unnecessary data in the review grade data
for (val in review_g_data){
  if(val > 10){
    review_g_data = review_g_data [review_g_data != val]
  }
}

########### FOR EXTENSIVE REVIEWS #################
# 
# for (val in review_g_data){
#   if(val < 10){
#     review_g_data = review_g_data [review_g_data != val]
#   }
# }
##################################################


review_c_data = review_c_data[2:(length(review_g_data)+1)]

review_aux = c()

if(length(review_g_data) == length(review_c_data)){
  for (i in 1:length(review_g_data)){
    review_aux = c(review_aux, paste(review_g_data[i], review_c_data[i]))
    
  }
}



review_aux_all_data = c(review_aux_all_data, review_aux)

}



review_c_data = review_aux_all_data


# 1) Constructs with the keywords (Slang):
# 2) Counters to see how many times the keywords appear in the reviews data


####### in the construct Information Quality

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

construct_netsysbenf_counter = 0  


# Data filter of the construct_data into separate vectors (constructs countings)

len_itens_info_quality = length(itens_info_quality)
len_itens_sys_quality = length(itens_sys_quality)
len_itens_serv_quality = length(itens_serv_quality)
len_itens_userintent = length(itens_userintent)
len_itens_usersatisf = length(itens_usersatisf)
len_itens_netsysbenf = length(itens_netsysbenf)


# Vector with all the numerated itens (dynamic)
vec_num_itens = c()

for (i in 1:len_itens_info_quality){
  vec_num_itens = c(vec_num_itens, paste("IQ", as.character(i)))
}


for(i in 1:len_itens_sys_quality){
  vec_num_itens =  c(vec_num_itens, paste("SQ", as.character(i)))
}

for(i in 1:len_itens_serv_quality){
  vec_num_itens =  c(vec_num_itens, paste("SRVQ", as.character(i)))
}

for(i in 1:len_itens_userintent){
  vec_num_itens =  c(vec_num_itens, paste("UINT", as.character(i)))
}

for(i in 1:len_itens_usersatisf){
  vec_num_itens =  c(vec_num_itens, paste("USAT", as.character(i)))
}

for(i in 1:len_itens_netsysbenf){
  vec_num_itens =  c(vec_num_itens, paste("NETB", as.character(i)))
}

end_vect_num_itens = length(vec_num_itens)


#Finds every slang word of construct in the comments section

#List with all the construct itens
constructs_list = list(itens_info_quality, itens_sys_quality, itens_serv_quality, itens_userintent, itens_usersatisf, 
                       itens_netsysbenf)


# Vector with all constructs itens, corresponding word count for each item and total word count for that construct
constructs_data = c()


all_countings = c()

sameset = c()
aux_set = c(FALSE)

resultset = c(FALSE)
result_aux_set = c(FALSE)

vec_itens_counter = 0


testcomb = grepl(c("Graphics", "solid game"), review_c_data, fixed=TRUE)
testcomb2 = grepl(c("solid game"), review_c_data, fixed=TRUE)


for (construct in constructs_list){
  
  construct_counter = 0
  
  # List with counters for each slang word of a construct
  each_slang_counters = c()
  last_slangword = 0
  
  for (slang in construct){
      
    resultset = c(FALSE)
    result_aux_set = c(FALSE)  
    
      slang_counter = 0
      
      current_slangword = slang
      
      if(length(slang) > 1){
        
        
        
        # print(length(slang))
        
        subword_counter = 0

      for(subword in slang){
        
        # 
        # resultset = c(FALSE)
        # result_aux_set = c(FALSE)
        
        itemfound = FALSE
        
        
        current_slangword = subword
        
        # print(subword)
        
        if(subword_counter == 0){
          vec_itens_counter = vec_itens_counter + 1
          all_countings = c(all_countings, vec_num_itens[vec_itens_counter])
          
          # print(all_countings)
          
        }  
        
        for(keyword in grepl(subword, review_c_data, fixed=TRUE)){
          # print(subword)
          if (keyword == TRUE){
            
            # print(slang)
            # print(subword)
            
            #Nothing for now (?)
            construct_counter = construct_counter + 1
            slang_counter = slang_counter + 1
            
            itemfound = TRUE
          }
          
        
        
        sameset = c(sameset, itemfound)
        

          if(length(sameset) == length(review_c_data)){
        
          # (last_slangword != 0)
          # if(subword_counter != 0){
          # print(current_slangword)
          # print(last_slangword)
          
          last_slangword = current_slangword
          

          
          # print(sameset)
          # print(aux_set)
          result_aux_set = (aux_set | sameset)

          # print("result_aux_set")
          # print(result_aux_set)
          
          # result_double_aux = result_aux_set
          # resultset = (resultset | FALSE)
          # print("resultset")
          # print(resultset)
          resultset = (resultset | result_aux_set)
          # resultset = c(resultset)
          
          # print("resultset")
          # print(resultset)
          
          aux_set = sameset
          # print(aux_set)
          sameset = c()
          # print(last_slangword)
          
        }

        # print("resultset")
        # print(resultset)
        
        itemfound = FALSE
        
        }

        subword_counter = subword_counter + 1
      }
        all_countings = c(all_countings, resultset)
        

    }else{
    
    # print(slang)  
      
    for (keyword in grepl(slang, review_c_data, fixed=TRUE)){
      
      if (keyword == TRUE){
        
        # print(slang)

        construct_counter = construct_counter + 1
        slang_counter = slang_counter + 1
        
            }
      
      if(current_slangword != last_slangword){
        last_slangword = current_slangword
        # all_countings = c(all_countings, ".")
        vec_itens_counter = vec_itens_counter + 1
        all_countings = c(all_countings, vec_num_itens[vec_itens_counter])
        
        }
      all_countings = c(all_countings, keyword)
      }
    }
      
      each_slang_counters = c(each_slang_counters, slang_counter)
      # print(each_slang_counters)
  }
  
  constructs_data = c(constructs_data, construct)
  constructs_data = c(constructs_data, each_slang_counters)
  constructs_data = c(constructs_data, "total")
  constructs_data = c(constructs_data, construct_counter)
}



#The endpoint of each construct data information

end_itens_info_quality = len_itens_info_quality+len_itens_info_quality+2
end_itens_sys_quality = end_itens_info_quality + (2*len_itens_sys_quality + 2)
end_itens_ser_quality = end_itens_sys_quality + (2*len_itens_serv_quality + 2)
end_itens_userintent = end_itens_ser_quality + (2*len_itens_userintent + 2)
end_itens_usersatisf = end_itens_userintent + (2* len_itens_usersatisf + 2)
end_itens_netsysbenf = end_itens_usersatisf + (2* len_itens_netsysbenf + 2)


# The counting of every word of each construct and total word counting in a construct
  
countings_itens_info_quality = constructs_data[(len_itens_info_quality+1):end_itens_info_quality]
countings_itens_sys_quality = constructs_data[(end_itens_info_quality+len_itens_sys_quality +1):end_itens_sys_quality]
countings_itens_serv_quality = constructs_data[(end_itens_sys_quality+len_itens_serv_quality +1): end_itens_ser_quality]
countings_itens_userintent = constructs_data[(end_itens_ser_quality+ len_itens_userintent +1): end_itens_userintent]
countings_itens_usersatisf = constructs_data[(end_itens_userintent+ len_itens_usersatisf +1): end_itens_usersatisf]
countings_itens_netsysbenf = constructs_data[(end_itens_usersatisf+ len_itens_netsysbenf +1): end_itens_netsysbenf]


# Split filter of every word of each construct and total word counting

countings_itens_info_quality = countings_itens_info_quality[1:len_itens_info_quality]
countings_itens_sys_quality = countings_itens_sys_quality[1:len_itens_sys_quality]
countings_itens_serv_quality = countings_itens_serv_quality[1:len_itens_serv_quality]
countings_itens_userintent = countings_itens_userintent[1:len_itens_userintent]
countings_itens_usersatisf = countings_itens_usersatisf[1:len_itens_usersatisf]
countings_itens_netsysbenf = countings_itens_netsysbenf[1:len_itens_netsysbenf]

# print(countings_itens_sys_quality)
# print(countings_itens_usersatisf)
# print(countings_itens_netsysbenf)

#Find the construct with the most words to fill the others with NAs in order to create the data frame

biggest_size = max(len_itens_info_quality, len_itens_sys_quality, len_itens_serv_quality,
              len_itens_userintent, len_itens_usersatisf, len_itens_netsysbenf)

#Dummy itens vectors filled with NAs

dummy_itens_info_quality = vector(length= biggest_size)
dummy_itens_sys_quality = vector(length= biggest_size)
dummy_itens_serv_quality = vector(length= biggest_size)
dummy_itens_userintent = vector(length= biggest_size)
dummy_itens_usersatisf = vector(length= biggest_size)
dummy_itens_netsysbenf = vector(length= biggest_size)


#Dummy countings vectors filled with NAs

dummy_countings_itens_info_quality = vector(length= biggest_size)
dummy_countings_itens_sys_quality = vector(length= biggest_size)
dummy_countings_itens_serv_quality = vector(length= biggest_size)
dummy_countings_itens_userintent = vector(length= biggest_size)
dummy_countings_itens_usersatisf = vector(length= biggest_size)
dummy_countings_itens_netsysbenf = vector(length= biggest_size)

#Dumping true values into the empty dummy vectors

dummy_itens_info_quality[1:len_itens_info_quality] = itens_info_quality 
dummy_itens_sys_quality[1:len_itens_sys_quality] = itens_sys_quality
dummy_itens_serv_quality[1:len_itens_serv_quality] = itens_serv_quality
dummy_itens_userintent[1:len_itens_userintent] = itens_userintent
dummy_itens_usersatisf[1:len_itens_usersatisf] = itens_usersatisf
dummy_itens_netsysbenf[1:len_itens_netsysbenf] = itens_netsysbenf



dummy_countings_itens_info_quality[1:len_itens_info_quality] = countings_itens_info_quality
dummy_countings_itens_sys_quality[1:len_itens_sys_quality] = countings_itens_sys_quality
dummy_countings_itens_serv_quality[1:len_itens_serv_quality]= countings_itens_serv_quality
dummy_countings_itens_userintent[1:len_itens_userintent] = countings_itens_userintent
dummy_countings_itens_usersatisf[1:len_itens_usersatisf] = countings_itens_usersatisf
dummy_countings_itens_netsysbenf[1:len_itens_netsysbenf] = countings_itens_netsysbenf

#Itens sizelist
vec_itens = vector(length = len_itens_info_quality + len_itens_sys_quality + len_itens_serv_quality + len_itens_userintent
                   + len_itens_usersatisf + len_itens_netsysbenf)


end_info_quality = len_itens_info_quality
end_sys_quality = (end_info_quality + len_itens_sys_quality)
end_serv_quality = (end_sys_quality + len_itens_serv_quality)
end_userintent = end_serv_quality + len_itens_userintent
end_usersatisf = end_userintent + len_itens_usersatisf
end_netsysbenf = end_usersatisf + len_itens_netsysbenf

# Vector with all the words

vec_itens[1:len_itens_info_quality] = itens_info_quality
vec_itens[end_info_quality: end_sys_quality] = itens_sys_quality
vec_itens[end_sys_quality:end_serv_quality] = itens_serv_quality
vec_itens[end_serv_quality:end_userintent] = itens_userintent
vec_itens[end_userintent:end_usersatisf] = itens_usersatisf
vec_itens[end_usersatisf:end_netsysbenf] = itens_netsysbenf



print(constructs_data)


print(vec_itens)

print(vec_num_itens)



total_countings = c(countings_itens_info_quality, countings_itens_sys_quality, countings_itens_serv_quality, 
                    countings_itens_userintent, countings_itens_usersatisf, countings_itens_netsysbenf)


# Create empty list to store vectors


all_countings_values_vect = c()

all_countings_counter = 0


counter_true = 0


for (wordvalue in all_countings){
  if (wordvalue == FALSE){
    all_countings_values_vect = c(all_countings_values_vect, 0)
    all_countings_counter = all_countings_counter + 1 
  }
  if (wordvalue == TRUE){
    all_countings_values_vect = c(all_countings_values_vect, 1)
    all_countings_counter = all_countings_counter + 1 
  }
}


########### PRINTS #############

print(all_countings)
print(length(all_countings_values_vect))
print(all_countings_values_vect)

print(length(vec_num_itens))



#Combining all data into a data frame


#wrong distribute by columns instead of rows
m1 = matrix(all_countings_values_vect, ncol=length(review_c_data), byrow=TRUE)

# m1 = matrix(all_countings_values_vect, ncol=length(vec_num_itens), byrow=TRUE)




df_items = data.frame (Comment = review_c_data)

print(m1)

m1 = t(m1)

colnames(m1) = vec_num_itens
df_items2 = as.data.frame(m1, stringsAsFactors=FALSE)


df_items = cbind(df_items, df_items2)


# construct_all = data.frame(Comment = review_c_data, vec_itens)

# construct_comment = data.frame(Comment = review_c_data, Itens= vec_num_itens, Countings_Itens = total_countings)

# construct_test = data.frame(Information_Quality = dummy_itens_info_quality, Countings = dummy_countings_itens_info_quality, 
#                             System_Quality = dummy_itens_sys_quality, Countings = dummy_countings_itens_sys_quality)


str(df_items)

# Write CSV in R
write.csv(df_items, file = "Construct_test.csv")



  
