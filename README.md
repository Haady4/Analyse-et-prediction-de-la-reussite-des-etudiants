# Analyse et prédiction de la réussite des étudiants

Projet de Programmation Data Science (Licence 3 Informatique, Université Amadou Mahtar Mbow, 2026). Analyse des facteurs de réussite sur un jeu de données simulé de 500 étudiants, puis prédiction de la réussite avec un modèle de classification.

## Démarche

- Génération du jeu de données avec NumPy (graine fixée à 42)
- Nettoyage avec Pandas : doublons, valeurs manquantes, types
- Analyse exploratoire et 13 graphiques (Matplotlib, Seaborn, puis R)
- Reproduction d'une partie de l'analyse en R avec des résultats identiques à Python
- Régression logistique avec scikit-learn, évaluée par validation croisée

## Résultats

- Exactitude de 75 % en validation croisée, contre 63 % pour un modèle qui prédit toujours « Échec »
- Les heures d'étude et les absences sont les facteurs les plus influents
- Le modèle se trompe surtout sur les étudiants proches de la moyenne de 10

## Technologies

Python, R, Jupyter, NumPy, Pandas, Matplotlib, Seaborn, scikit-learn

## Contenu du dépôt

- data : jeu de données brut et nettoyé
- python : notebooks de préparation et d'analyse exploratoire
- R : script d'analyse
- model : notebook de prédiction
- figures : graphiques
- rapport : rapport du projet

## Limites

Les données sont simulées : les conclusions décrivent ce jeu de données et ne s'appliquent pas telles quelles à une vraie université.

## Auteure

Hady Dieng, étudiante en Licence 3 Informatique, Université Amadou Mahtar Mbow.
