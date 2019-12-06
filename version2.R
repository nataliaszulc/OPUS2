library(visNetwork)
library(dplyr)

label_vec <- c(red = "seeding", green = "acceleration", 
               black = "slowing down")


nodes <- read.csv("nodes.csv") %>% 
  mutate(shape = "box")

edges <- read.csv("edges.csv") %>% 
  mutate(title = paste0('<a target="_blank" href="https://doi.org/', doi, '">', doi, '</a>'),
         label = "")

net <- visNetwork(nodes, edges, main = "Cross-talk between peptides", width = 1600, height = 900) %>%
  visEdges(arrows = "to", width = 2)  %>% 
  visLayout(randomSeed = 1337) %>% 
  visOptions(highlightNearest = list(enabled = TRUE, degree = 1,
                                     labelOnly = FALSE, hover = TRUE),
             nodesIdSelection = list(enabled = TRUE)) %>% 
  visLegend(addEdges = data.frame(color = names(label_vec), 
                                  label = label_vec,
                                  width = 2),
            width = 0.2) %>% 
  visInteraction(zoomView = TRUE) 

# write.csv(nodes, file = "nodes.csv")
# write.csv(edges, file = "edges.csv")

visSave(net, file = "cross-talk2.html")

