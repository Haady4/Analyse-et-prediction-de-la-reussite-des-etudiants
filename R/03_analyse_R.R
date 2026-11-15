# 03_analyse_R.R : analyse de la réussite des étudiants avec R
library(ggplot2)

# 1. Importation de la base nettoyée
df <- read.csv("data/etudiants_propre.csv", stringsAsFactors = TRUE)

# 2. Premières lignes et structure
head(df)
str(df)
dim(df)
# 3. Sélection de colonnes et de lignes
head(df[, c("id_etudiant", "filiere", "niveau", "moyenne", "resultat")])
df[1:5, ]
# 4. Filtress
reussis <- df[df$resultat == "Réussi", ]
nrow(reussis)

info_L3 <- subset(df, filiere == "Informatique" & niveau == "L3")
nrow(info_L3)

beaucoup_abs <- subset(df, absences >= 8)
nrow(beaucoup_abs)
# 5. Statistiques de base
mean(df$moyenne)
median(df$moyenne)
sd(df$moyenne)
summary(df$moyenne)

table(df$resultat)
prop.table(table(df$resultat))

tapply(df$moyenne, df$filiere, mean)
cor(df$heures_etude, df$moyenne)
# 6. Tri et transformation
top10 <- head(df[order(-df$moyenne), c("id_etudiant", "filiere", "moyenne")], 10)
top10

df$mention <- cut(df$moyenne,
                  breaks = c(0, 10, 12, 14, 20),
                  labels = c("Insuffisant", "Passable", "Assez bien", "Bien et plus"),
                  right = FALSE)
table(df$mention)
# 7. Graphiques
dir.create("figures", showWarnings = FALSE)

# Histogramme 
png("figures/R_histogramme.png", width = 800, height = 500)
hist(df$moyenne, breaks = 20, col = "steelblue",
     main = "Distribution des moyennes générales",
     xlab = "Moyenne générale (/20)", ylab = "Nombre d'étudiants")
abline(v = 10, col = "red", lty = 2, lwd = 2)
dev.off()

# Diagramme en barres 
png("figures/R_barres.png", width = 800, height = 500)
barplot(tapply(df$moyenne, df$filiere, mean), col = "steelblue",
        main = "Moyenne générale par filière",
        xlab = "Filière", ylab = "Moyenne (/20)", ylim = c(0, 20))
dev.off()

# Boxplot
png("figures/R_boxplot.png", width = 800, height = 500)
boxplot(moyenne ~ niveau, data = df, col = "lightblue",
        main = "Moyennes selon le niveau",
        xlab = "Niveau", ylab = "Moyenne (/20)")
dev.off()

# Nuage de points 
png("figures/R_nuage.png", width = 800, height = 500)
plot(df$heures_etude, df$moyenne, pch = 19, col = rgb(0, 0, 1, 0.4),
     main = "Heures d'étude et moyenne",
     xlab = "Heures d'étude par semaine", ylab = "Moyenne (/20)")
abline(lm(moyenne ~ heures_etude, data = df), col = "red", lwd = 2)
dev.off()

# Graphique ggplot2 
g <- ggplot(df, aes(x = heures_etude, y = moyenne, color = resultat)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Heures d'étude, moyenne et résultat",
       x = "Heures d'étude par semaine", y = "Moyenne générale (/20)",
       color = "Résultat") +
  theme_minimal()
print(g)
ggsave("figures/R_ggplot.png", g, width = 8, height = 5, dpi = 150)
