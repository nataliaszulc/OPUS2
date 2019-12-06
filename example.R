library(visNetwork)

nodes <- data.frame(id = 1:3, label = LETTERS[1L:3], title = paste0("Reference", 1L:3))
edges <- data.frame(from = c(1,2, 1), to = c(2, 1, 3), label = c("CI", "CI", "NCI"))
visNetwork(nodes, edges, width = "100%")
