# 📸 Interface Graphique de Traitement d’Images avec MATLAB App Designer  
*Application interactive pour explorer et appliquer des techniques de traitement d’images*

Ce projet propose une application développée avec **MATLAB App Designer** permettant de manipuler des images de manière intuitive à travers trois volets fonctionnels. Conçu comme un outil d’apprentissage, il permet d’expérimenter des traitements d’images courants (conversion, ajustements, filtrage, détection de contours), tout en proposant une **interface soignée et interactive**.

---

## 🧠 Présentation du Projet

- 🎓 **Objectif** : Créer une application exécutable permettant d’explorer les principales techniques de traitement d’images.
- 🛠️ **Technologies** : MATLAB App Designer + scripts `.m`
- 📆 **Année** : 2025
- 🧑‍🏫 **Encadrement** : Projet académique réalisé dans le cadre d’une formation en ingénierie

---

## ✨ Fonctionnalités

### 🧩 Volet 1 — Importation & Grayscale
- 📥 Importer une image via une boîte de dialogue
- 📐 Afficher les dimensions de l’image
- 🌫️ Convertir une image RGB en niveaux de gris

### 🎛️ Volet 2 — Ajustements & Histogrammes
- 🌞 Ajuster la **brillance** avec un curseur
- 🌗 Modifier le **contraste**
- ⚙️ Appliquer une **correction gamma**
- 📊 Générer et **égaliser l’histogramme**

### 🧼 Volet 3 — Bruitage, Filtrage & Contours
- 🧪 Ajouter du bruit (paramétrable)
- 🧹 Appliquer des filtres : moyenneur, médian, ordre
- 🧭 Détecter les contours (Sobel, Prewitt, Canny)

### 🎨 Autres fonctionnalités
- 💾 Sauvegarde de l’image modifiée
- 🔄 Rotation d’image
- 🖼️ Interface graphique enrichie (logos, icônes)

---

## 🖥️ Interface Utilisateur

L’interface est divisée en **trois onglets** principaux :
- **Basique** : importation, conversion en niveaux de gris
- **Ajustements** : brillance, contraste, gamma, histogramme
- **Filtrage & Contours** : bruit, filtres, détection de bords

Chaque onglet propose des **composants interactifs** (curseurs, boutons, axes, menus déroulants), et les traitements sont appliqués en temps réel sur une image affichée.

---

## 🗂️ Structure du Dépôt

```
Interface_Graphique/
├── app_projet.mlapp         # Fichier principal App Designer
├── *.m                      # Scripts de traitement (filtrage, histogrammes, etc.)
├── ImageTest.jpg            # Image d’exemple pour les tests
├── logoFstm.png             # Logo (affiché dans l’interface)
├── savelcon.png             # Icône de sauvegarde
├── app_projet.exe           # Exécutable généré (optionnel)
├── MCRInstaller.exe         # Installateur MATLAB Runtime (optionnel)
└── README.md                # Documentation du projet
```

---

## 🚀 Exécution & Déploiement

### ⚙️ Prérequis
- 💻 **Système** : Windows (testé avec R2022b)
- 📦 **MATLAB Runtime** (R2022b requis)
  - Vérifier avec :
    ```matlab
    >> mcrinstaller
    ```
  - Sinon, installer depuis : [mathworks.com/products/compiler/mcr](https://www.mathworks.com/products/compiler/mcr/index.html)

### 🧪 Pour lancer l’application :
1. Télécharger `app_projet.exe` et `MCRInstaller.exe`
2. Installer MATLAB Runtime si nécessaire
3. Exécuter `app_projet.exe` en double-cliquant

---

## 🛠️ Génération de l’exécutable (développeurs)

1. Ouvrir MATLAB
2. Lancer le compilateur avec :
   ```matlab
   >> deploytool
   ```
3. Sélectionner **Application Compiler**
4. Charger `app_projet.mlapp` comme fichier principal
5. Ajouter les fichiers `.m` nécessaires (scripts de traitement)
6. Cocher “Runtime included” si besoin, puis compiler

---

## 🎓 Démonstration & Tests

- Tester avec l’image `ImageTest.jpg`
- Appliquer divers traitements : conversion, histogramme, filtrage, etc.
- Tester la sauvegarde et la rotation
- Ajouter vos propres images pour explorer plus de cas

---

## 🤝 Contribution

Les contributions sont bienvenues !  
Proposez une amélioration, corrigez un bug ou ajoutez un filtre 👇

```bash
git clone https://github.com/HaMzaCheh/Interface_Graphique.git
cd Interface_Graphique
git checkout -b nouvelle-fonctionnalite
# Modifier et tester
git push origin nouvelle-fonctionnalite
# Créez une pull request sur GitHub
```

---

## 📬 Contact & Support

- ✉️ Email : [contactchehaibi@gmail.com](mailto:contactchehaibi@gmail.comm)

---

## 📄 Licence

Distribué sous la licence **MIT**. Voir le fichier [LICENSE](LICENSE).

---

## 🙏 Remerciements

Merci d’avoir pris le temps d’explorer ce projet !  
N’hésitez pas à l’utiliser dans vos projets académiques ou à l’améliorer.  
Bonne exploration du traitement d’images avec MATLAB ! 🎓📷

