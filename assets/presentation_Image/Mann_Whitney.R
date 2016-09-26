### Mann-Whitney demo
background<- c(164, 209, 225, 215, 200, 145, 294, 259, 374, 319, 238, 275, 358, 286, 267, 372, 369, 356, 378, 190)
foreground<- c(438, 511, 562, 432, 433, 542, 514, 530, 597, 595, 621, 672, 542, 555, 518, 594)
length(background) # 20 background pixels
length(foreground) # 16 foreground pixels

y <- sample(background, 8) # Randomly sample 8 obs from background (above line)
y
# Sort the foreground intensities; select 8 lowest:
x <- foreground[order(foreground)]
x
# Pull off the first smallest 8:
x <- foreground[order(foreground)][1:8]
x

# Perform Mann-Whitney test AKA Wilcoxon ranked sum test
xy <- c(x, y) # Combine selected background and foreground pixels
ind.xy <- rep(1:2, each=8) # Vector of indicator for foreground/background intensities
ind.xy # in ind.xy, 1=foreground, 2=background
xy

rank(xy) # Rank the combined pisels
cbind(xy, ind.xy, rank(xy)) # Bind them all together

W <- sum(rank(xy)[ind.xy == 1]) # Test statistics W
W

?qwilcox
qwilcox(0.05, 8, 8, lower.tail = FALSE)
U <- qwilcox(0.05, 8, 8, lower.tail = FALSE)	# Mann-Whitney U !!!
W.critical <- U + 8 * (8 + 1) / 2 # Translate to W = U + n * (n + 1) / 2
W.critical # Our W > W.critical, reject null, we have true foreground

wilcox.test(x, y, alternative = "greater")	### Shortcut !

