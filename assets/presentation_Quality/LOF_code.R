# Affy spike-in experiment 12_13_02_U133A_Mer_Latin_Square_Expt4_R1.CEL
library(affy)

list.celfiles()  # look in working directory for spike-in experiment

spike.expt4 <- read.affybatch(filenames = list.celfiles(pattern = "Latin"))
spike.expt4.mas5 <- mas5(spike.expt4)

multi.grep <- function(x, y, z, list) {
    g.1 <- grep(x, list)
    g.2 <- grep(y, list)
    g.3 <- grep(z, list)
    c(g.1, g.2, g.3)
}
group.1 <- multi.grep("203508_at", "204563_at", "204513_s_at", featureNames(spike.expt4.mas))
group.1 <- multi.grep("203508_at", "204563_at", "204513_s_at", featureNames(spike.expt4.mas5))
group.1
spike.expt4.mas <- spike.expt4.mas5
rm(spike.expt4.mas5)
ls()

group.1 <- multi.grep("203508_at", "204563_at", "204513_s_at", featureNames(spike.expt4.mas))
group.2 <- multi.grep("204205_at", "204959_at", "207655_s_at", featureNames(spike.expt4.mas))
group.3 <- multi.grep("204836_at", "205291_at", "209795_at", featureNames(spike.expt4.mas))
group.4 <- multi.grep("207777_s_at", "204912_at", "205569_at", featureNames(spike.expt4.mas))
group.5 <- multi.grep("207160_at", "205692_s_at", "212827_at", featureNames(spike.expt4.mas))
group.6 <- multi.grep("209606_at", "205267_at", "204417_at", featureNames(spike.expt4.mas))
group.7 <- multi.grep("205398_s_at", "209734_at", "209354_at", featureNames(spike.expt4.mas))
group.8 <- multi.grep("206060_s_at", "205790_at", "200665_s_at", featureNames(spike.expt4.mas))
group.9 <- multi.grep("207641_at", "207540_s_at", "204430_s_at", featureNames(spike.expt4.mas))
group.10 <- multi.grep("203471_s_at", "204951_at", "207968_s_at", featureNames(spike.expt4.mas))
group.11 <- multi.grep("AFFX-r2-TagA_at", "AFFX-r2-TagB_at", "AFFX-r2-TagC_at", featureNames(spike.expt4.mas))
group.12 <- multi.grep("AFFX-r2-TagD_at", "AFFX-r2-TagE_at", "AFFX-r2-TagF_at", featureNames(spike.expt4.mas))
group.13 <- multi.grep("AFFX-r2-TagG_at", "AFFX-r2-TagH_at", "AFFX-DapX-3_at", featureNames(spike.expt4.mas))
group.14 <- multi.grep("AFFX-LysX-3_at", "AFFX-PheX-3_at", "AFFX-ThrX-3_at", featureNames(spike.expt4.mas))
spikes <- c(group.1, group.2, group.3, group.4, group.5, group.6, group.7, group.8, group.9, group.10, group.11, group.12, group.13, group.14)
spikes

spike.exprs <- exprs(spike.expt4.mas)[spikes]
concentration <- c(rep(0.5, 3), rep(1, 3), rep(2, 3), rep(4, 3), rep(8, 3), rep(16, 3), rep(32, 3), rep(64, 3), rep(128, 3), rep(256, 3), rep(512, 3), rep(0, 3), rep(0.125, 3), rep(0.25, 3))
plot(concentration, spike.exprs)
exprs(spike.expt4.mas)
head(exprs(spike.expt4.mas))

# Auxillary functions used in the main lack.of.fit function
ss <- function(x) {
    sum((x - mean(x))^2)
}
df <- function(x) {
    length(x) - 1
}

lack.of.fit <- function(x, y) {
    aov.fit <- aov(y ~ x)
    SSE <- sum(aov.fit$residuals^2)
    dfE <- aov.fit$df.residual
    keep.x <- x[duplicated(x)]
    new.x <- x[x %in% keep.x]
    new.y <- y[x %in% keep.x]
    by.x.ss <- by(new.y, INDICES = new.x, ss)
    sspe <- sum(by.x.ss)
    by.x.df <- by(new.y, INDICES = new.x, df)
    dfpe <- sum(by.x.df)
    SS.lack <- SSE - sspe
    df.lack <- dfE - dfpe
    F.test <- (SS.lack/df.lack)/(sspe/dfpe)
    output <- list(F.test, 1 - pf(F.test, df.lack, dfpe))
    names(output) <- c("F.test", "p.value")
    output
}

ls()

lack.of.fit(concentration, spike.exprs)  # p = 0.33, do not reject H0, straight line
