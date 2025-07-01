% Fonction pour mettre à l'échelle une image ou matrice suivant un coefficient
function C = mise_echelle(A, coef)
    % A: Matrice d'entrée (image ou matrice 2D/3D)
    % coef: Coefficient de mise à l'échelle (entier > 0)
    
    % Obtenir la taille de la matrice d'entrée (n = lignes, m = colonnes, k = canaux)
    [n, m, k] = size(A);

    % Créer une nouvelle matrice vide avec des dimensions adaptées au coefficient
    C = zeros(n * coef, m * coef, k, 'uint8');  % Initialisation de la matrice redimensionnée

    % Boucles pour parcourir chaque élément de la matrice originale
    for i = 1:n
        for j = 1:m
            % Calcul des indices dans la matrice de sortie
            i1 = (i - 1) * coef + 1;  % Première ligne où le bloc commence
            i2 = i * coef;            % Dernière ligne du bloc
            j1 = (j - 1) * coef + 1;  % Première colonne où le bloc commence
            j2 = j * coef;            % Dernière colonne du bloc
            
            % Si l'image est en couleur (RGB) on traite chaque canal séparément
            for ch = 1:k
                % Remplir la matrice C avec la valeur de A(i,j,ch) dans le bloc correspondant
                C(i1:i2, j1:j2, ch) = A(i, j, ch);
            end
        end
    end
end
